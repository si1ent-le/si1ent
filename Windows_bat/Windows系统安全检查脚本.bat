@echo off

echo                                        "Windowsϵͳ��ȫ���ű�"
echo                                        "si1ent"
echo                                        "ԭ����:http://www.lcblog.vip/"

if exist c:\�����\ (

   echo 

) else (

md c:\�����\

)

if not exist c:\�����\ md c:\�����\

 

echo "ϵͳ��Ϣ���"

systeminfo >c:\�����\ϵͳ��Ϣ.log

echo "�˿���Ϣ���"

netstat -anb >c:\�����\�˿���Ϣ.log

echo "���̼��"

tasklist&net start >c:\�����\���̼��.log

echo "����·�����"

wmic process get name,executablepath,processid >c:\�����\����·�����.log

echo "Ĭ�Ϲ�����"

net share >c:\�����\Ĭ�Ϲ�����.log

echo "�û���Ϣ���"

net user & net localgroup administrators >c:\�����\�û���Ϣ���.log

echo "�����û����"

echo HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\Names [1 2 19]>d:\regg.ini&echo HKEY_LOCAL_MACHINE\SAM\SAM\ [1 2 19] >>d:\regg.ini & regini d:\regg.ini&reg query HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\Names >c:\�����\�����û����.log&del d:\regg.ini

echo "ע�����������"

reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run & reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run >c:\�����\ע�����������.log

echo "��ȫ���Լ��"

secedit /export /cfg LocalGroupPolicy&type LocalGroupPolicy >c:\�����\��ȫ���Լ��.log

echo "IE�������¼���"

reg query HKEY_CURRENT_USER\Software\Microsoft\Internet" "Explorer\TypedURLs >c:\�����\IE�������¼���.log

echo "��Ӻ�ж�ؼ�¼"

reg query HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\UNINSTALL /s /v DisPlayname >c:\�����\��Ӻ�ж�ؼ�¼.log

echo "�쳣״̬���"

reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\SvcHost /s /v netsvcs&reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\SvcHost /s /v LocalService >c:\�����\�쳣״̬���.log

echo "ͨ�ż��"

netstat -a >c:\�����\ͨ�ż��.log

echo "CMD��¼"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU >c:\�����\CMD��¼.log

echo "�ļ���¼���"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths >c:\�����\�ļ���¼���.log

echo "�ļ���¼���2"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\* /v * >c:\�����\�ļ���¼���2.log

echo "�����¼"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU >c:\�����\�����¼.log

echo "�����¼"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU >c:\�����\�����¼.log

echo "C�������ļ����"

echo "������ִ���ļ����ؽ��Ϊ1������ִ���ļ����Ϊ0�����ؽ��Ϊ2�ģ�Ϊ�������������ļ���"

echo "�����س�������"

set /p var=find /c /i "this program" c:\*  c:\Inetpub\*  C:\Users\Administrator\Desktop\* c:\temp\* >c:\�����\�����ļ����.log

%var%

if %ERRORLEVEL% == 0 goto yes

goto no

:yes

exit

:no

find /c /i "this program" c:\*  c:\wmpub\* c:\Inetpub\* C:\Documents and Settings\Administrator\����\* >c:\�����\�����ļ����.log
