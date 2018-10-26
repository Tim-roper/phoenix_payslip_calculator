FROM hub.docker.com/erlang:21.1.1

# Setup non-standard repositories
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb \
    && dpkg -i erlang-solutions_1.0_all.deb

# Install stack dependencies
RUN apt-get update && \
    apt-get install -y locales git elixir nodejs

# Set the locale
RUN locale-gen en_AU.UTF-8
ENV LANG en_AU.UTF-8

# Add local node module binaries to PATH
ENV PATH=./node_modules/.bin:$PATH \
    MIX_HOME=/opt/mix \
    HEX_HOME=/opt/hex \
    HOME=/opt/app

# Install Hex+Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

EXPOSE 8080