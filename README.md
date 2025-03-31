# Blackwake Intel Fix

This is a batch file dedicated to automating the process to fix a issue with how Intel CPUs past 10th generation handle older libraries.

# Usage
Click this [![downloads-shield]][releases-link] button for the neccessary release file

Run the batch file.

# Security
> [!WARNING]\
> This could potentially open up your system to exploits, Assuming you do not play games or use programs with horrible security practices, This should never affect you in a practical way.
> https://www.intel.com/content/www/us/en/developer/articles/troubleshooting/openssl-sha-crash-bug-requires-application-update.html

# Alternative Method
You can use this command in order to only have the patch apply to Blackwake related applications.
The downside is that Blackwake will run behind a windows terminal and must remain open along with the game.
Copy the Below command and enter it as a startup command for Blackwake in Steam's Startup options (Properties > General > Launch Options)
```css
cmd /c "setx OPENSSL_ia32cap "~0x20000000"" &&  %command%
```

<!-- MARKDOWN LINKS -->
[downloads-shield]: https://img.shields.io/github/downloads/Hazeofdream/blackwake-intel-fix/total?style=flat-square
[releases-link]: https://github.com/Hazeofdream/blackwake-intel-fix/releases/download/Stable/Blackwake.Fix.bat
