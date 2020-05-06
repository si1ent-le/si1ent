@echo off

echo                                        "Windows系统安全检查脚本"
echo                                        "si1ent"
echo                                        "原作者:http://www.lcblog.vip/"

if exist c:\检查结果\ (

   echo 

) else (

md c:\检查结果\

)

if not exist c:\检查结果\ md c:\检查结果\

 

echo "系统信息检查"

systeminfo >c:\检查结果\系统信息.log

echo "端口信息检查"

netstat -anb >c:\检查结果\端口信息.log

echo "进程检查"

tasklist&net start >c:\检查结果\进程检查.log

echo "进程路径检查"

wmic process get name,executablepath,processid >c:\检查结果\进程路径检查.log

echo "默认共享检查"

net share >c:\检查结果\默认共享检查.log

echo "用户信息检查"

net user & net localgroup administrators >c:\检查结果\用户信息检查.log

echo "隐藏用户检查"

echo HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\Names [1 2 19]>d:\regg.ini&echo HKEY_LOCAL_MACHINE\SAM\SAM\ [1 2 19] >>d:\regg.ini & regini d:\regg.ini&reg query HKEY_LOCAL_MACHINE\SAM\SAM\Domains\Account\Users\Names >c:\检查结果\隐藏用户检查.log&del d:\regg.ini

echo "注册表启动项检查"

reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run & reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run >c:\检查结果\注册表启动项检查.log

echo "安全策略检查"

secedit /export /cfg LocalGroupPolicy&type LocalGroupPolicy >c:\检查结果\安全策略检查.log

echo "IE浏览器记录检查"

reg query HKEY_CURRENT_USER\Software\Microsoft\Internet" "Explorer\TypedURLs >c:\检查结果\IE浏览器记录检查.log

echo "添加和卸载记录"

reg query HKEY_LOCAL_MACHINE\SOFTWARE\MICROSOFT\WINDOWS\CURRENTVERSION\UNINSTALL /s /v DisPlayname >c:\检查结果\添加和卸载记录.log

echo "异常状态检查"

reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\SvcHost /s /v netsvcs&reg query HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows" "NT\CurrentVersion\SvcHost /s /v LocalService >c:\检查结果\异常状态检查.log

echo "通信检查"

netstat -a >c:\检查结果\通信检查.log

echo "CMD记录"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU >c:\检查结果\CMD记录.log

echo "文件记录检查"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths >c:\检查结果\文件记录检查.log

echo "文件记录检查2"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU\* /v * >c:\检查结果\文件记录检查2.log

echo "程序记录"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU >c:\检查结果\程序记录.log

echo "程序记录"

reg query HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedMRU >c:\检查结果\程序记录.log

echo "C盘捆绑文件检查"

echo "正常可执行文件返回结果为1，不可执行文件结果为0，返回结果为2的，为存在捆绑内容文件。"

echo "请点击回车继续！"

set /p var=find /c /i "this program" c:\*  c:\Inetpub\*  C:\Users\Administrator\Desktop\* c:\temp\* >c:\检查结果\捆绑文件检查.log

%var%

if %ERRORLEVEL% == 0 goto yes

goto no

:yes

exit

:no

find /c /i "this program" c:\*  c:\wmpub\* c:\Inetpub\* C:\Documents and Settings\Administrator\桌面\* >c:\检查结果\捆绑文件检查.log
