# ====================
# STAGE 1: Build stage
# ====================

FROM python:3.13-slim AS builder

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Creates application directory
RUN mkdir /django_cars
WORKDIR /django_cars

# Update pip and install system dependencies for Poetry and build
RUN apt-get update && \
    apt-get install -y curl build-essential libpq-dev && \
    rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

# Add Poetry to PATH
ENV PATH="/root/.local/bin:$PATH"

# Copy project files
COPY pyproject.toml poetry.lock /django_cars/

# Install project dependencies via Poetry without creating virtualenv
RUN poetry config virtualenvs.create false \
    && poetry install --no-interaction --no-ansi --no-root



# =========================
# STAGE 2: Production stage
# =========================

FROM python:3.13-slim

# Environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PYTHONPATH=/django_cars/src:$PYTHONPATH

# System dependencies
RUN apt-get update && \
    apt-get install -y netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Create user and folders
RUN useradd -m -r appuser && \
    mkdir -p /django_cars/data/staticfiles /django_cars/data/mediafiles && \
    chown -R appuser:appuser /django_cars /django_cars/data

# Copy Python packages installed in the builder
COPY --from=builder /usr/local/lib/python3.13/site-packages/ /usr/local/lib/python3.13/site-packages/
COPY --from=builder /usr/local/bin/ /usr/local/bin/
RUN chown -R appuser:appuser /usr/local/lib/python3.13/site-packages/

# Define working directory
WORKDIR /django_cars

# Copy source code
COPY --chown=appuser:appuser src/ src/
COPY --chown=appuser:appuser scripts/ scripts/

# Make entrypoint executable
RUN chmod -R +x scripts/entrypoint.sh

# Define user
USER appuser

# Exposed door
EXPOSE 8000

# Entrypoint
ENTRYPOINT ["/django_cars/scripts/entrypoint.sh"]

# Default command
CMD ["gunicorn", "core.wsgi:application"]
