FROM ncareol/ruby:debian-for-rails-mariadb-2.3.3-2

RUN apt-get install -y libsqlite3-dev nodejs

ARG USERNAME=ruby
ARG UID=9000
ARG GID=9000

RUN groupadd --gid $GID $USERNAME

RUN adduser --disabled-password  --gecos ''  --uid $UID --gid $GID $USERNAME

USER $USERNAME
