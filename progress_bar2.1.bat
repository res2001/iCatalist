@echo off
setlocal enabledelayedexpansion

rem ������⢮ ���権
Set "cnt=37"
::���ᨬ���� ࠧ��� ��ப� ��������
set "ilen=10"
::��થ�� ᨬ��� ��������
set "imark=0"
::������ ��������
set "imarklen=3"
::�� ᪮�쪮 ����権 ᤢ����� ��થ� ������ �����
set "imarkskip=2"
::������ �������⥫� (䮭)
set "iblank= "
::������ ������ ��થ� � ��������
set "imarkpos=0"
::��砫�� � ������ ᨬ���� �࠭��� ������ ��������
set "boxb=["
set "boxe=]"

set /a "imu=%imarklen%"

::���樠������ ������ ��������
set "istrbs="
for /l %%i in (1,1,%ilen%) do set "istrbs=!istrbs!"
set "istrblank="
for /l %%i in (1,1,%ilen%) do set "istrblank=!istrblank!%iblank%"
set "imarkbs="
for /l %%i in (1,1,%imarklen%) do set "imarkbs=!imarkbs!"
set "imarkstr="
for /l %%i in (1,1,%imarklen%) do set "imarkstr=!imarkstr!%imark%"

0<nul set /p "=%boxb%%istrblank%%boxe%%istrbs%"
::�᭮���� 横�
for /l %%i in (1,1,%cnt%) do (
	Call:Bar %%i
	1>nul 2>&1 ping -n 1 -w 1 127.255.255.255
)
::����ࠥ� �� ᮡ��
0>nul set /p "=%imark%%istrbs%%istrblank%%iblank%%iblank%%istrbs%"

:Bar
if %imu% gtr 0 (
	if %imarkpos% lss %imarklen% (
		0<nul set /p "=%imark%"
	) else if %imarkpos% geq %ilen% (
		for /l %%j in (1,1,%imu%) do 0<nul set /p "="
		0<nul set /p "=%imark%%iblank%"
		for /l %%j in (2,1,%imu%) do 0<nul set /p "=%imark%"
		set /a "imu-=1"
		if !imu! equ 1 (
			set "imu=-1"
			exit /b
		)
	) else if %imarkpos% lss %ilen% 0<nul set /p "=%imarkbs%%iblank%%imarkstr%"
	set /a "imarkpos+=1"
) else if %imu% lss 0 (
	if %imarkpos% geq %ilen% (
		set /a "imu-=1"
		for /l %%j in (-1,-1,!imu!) do 0<nul set /p "="
		for /l %%j in (-1,-1,!imu!) do 0<nul set /p "=%imark%"
	) else if %imarkpos% lss %imarklen% (
		0<nul set /p "=%iblank%"
		set /a "imu+=1"
		if !imu! equ -1 (
			set "imu=%imarklen%"
			exit /b
		)
	) else if %imarkpos% geq %imarklen% (
		0<nul set /p "=%iblank%%imarkbs%%imarkstr%"
	)
	set /a "imarkpos-=1"
)
		::else set /a "imarkpos-=1"
::if %imarkpos% gtr %imarklen%
::echo.%imarkpos%	

::0<nul set /p "=%imark%"

exit /b

if %imarkpos% equ 0 (
	set "imarkpos=1"
	0<nul set /p "=%iblank%%istrbs%%imark%"
) else (
	0<Nul Set /p "=%iblank%%imark%"
	set /a "imarkpos=(imarkpos+1)%%ilen"
)
exit /b
