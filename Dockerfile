FROM centos:centos6


# Enable EPEL for Node.js
RUN     rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
# Install Node.js and npm
RUN     yum install -y npm
RUN     yum install -y  rubygems
RUN     gem install -y  sass
RUN npm install -g express
RUN     npm install -g grunt-cli
RUN     npm install -g bower
RUN     npm install grunt-contrib-sass --save-dev
# Bundle app source
ADD . /src
# Set up an entry point that will add the mongo url as an env var
RUN chmod -R 700 /src
WORKDIR /src
EXPOSE  9090 35729
#if you want to use this docker file make a copy of env.sh into #your route

#USE THIS COMMAND IF YOU ARE USING THE SAMPLE APP
CMD ["node", "index.js"]

