@echo off 
echo                                         CREATING A REPO FROM SCRATCH 
echo                                         -----------------------------
echo(
set /p proj_folder="Please enter the name of the Project Directory: "   
cd ../%proj_folder%
    
set /p url="Please enter the full URL: "
set /p url-name="Please enter URL name: "
set /p commit_message="Please enter commit message: "
set /p branch_name="Please enter name of the active branch (Should be 'develop'): "

echo Helping you create a git repository from scratch and push it to %url-name% on server !


echo git init
git init
echo git checkout -b %branch_name%
git checkout -b %branch_name%
echo git remote add %url-name% %url%
git remote add %url-name% %url%
echo git status
git status
echo git add -A
git add -A 
echo.
echo %commit_message%
set /p confirm_commit_msg="Are you sure to proceed with the above commit message?(Y/N) "

if %confirm_commit_msg%==Y goto commit
if %confirm_commit_msg%==y goto commit
if %confirm_commit_msg%==N goto recommit
if %confirm_commit_msg%==n goto recommit

:recommit
set /p commit_message="Please enter the new/edited commit message: "

:commit
echo git commit -m "%commit_message%"
git commit -m "%commit_message%"
echo git branch -d master
git branch -d master
echo git push %url-name% %branch_name%
git push %url-name% %branch_name%

pause