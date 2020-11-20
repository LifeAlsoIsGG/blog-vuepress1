# deploy.sh文件
# 确保脚本抛出遇到的错误
set -e


# 生成静态文件
npm run build

# 进入生成的文件夹
cd ./public

# 如果是发布到自定义域名
# echo 'www.example.com' > CNAME

git init
git add -A
time=$(date "+%Y-%m-%d %H:%M:%S")
git commit -m "rebuild @${time}"

# 如果发布到 https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git master

# 如果发布到 https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:LifeAlsoIsGG/wiki-vuepress.git master:wiki-pages

cd -