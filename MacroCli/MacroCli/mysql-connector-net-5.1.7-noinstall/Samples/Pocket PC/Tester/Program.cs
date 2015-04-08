[ZoneTransfer]
ZoneId=3
m.Collections.Generic;
using System.Windows.Forms;

namespace DeviceApplication1
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [MTAThread]
        static void Main()
        {
            Application.Run(new MainForm());
        }
    }
}