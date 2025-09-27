from django.views.generic import ListView, TemplateView

from apps.cars.models import Car


class IndexView(ListView):
    model = Car
    template_name = 'pages/index.html'
    context_object_name = 'featured_cars'
    ordering = '-pk'

    def get_queryset(self):
        queryset = super().get_queryset()
        queryset = queryset.exclude(status=Car.Status.SOLD).order_by('-pk')[:3]
        return queryset

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context.update({
            'title': 'Sua Próxima Oportunidade Começa Aqui!',
        })
        return context


class Custom404View(TemplateView):
    template_name = 'global/404.html'

    def dispatch(self, request, *args, **kwargs):
        response = super().dispatch(request, *args, **kwargs)
        response.status_code = 404
        return response
