echo "Remove github reva"
c:
cd \datas\code\reva
@rem gh auth refresh -h github.com -s delete_repo
gh repo delete Michael-MWI/reva
@rem pause

echo "Remove local git repo"
c:
cd \datas\code\
rmdir /Q /S reva

echo "Clone github reva"
gh repo fork SocialGouv/reva --clone

@echo off
cd c:\datas\code\reva
gh repo set-default Michael-MWI/reva

cd \datas\code
echo "Force codeQL"
xcopy /Q /Y /S /I c:\datas\code\betacodeQL\.github c:\datas\code\reva\.github

cd reva
git add .github/

git commit -m "Configure codeQL"
git push