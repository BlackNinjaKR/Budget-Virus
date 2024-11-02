using System;
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
			"Once done, kidly share me with your friends so that I can continue my mission \n\n" +
			"Thanks again for your cooperation! Sincerely,\n" +
			"The Virus Who Couldn't";

			MessageBox.Show(virusMessage, virusTitle, MessageBoxButtons.YesNoCancel, MessageBoxIcon.Error);
		}

		public static void Main()
		{
			Virus();
		}
	}
}