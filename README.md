# THIS IS AN UNOFFICIAL FORK

Up-to-date [wine](https://www.winehq.org/) 2.2+ fork with [staging 
patches](https://github.com/wine-compholio/wine-staging) 
and 
[awesie/overwatch](https://bitbucket.org/awesie/wine-overwatch) merged.

Please [read this](OVERWATCH) for Overwatch.

The code has not been tested (due to drivers/hardware incompatibility), but compiling. Test 
results are welcome.

Last updated: 2017-02-27

---

1. INTRODUCTION

Wine is a program which allows running Microsoft Windows programs
(including DOS, Windows 3.x, Win32, and Win64 executables) on Unix.
It consists of a program loader which loads and executes a Microsoft
Windows binary, and a library (called Winelib) that implements Windows
API calls using their Unix or X11 equivalents.  The library may also
be used for porting Windows code into native Unix executables.

Wine is free software, released under the GNU LGPL; see the file
LICENSE for the details.


2. QUICK START

From the top-level directory of the Wine source (which contains this file),
run:

./configure
make

Run programs as "wine program".  For more information and problem
resolution, read the rest of this file, the Wine man page, and
especially the wealth of information found at http://www.winehq.org.


3. REQUIREMENTS

To compile and run Wine, you must have one of the following:

  Linux version 2.0.36 or later
  FreeBSD 8.0 or later
  Solaris x86 9 or later
  NetBSD-current
  Mac OS X 10.5 or later

As Wine requires kernel-level thread support to run, only the operating
systems mentioned above are supported.  Other operating systems which
support kernel threads may be supported in the future.

FreeBSD info:
  Wine will generally not work properly on versions before FreeBSD 8.0.
  See http://wiki.freebsd.org/Wine for more information.

Solaris info:
  You will most likely need to build Wine with the GNU toolchain
  (gcc, gas, etc.). Warning : installing gas does *not* ensure that it
  will be used by gcc. Recompiling gcc after installing gas or
  symlinking cc, as and ld to the gnu tools is said to be necessary.

NetBSD info:
  Make sure you have the USER_LDT, SYSVSHM, SYSVSEM, and SYSVMSG options
  turned on in your kernel.

Mac OS X info:
  You need Xcode 2.4 or later to build properly on x86.
  The Mac driver requires OS X 10.6 or later and won't be built on 10.5.


Supported file systems:
  Wine should run on most file systems. A few compatibility problems
  have also been reported using files accessed through Samba. Also,
  NTFS does not provide all the file system features needed by some
  applications.  Using a native Unix file system is recommended.

Basic requirements:
  You need to have the X11 development include files installed
  (called xlib6g-dev in Debian and XFree86-devel in Red Hat).

  Of course you also need "make" (most likely GNU make).

  You also need flex version 2.5.33 or later and bison.

Optional support libraries:
  Configure will display notices when optional libraries are not found
  on your system. See http://wiki.winehq.org/Recommended_Packages for
  hints about the packages you should install.

  On 64-bit platforms, if compiling Wine as 32-bit (default), you have
  to make sure to install the 32-bit versions of these libraries; see
  http://wiki.winehq.org/WineOn64bit for details. If you want a true
  64-bit Wine (or a mixed 32-bit and 64-bit Wine setup), see
  http://wiki.winehq.org/Wine64 for details.

4. COMPILATION

To build Wine, do:

./configure
make

This will build the program "wine" and numerous support libraries/binaries.
The program "wine" will load and run Windows executables.
The library "libwine" ("Winelib") can be used to compile and link
Windows source code under Unix.

To see compile configuration options, do ./configure --help.

For more information, see https://wiki.winehq.org/Building_Wine

5. SETUP

Once Wine has been built correctly, you can do "make install"; this
will install the wine executable and libraries, the Wine man page, and
other needed files.

Don't forget to uninstall any conflicting previous Wine installation
first.  Try either "dpkg -r wine" or "rpm -e wine" or "make uninstall"
before installing.

Once installed, you can run the "winecfg" configuration tool. See the
Support area at http://www.winehq.org/ for configuration hints.


6. RUNNING PROGRAMS

When invoking Wine, you may specify the entire path to the executable,
or a filename only.

For example: to run Notepad:

    wine notepad            (using the search Path as specified in
    wine notepad.exe         the registry to locate the file)

    wine c:\\windows\\notepad.exe      (using DOS filename syntax)

    wine ~/.wine/drive_c/windows/notepad.exe  (using Unix filename syntax)

    wine notepad.exe readme.txt          (calling program with parameters)

Wine is not perfect, so some programs may crash. If that happens you
will get a crash log that you should attach to your report when filing
a bug.


7. GETTING MORE INFORMATION

WWW:	A great deal of information about Wine is available from WineHQ at
	http://www.winehq.org/ : various Wine Guides, application database,
	bug tracking. This is probably the best starting point.

FAQ:	The Wine FAQ is located at http://www.winehq.org/FAQ

Wiki:	The Wine Wiki is located at http://wiki.winehq.org

Mailing lists:
	There are several mailing lists for Wine users and developers;
	see http://www.winehq.org/forums for more information.

Bugs:	Report bugs to Wine Bugzilla at http://bugs.winehq.org
	Please search the bugzilla database to check whether your
	problem is already known or fixed before posting a bug report.

IRC:	Online help is available at channel #WineHQ on irc.freenode.net.

Git:	The current Wine development tree is available through Git.
	Go to http://www.winehq.org/git for more information.

If you add something, or fix a bug, please send a patch (preferably
using git-format-patch) to the wine-patches@winehq.org list for
inclusion in the next release.

--
Alexandre Julliard
julliard@winehq.org
