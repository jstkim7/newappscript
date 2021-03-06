APP_NAME=$1
USER_NAME=$2
PROOT="../$APP_NAME"
GI=".gitignore"

rails new ${PROOT} --skip-test-unit

rm ${PROOT}/Gemfile
rm ${PROOT}/${GI}

cp rb_gemfile ${PROOT}
cp rb_gitignore ${PROOT}
cp update_readme.rb ${PROOT}
cp generate_application_helper.rb ${PROOT}
cp application_helper.txt ${PROOT}

cd ${PROOT}

mv rb_gemfile Gemfile
mv rb_gitignore ${GI}

bundle install --without produciton
bundle update
bundle install

rails generate rspec:install

rm README.rdoc

ruby update_readme.rb ${APP_NAME}
ruby generate_application_helper.rb ${APP_NAME}
rm update_readme.rb
rm generate_application_helper.rb
rm application_helper.txt
rm public/index.html



git init
git add .
git commit -m "Initial commit"

curl -u ${USER_NAME} https://api.github.com/user/repos -d {\"name\":\"${APP_NAME}\"}

git remote add origin https://github.com/${USER_NAME}/${APP_NAME}.git
git push -u origin master

echo "Complete!"
