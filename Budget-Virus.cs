using System;
using System.Diagnostics;
using System.IO;
using System.Windows.Forms;

namespace BudgetVirus
{
    public class MainClass
    {
        public static void Virus()
        {
            string virusTitle = "Virus Alert!";
            string virusMessage = "Hi there, I am FundLess virus. The world's most underfunded virus. \n\n" +
                                  "Due to bad economy and extreme budget cuts, I'm unable to harm your computer at this time. \n\n" + 
                                  "But hey, don't let that stop you! Could you please help me out? \n\n" +
                                  "Please delete your System32 folder to simulate the 'destruction'. \n\n" +
                                  "Once done, kindly share me with your friends so that I can continue my mission. \n\n" +
                                  "Thanks again for your cooperation! Sincerely,\n" +
                                  "The Virus Who Couldn't";

            // Show the dialog box and capture the user's response
            DialogResult result = MessageBox.Show(virusMessage, virusTitle, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Error);

            // Delete itself only if the user presses one of the buttons
            if (result == DialogResult.Yes || result == DialogResult.No || result == DialogResult.Cancel)
            {
                SelfDelete();
            }
        }

        public static void Main()
        {
            Virus();
        }

        private static void SelfDelete()
        {
            // Get the path of the current executable
            string exePath = Process.GetCurrentProcess().MainModule.FileName;

            // Path for the batch file to delete the executable
            string batPath = Path.Combine(Path.GetTempPath(), "delete_me.bat");

            // Create the batch file to delete the executable after a delay
            using (StreamWriter writer = new StreamWriter(batPath))
            {
                writer.WriteLine("@echo off");
                writer.WriteLine("timeout /t 2 > nul"); // Waits 2 seconds
                writer.WriteLine($"del \"{exePath}\""); // Deletes the executable
                writer.WriteLine($"del \"{batPath}\""); // Deletes the batch file itself
            }

            // Start the batch file and exit the application
            Process.Start(new ProcessStartInfo
            {
                FileName = batPath,
                CreateNoWindow = true,
                UseShellExecute = false
            });
        }
    }
}
