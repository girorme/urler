FROM elixir:1.14.0-alpine

# Inotify para hotreload
RUN apk add inotify-tools

# instalando o gerenciar de pacotes do elixir
RUN mix local.hex --force && \
    mix local.rebar --force

# também funciona essa sintaxe:
# RUN mix do local.hex --force, local.rebar --force

# copiar tudo da raiz do projeto para o contêiner docker
COPY . .

# instalar as dependencias
#RUN HEX_HTTP_CONCURRENCY=1 HEX_HTTP_TIMEOUT=120 mix deps.get

# executar o servidor
#CMD ["iex", "-S", "mix"]