@ECHO OFF
setlocal enabledelayedexpansion

rem ������⢮ ���権
Set "cnt=120"
::���ᨬ���� ࠧ��� ��ப� ��������
set "ilen=20"
::��થ�� ᨬ��� ��������
set "imark=0"
::������ ��������
set "imarklen=3"
::�� ᪮�쪮 ����権 ᤢ����� ��થ� ������ �����
set "imarkskip=2"
::������ �������⥫� (䮭)
set "iblank=9"
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
::set "istrblank="
::0>nul set /p "=!istrbs!"
::for /l %%i in (1,1,%ilen%) do set "istrblank=!istrblank! "
::0>nul set /p "=%boxb%%istrblank% "
::0>nul set /p "=%istrbs% "

>nul pause & goto:eof

:Bar
if %imu% gtr 0 (
	if %imarkpos% lss %imarklen% (
		0<nul set /p "=%imark%"
	) else if %imarkpos% gtr %ilen% (
		for /l %%j in (1,1,%imu%) do 0<nul set /p "="
		0<nul set /p "=%iblank%"
		for /l %%j in (2,1,%imu%) do 0<nul set /p "=%imark%"
		set /a "imu-=1"
		if !imu! equ 1 set "imu=-%imarklen%"
		set /a "imarkpos-=1"
	) else 0<nul set /p "=%imarkbs%%iblank%%imarkstr%"
	set /a "imarkpos+=1"
)
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
