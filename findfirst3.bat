@echo off
::����஢���� ��� ��ਠ�⮢ ���᪠ ��ࢮ�� 䠩�� �� ��᪥.
::��ਠ���:
::	1.�����६���� ���� ��ࢮ�� �宦����� ��� ��� ⨯�� 䠩��� � ����� 横��.
::	2.��᫥����⥫�� ���� ��ࢮ�� �宦����� ��� ⨯�� 䠩���, ����� ⨯ 䠩��� � ᢮�� 横��, ��᫥����⥫�� ����.
::	3.��ࠫ����� ���� ��ࢮ�� �宦����� ��� ⨯�� 䠩���, ����� ⨯ 䠩��� � ᢮�� �����. ��������� ����� � ������� �६����� 䠩���. ���� ��᫥����� ⨯� 䠩��� ����᪠���� � �᭮���� �����.
::��ࠬ����: %1 - ���� � ��⠫���, � ���஬ �㤥� �ந�������� ����.
::��ਠ�� 3
setlocal enabledelayedexpansion
if "%~2" equ "findfirst" goto:findfirst

set "alltypes=*.jpg *.png *.gif"
set "jpgtype=*.jpg *.jpe *.jpeg"
set "pngtype=*.png"
set "giftype=*.gif"
set "jpglock=jpg.lck"
set "pnglock=png.lck"
set "giflock=gif.lck"
set "jpgtmp=jpg.tmp"
set "pngtmp=png.tmp"
set "giftmp=gif.tmp"
set "timeout=3000"

echo.3.��ࠫ����� ���� (����� ⨯ 䠩��� � ᢮�� �����)
call:initvars
echo.%time%
::���� ����ᮢ
start /b cmd /c "%~0 %~1 findfirst jpg"
start /b cmd /c "%~0 %~1 findfirst png"
::start /b cmd /c "%~0 %~1 findfirst gif"
call:findfirst "%~1" findfirst gif

::�஢�ઠ �����襭���� ����ᮢ
call:waitforfile "%jpglock%"
call:waitforfile "%pnglock%"
::call:waitforfile "%giflock%"

::�⮣�
echo.%time%
<"%jpgtmp%" set /p "jpg="
<"%pngtmp%" set /p "png="
<"%giftmp%" set /p "gif="
echo.jpg=%jpg%	png=%png%	gif=%gif%
if defined jpg if defined png if defined gif (echo.������� �� ⨯� & goto:fin3)
echo.������� �� �� ⨯�
:fin3
1>nul 2>&1 del /f/q "%jpgtmp%" "%pngtmp%" "%giftmp%"

exit /b

:waitforfile
if exist "%~1" (1>nul 2>&1 ping -n 1 -w %timeout% 127.255.255.255 & goto:waitforfile)
exit /b

:initvars
set "jpg="
set "png="
set "gif="
exit /b

:findfirst
call set "lck=%%%~3lock%%"
call set "ftmp=%%%~3tmp%%"
call set "type=%%%~3type%%"
>"%lck%" echo.
for /r "%~1" %%a in (%type%) do (>"%ftmp%" echo.1 & goto:endfindfirst)
>"%ftmp%" echo.0
:endfindfirst
1>nul del /f/q "%lck%"
exit /b
