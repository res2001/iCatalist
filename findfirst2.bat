@echo off
::����஢���� ��� ��ਠ�⮢ ���᪠ ��ࢮ�� 䠩�� �� ��᪥.
::��ਠ���:
::	1.�����६���� ���� ��ࢮ�� �宦����� ��� ��� ⨯�� 䠩��� � ����� 横��.
::	2.��᫥����⥫�� ���� ��ࢮ�� �宦����� ��� ⨯�� 䠩���, ����� ⨯ 䠩��� � ᢮�� 横��, ��᫥����⥫�� ����.
::	3.��ࠫ����� ���� ��ࢮ�� �宦����� ��� ⨯�� 䠩���, ����� ⨯ 䠩��� � ᢮�� �����. ��������� ����� � ������� �६����� 䠩���. ���� ��᫥����� ⨯� 䠩��� ����᪠���� � �᭮���� �����.
::��ࠬ����: %1 - ���� � ��⠫���, � ���஬ �㤥� �ந�������� ����.
::��ਠ�� 2
setlocal enabledelayedexpansion

set "alltypes=*.jpg *.png *.gif"
set "jpgtype=*.jpg *.jpe *.jpeg"
set "pngtype=*.png"
set "giftype=*.gif"

echo.2.��᫥����⥫�� ���� (����� ⨯ 䠩��� � ᢮�� 横��)
call:initvars
echo.%time%
for /r "%~1" %%a in (%jpgtype%) do set "jpg=1" & goto:fin2jpg
:fin2jpg
for /r "%~1" %%a in (%pngtype%) do set "png=1" & goto:fin2png
:fin2png
for /r "%~1" %%a in (%giftype%) do set "gif=1" & goto:fin2gif
:fin2gif
echo.%time%
echo.jpg=%jpg%	png=%png%	gif=%gif%
if defined jpg if defined png if defined gif (echo.������� �� ⨯� & goto:fin2)
echo.������� �� �� ⨯�
:fin2

exit /b

:initvars
set "jpg="
set "png="
set "gif="
exit /b
