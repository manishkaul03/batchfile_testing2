@echo off
echo                                           PUSHING COMMITS TO GITHUB
echo                                           -------------------------
echo.
set /p proj_folder="Please enter the name of the Project Directory: "   
cd ../%proj_folder%

echo For Your Reference:
git remote -v
echo.
set /p url-name="Please enter URL name: "
set /p commit_message="Please enter commit message: "
set /p branch_name="Please enter the name of active branch: "

echo Helping you commit your local changes to the %url-name% github repo

echo git checkout %branch_name%
git checkout %branch_name%
echo git fetch %url-name%
git fetch %url-name%
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
echo git push %url-name% %branch_name%
git push %url-name% %branch_name%

pause 