APP_NAME=$1
PROOT="../$APP_NAME"
GI=".gitignore"

rails new ${PROOT} --skip-test-unit

rm ${PROOT}/Gemfile
rm ${PROOT}/${GI}

cp rb_gemfile ${PROOT}
cp rb_gitignore ${PROOT}
cp update_readme.rb ${PROOT}

cd ${PROOT}

mv rb_gemfile Gemfile
mv rb_gitignore ${GI}

bundle install --without produciton
bundle update
bundle install

rails generate rspec:install

rm README.rdoc

ruby update_readme.rb ${APP_NAME}
rm update_readme.rb

rm public/index.html

git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/jstkim7/${APP_NAME}.git
git push -u origin master

echo "Complete!"
