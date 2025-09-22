# Project Cars


<a href="https://cars.peron.dev.br/">
    <img src="https://img.shields.io/badge/Acessar%20Aplicação-Online-brightgreen" alt="Link para Aplicação Online">
</a>

<p align="center">
    <img src=".github/assets/banner.png" alt="Logo do Projeto" width=""/>
</p>

<br>

### 📝 Índice

* [Descrição](#-descrição)
* [Funcionalidades](#-funcionalidades)
* [Tecnologias Utilizadas](#️-tecnologias-utilizadas)
* [Instalação e Execução](#️-instalação-e-execução)
* [Como Utilizar](#-como-utilizar)
* [Créditos e Agradecimentos](#-créditos-e-agradecimentos)

<br>

## 📖 Descrição

__Este projeto__ é uma plataforma web full-stack desenhada para servir como a vitrine digital e sistema de gestão de inventário para uma concessionária de veículos seminovos.

* __Qual problema este projeto resolve?__
    Ele resolve o desafio de concessionárias que dependem de processos manuais e ineficientes para gerir e exibir o seu estoque online. A plataforma automatiza tarefas repetitivas, como a criação de descrição e o processamento de imagens, e centraliza toda a gestão do inventário em uma área administrativa segura.
    <br>

* __Qual é o seu objetivo principal?__
    O objetivo principal é fornecer uma experiência de alta qualidade tanto para os clientes como para os funcionários. Para os clientes, oferece uma interface rápida, intuitiva e rica em informações para encontrar o seu próximo veículo. Para os funcionários, oferece uma ferramenta poderosa e segura para gerir o ciclo de vida de um carro no inventário, desde o cadastro até à venda.
    <br>

* __Para quem este projeto é destinado?__
    A aplicação tem dois púplicos-alvo distintos:
    1. __Clientes finais__: O público geral que visita o site em busca de um veículo para comprar;
    2. __Utilizadores internos__: Os funcionários da concessionária.
    <br>


## ✨ Funcionalidades

Este projeto implementa uma vasta gama de funcionalidades que demonstram as melhores práticas de desenvolvimento web moderno.


__Back-End & Área Administrativa (Django)__

* __Gestão de Inventário Completa (CRUD)__: Funcionalidades para Criar, Ler, Atualizar e Apagar veículos através de uma área de dashboard segura.

* __Sistema de Status Automático__: A lógica de negócio para o status do veículo (Disponível, Estoque Antigo, Vendido) é gerida automaticamente.

* __Sistema de Permissões Robusto__: Utilizadores normais (funcionários) só podem editar ou apagar os veículos pelos quais são responsáveis, enquanto administradores (staff) têm controlo total.

* __Registo com Aprovação__: Um sistema de registo de funcionários onde as novas contas precisam de ser aprovadas por um superutilizador no Django Admin antes de poderem aceder ao sistema.

* __Geração de Descrição com IA__: Integração com a API do Google Gemini para gerar descrições de marketing para os veículos automaticamente, acionada por um signal.

* __Processamento de Imagem Avançado__: Todas as imagens enviadas (tanto no front-end como no admin) são automaticamente redimensionadas para uma proporção padrão (com preenchimento, sem cortes) e convertidas para o formato moderno e eficiente WEBP.

* __Criação Dinâmica de Dados__: No formulário de cadastro de carros, os funcionários podem adicionar novas Marcas e Opcionais em tempo real através de um pop-up (modal) com AJAX, sem nunca sair da página.

* __Painel Administrativo Customizado__: O Django Admin foi personalizado para exibir os títulos e o logótipo da empresa, e para usar formulários customizados que aplicam a mesma lógica de processamento de imagem do site principal.
<br>

__Front-End & Experiência do Utilizador (UX)__

* __Design Responsivo__: Interface totalmente adaptável para desktops, tablets e dispositivos móveis, construída com Bootstrap.

* __Página Inicial Dinâmica__: Exibe os veículos mais recentes em destaque e conteúdo de marketing (vantagens, depoimentos) gerido dinamicamente pelo painel administrativo.

* __Listagem de Estoque Completa__: Página de inventário com paginação para uma navegação fluida, mesmo com um grande número de veículos.

* __Busca Inteligente__: Funcionalidade de pesquisa que filtra o estoque por marca ou modelo.

* __Galeria de Imagens Interativa__: Na página de detalhe do veículo, uma galeria com imagem principal, miniaturas clicáveis e botões de navegação.

* __Integração com WhatsApp__: Botão de "Verificar Disponibilidade" que abre o WhatsApp com uma mensagem automática e personalizada, incluindo os detalhes do veículo de interesse.

* __Página 404 Personalizada__: Uma página de erro amigável e consistente com a identidade visual do site.
<br>

__Arquitetura & DevOps__

* __Estrutura de Projeto Limpa__: O projeto segue uma arquitetura modular com o código-fonte isolado num diretório `src/`, separando as aplicações por responsabilidade (`core`, `cars`, `users`, `site_config`).

* Ambiente Containerizado: A aplicação é totalmente gerida com Docker e Docker Compose, garantindo um ambiente de desenvolvimento consistente e preparado para o deploy.

* Serviços Profissionais: Utiliza Nginx como proxy reverso e para servir ficheiros estáticos/media, e Gunicorn como servidor de aplicação WSGI.

* Gestão de Dependências Moderna: Usa `Poetry` para uma gestão de dependências robusta e reprodutível.

* Configuração Segura: Usa variáveis de ambiente (ficheiro `.env`) para gerir segredos como chaves de API e senhas, com um ficheiro `.env.example` para documentação.
<br>

__🚧 Funcionalidades em desenvolvimento__: Tarefas Assíncronas e Agendadas: A arquitetura será preparada para usar Celery e Redis para executar tarefas demoradas (como a chamada à IA) em segundo plano e para executar tarefas agendadas (como a atualização do status para "Estoque Antigo").


## 🛠️ Tecnologias Utilizadas

As principais tecnologias, frameworks e ferramentas utilizadas na construção deste projeto são:

* __Back-end__:
    * Python 3.13+
    * Django 5.2+
    * Gunicorn (Servidor de Aplicação WSGI)
    * Google Generative AI (para a API do Gemini)
    * Pillow (para o processamento de imagens)
    <br>

* __Front-End__:
    * HTML5
    * CSS3
    * JavaScript (Vanilla ES6+)
    * Bootstrap 5 (Framework CSS)
    * Font Awesome (Ícones)
    <br>

* __Arquitetura & DevOps__:
    * Docker & Docker Compose (Containerização)
    * Nginx (Proxy Reverso e Servidor de Ficheiros Estáticos)
    * Poetry (Gestão de Dependências e Pacotes)
    * Git & GitHub (Controlo de Versões)
    <br>


## ⚙️ Instalação e Execução

Siga este guia passo a passo para configurar e executar o projeto no seu ambiente local.

__Pré-requisitos__
Antes de começar, garanta que você tem as seguintes ferramentas instaladas na sua máquina:
* [Docker](https://www.docker.com/get-started)
* [Docker-Compose](https://docs.docker.com/compose/install/)

1. __Clone o repositório__
    ```sh
    git clone https://github.com/tperons/project-cars
    cd project-cars
    ```

2. __Configure as Variáveis de Ambiente__
    O projeto usa um ficheiro `.env` para gerir as configurações sensíveis. Crie uma cópia do ficheiro de exemplo:
    ```sh
    cp .env.example .env
    ```
    Agora, abra o ficheiro `.env` e preencha os valores para as variáveis.

3. __Construa as imagens Docker__
    ```sh
    docker compose build
    ```

4. __Inicie os serviços__
    ```sh
    docker compose up -d
    ```
5. __Configuração Inicial da Base de Dados__
    Com os containeres a funcionar, execute os seguintes comandos para preparar a base de dados:
    
    * __Aplique as migrações:__
        ```sh
        docker compose exec django-cars python src/manage.py migrate
        ```

    * __Crie um superutilizador__ para aceder à área administrativa:
        ```sh
        docker compose exec django-cars python src/manage.py createsuperuser
        ```
    <br>


## 🚀 Como Utilizar

Após a instalação, a sua aplicação estará acessível e pronta para ser usada. Existem dois fluxos de utilização principais:

__Fluxo do Cliente (Site Público)__
* __Acesse o site__: Abra o seu navegador e vá para http://localhost:8080/.
* __Navegue pelo conteúdo__: Explore a página inicial, veja os carros em destaque e use a barra de navegação para aceder à página de Estoque.
* __Pesquise e Filtre__: Use a barra de pesquisa na página inicial ou na página de estoque para encontrar veículos por marca ou modelo.
* __Veja os Detalhes__: Clique em "Ver Detalhes" num carro para aceder à sua página de detalhe, onde pode ver todas as suas especificações e navegar pela galeria de imagens interativa.
* __Entre em Contacto__: Se estiver interessado num veículo, clique no botão "Verificar Disponibilidade" para abrir o WhatsApp com uma mensagem automática e personalizada, pronta a ser enviada.
<br>

__Fluxo do Funcionário (Área Administrativa)__
* __Aceda à Área de Login__: Navegue para a página de login da área de funcionários.
* __Faça o Login__: Use as credenciais do superutilizador que você criou durante a instalação.
* __Aceda à Dashboard__: Após o login, você será redirecionado para a sua dashboard, que exibe os principais KPIs do negócio e uma tabela para a gestão do estoque.
* __Adicione um Novo Veículo__: Clique em "Adicionar Novo Veículo" para aceder ao formulário de cadastro. Preencha os dados e adicione as imagens. Note que as imagens serão automaticamente processadas (redimensionadas e convertidas para WEBP).
* __Gerir Veículos Existentes__: Na tabela da dashboard, use os botões de ação para:
    * __Editar__: Alterar qualquer informação de um veículo.
    * __Marcar como Vendido__: Mudar o status de um carro para "Vendido" e registar a data da venda.
    * __Apagar__: Remover um registo do inventário (com uma etapa de confirmação).
* __Aceda ao Django Admin__: Para tarefas mais avançadas, como aprovar novos funcionários ou gerir o conteúdo global do site (títulos, textos, links), acesse http://localhost/admin/.


## 📜 Créditos e Agradecimentos

Para fins de demonstração, as imagens dos veículos utilizadas neste projeto foram obtidas a partir de fontes externas. Todos os direitos sobre estas imagens pertencem aos seus respetivos proprietários e criadores.

__Fonte Principal__: [Carros na Web](https://www.carrosnaweb.com.br/default.asp)