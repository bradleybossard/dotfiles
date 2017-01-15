# Install node 6 and a bunch of tools I like globally

sudo apt-get install --yes curl

sudo sh -c 'curl -sL https://deb.nodesource.com/setup_7.x | bash -'

sudo apt-get install -y nodejs pkg-config libcairo2-dev \
libjpeg8-dev libpango1.0-dev libgif-dev build-essential g++

sudo npm install -g \
               angular-cli \
               babelify \
               browserify \
               bower \
               caniuse-cmd \
               express-generator \
               generator-angular-fullstack \
               grunt \
               gulp \
               gulp-cli \
               jspm \
               live-server \
               node-gyp \
               nodemon \
               protractor \
               quget \
               create-react-app \
               st \
               svgo \
               typescript \
               typings \
               watchify \
               webpack \
               webpack-dev-server \
               wintersmith \
               yarn \
               yo

               # node-inspector \
