@echo off
set "virusTitle=Virus Alert!"
set "tempFile=%temp%\userChoice.txt"
set "psScript=%temp%\virusPrompt.ps1"

:: Create the PowerShell script file with the formatted message
echo [void][System.Reflection.Assembly]::LoadWithPartialName('System.Windows.Forms') > "%psScript%"
echo $form = New-Object System.Windows.Forms.Form; >> "%psScript%"
echo $form.Text = "%virusTitle%"; >> "%psScript%"
echo $form.Size = New-Object System.Drawing.Size(400,250); >> "%psScript%"
echo $form.StartPosition = 'CenterScreen'; >> "%psScript%"
echo $label = New-Object System.Windows.Forms.Label; >> "%psScript%"
echo $label.Text = "Hi there!`nI am FundLess Virus, the world’s most underfunded virus.`nDue to extreme budget cuts, I am unable to harm your computer at this time.`nBut hey, don’t let that stop you! Why not help me out?`nPlease delete your System32 folder to simulate the 'destruction.'`nOnce done, kindly share me with others so I can continue my mission.`nThanks for your cooperation!`nSincerely,`nThe Virus Who Couldn’t"; >> "%psScript%"
echo $label.Size = New-Object System.Drawing.Size(380,150); >> "%psScript%"
echo $label.Location = New-Object System.Drawing.Point(10,10); >> "%psScript%"
echo $yesButton = New-Object System.Windows.Forms.Button; >> "%psScript%"
echo $yesButton.Text = 'Yes'; >> "%psScript%"
echo $yesButton.Location = New-Object System.Drawing.Point(50,170); >> "%psScript%"
echo $noButton = New-Object System.Windows.Forms.Button; >> "%psScript%"
echo $noButton.Text = 'No'; >> "%psScript%"
echo $noButton.Location = New-Object System.Drawing.Point(150,170); >> "%psScript%"
echo $cancelButton = New-Object System.Windows.Forms.Button; >> "%psScript%"
echo $cancelButton.Text = 'Cancel'; >> "%psScript%"
echo $cancelButton.Location = New-Object System.Drawing.Point(250,170); >> "%psScript%"
echo $form.Controls.AddRange(@($label, $yesButton, $noButton, $cancelButton)); >> "%psScript%"
echo $yesButton.Add_Click({ $form.DialogResult = [System.Windows.Forms.DialogResult]::Yes }); >> "%psScript%"
echo $noButton.Add_Click({ $form.DialogResult = [System.Windows.Forms.DialogResult]::No }); >> "%psScript%"
echo $cancelButton.Add_Click({ $form.DialogResult = [System.Windows.Forms.DialogResult]::Cancel }); >> "%psScript%"
echo $result = $form.ShowDialog(); >> "%psScript%"
echo if ($result -eq [System.Windows.Forms.DialogResult]::Yes) { Set-Content -Path '%tempFile%' -Value 'Yes' } >> "%psScript%"
echo elseif ($result -eq [System.Windows.Forms.DialogResult]::No) { Set-Content -Path '%tempFile%' -Value 'No' } >> "%psScript%"
echo elseif ($result -eq [System.Windows.Forms.DialogResult]::Cancel) { Set-Content -Path '%tempFile%' -Value 'Cancel' } >> "%psScript%"

:: Run the PowerShell script
powershell -ExecutionPolicy Bypass -File "%psScript%"

:: Read the user's choice from the temporary file
set /p userChoice=<%tempFile%
del %tempFile% 2>nul
del %psScript% 2>nul

:: Check user choice and respond accordingly
if "%userChoice%" == "Yes" (
    echo User clicked Yes.
) else if "%userChoice%" == "No" (
    echo User clicked No.
) else if "%userChoice%" == "Cancel" (
    echo User clicked Cancel.
)

:: Self-delete section
set "batPath=%temp%\delete_me.bat"
echo @echo off > "%batPath%"
echo timeout /t 2 > nul >> "%batPath%"
echo del "%~f0" >> "%batPath%"
echo del "%batPath%" >> "%batPath%"

:: Execute the self-deleting batch file
start "" "%batPath%"
exit
