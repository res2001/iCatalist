var objShell = new ActiveXObject("shell.application");
var ssfWINDOWS = 36;
var objFolder;
objFolder = objShell.BrowseForFolder(0, "�������� ������� ���������� �����������.  ������� '������' ��� ������ ������������ ����������� �� ����������������.", ssfWINDOWS);
if (objFolder != null)
{
	WScript.echo(objFolder.self.Path);
}
