# docker build -t osdakira/ruby:1.0  ./ubuntu/ruby
FROM osdakira/ubuntu:1.0

RUN echo "install ruby environment"
RUN git clone https://github.com/sstephenson/rbenv.git /root/.rbenv
RUN mkdir -p /root/.rbenv/plugins
RUN git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
RUN /root/.rbenv/plugins/ruby-build/install.sh
ENV PATH /root/.rbenv/bin:$PATH
RUN echo 'eval "$(rbenv init -)"' >> /etc/profile
RUN echo 'eval "$(rbenv init -)"' >> .bashrc

ENV CONFIGURE_OPTS --disable-install-doc
RUN eval "$(rbenv init -)"
RUN curl -fsSL https://gist.github.com/mislav/a18b9d7f0dc5b9efc162.txt | rbenv install --patch 2.1.0
# RUN rbenv install 2.1.0 # エラーに成る

RUN echo 'gem: --no-rdoc --no-ri' >> /.gemrc
