﻿using System.Diagnostics;

internal class Program
{
    private static void Main(string[] args)
    {
        Process p = new Process();
        ProcessStartInfo processStartInfo = new ProcessStartInfo();
        processStartInfo.CreateNoWindow = true;
        processStartInfo.FileName = "CMD.exe";
        processStartInfo.Arguments = "/C build.bat";
        p.StartInfo = processStartInfo;
        p.Start();
        
        Process z = new Process();
        z.StartInfo.FileName = "hello.exe";
        z.Start();
    }
}