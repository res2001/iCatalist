@echo off
::����஢���� ��� ��ਠ�⮢ ���᪠ ��ࢮ�� 䠩�� �� ��᪥.
::��ਠ���:
::	1.�����६���� ���� ��ࢮ�� �宦����� ��� ��� ⨯�� 䠩��� � ����� 横��.
::	2.��᫥����⥫�� ���� ��ࢮ�� �宦����� ��� ⨯�� 䠩���, ����� ⨯ 䠩��� � ᢮�� 横��, ��᫥����⥫�� ����.
::	3.��ࠫ����� ���� ��ࢮ�� �宦����� ��� ⨯�� 䠩���, ����� ⨯ 䠩��� � ᢮�� �����. ��������� ����� � ������� �६����� 䠩���. ���� ��᫥����� ⨯� 䠩��� ����᪠���� � �᭮���� �����.
::��ࠬ����: %1 - ���� � ��⠫���, � ���஬ �㤥� �ந�������� ����.
::��ਠ�� 1
setlocal enabledelayedexpansion

set "alltypes=*.jpg *.png *.gif"
set "jpgtype=*.jpg *.jpe *.jpeg"
set "pngtype=*.png"
set "giftype=*.gif"

echo.1.�����६���� ���� (� ����� 横�� �� ⨯� 䠩���)
call:initvars
echo.%time%
for /r "%~1" %%a in (%alltypes%) do (
	if /i "%%~xa" equ ".jpg" if not defined jpg set "jpg=1"
	if /i "%%~xa" equ ".png" if not defined png set "png=1"
	if /i "%%~xa" equ ".gif" if not defined gif set "gif=1"
	if defined jpg if defined png if defined gif goto:fin1
)
:fin1
echo.%time%
echo.jpg=%jpg%	png=%png%	gif=%gif%
if defined jpg if defined png if defined gif (echo.������� �� ⨯� & goto:fin11)
echo.������� �� �� ⨯�
:fin11

exit /b

:initvars
set "jpg="
set "png="
set "gif="
exit /b
