# Install node 6 and a bunch of tools I like globally

sudo sh -c 'curl -sL https://deb.nodesource.com/setup_7.x | bash -'

sudo apt-get install -y nodejs pkg-config libcairo2-dev \
libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++

sudo npm install -g webpack \
               webpack-dev-server \
               yarn \
               caniuse-cmd \
               st \
               wintersmith \
               bower \
               gulp \
               gulp-cli \
               yo \
               grunt \
               node-inspector \
               jspm \
               live-server \
               typescript \
               typings \
               nodemon \
               quget \
               angular-cli \
               protractor \
               browserify \
               watchify \
               babelify \
               generator-angular-fullstack \
               svgo

#              nativescript \
