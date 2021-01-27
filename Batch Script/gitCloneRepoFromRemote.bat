@echo off
echo                                       FOR CLONING A REPO FROM GITHUB
echo                                       -------------------------------                          
echo( 
cd ..    

set /p clone="Want to clone a github repository?(Y/N) "
if %clone%==N goto no_clone_repo
if %clone%==n goto no_clone_repo
if %clone%==Y goto yes_clone_repo
if %clone%==y goto yes_clone_repo

:no_clone_repo
goto url_name_change

:yes_clone_repo
set /p url="Please enter the github URL to clone the Project from: "
echo git clone %url%
git clone %url%

echo(
set /p proj_folder="Please enter the name of the Project Directory: "
cd %proj_folder%

:url_name_change
set /p url_change="Do you want to change the URL name ? (Y/N)" 

if %url_change%==Y  goto yes_change_url
if %url_change%==y  goto yes_change_url
if %url_change%==N  goto no_change_url
if %url_change%==n  goto no_change_url

:yes_change_url
set /p url="Please set the URL: "
set /p url_name="Please set the URL name: "
echo git remote add %url_name% %url%
git remote add %url_name% %url%
echo git remote -v
git remote -v
goto branch_checkout

:no_change_url
set /p url="Please set the URL: "
echo git remote set-url origin %url%
git remote set-url origin %url%
echo git remote -v
git remote -v


:branch_checkout
echo Switching to 'develop' branch 
echo git checkout develop
git checkout develop


:delete_branch_start
set /p branch_del="Want to delete any branches?(Y/N) "

if %branch_del%==y goto deleting_branch
if %branch_del%==Y goto deleting_branch
if %branch_del%==N goto new_push
if %branch_del%==n goto new_push

:deleting_branch
set /p branch_del_names="Enter the name of one branch at a time and press Enter "
echo git branch -d %branch_del_names%
git branch -d %branch_del_names%
goto delete_branch_start 


:new_push
set /p push_to_your_repo="Do you want to push this project to your own github repo? (Y/N) "
if push_to_your_repo==Y goto yes_push
if push_to_your_repo==y goto yes_push
if push_to_your_repo==N goto no_push
if push_to_your_repo==n goto no_push

:yes_push
set /p final_url_name="Please enter the url name on which the repo is to be pushed: "
echo git push %final_url_name%
git push %final_url_name%
goto exitpoint

:no_push
goto exitpoint

:exitpoint
pause