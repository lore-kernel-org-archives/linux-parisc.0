Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA26185
	for <parisc-linux@puffin.external.hp.com>; Tue, 30 May 2000 12:43:26 -0600
From: Helge Deller <deller@gmx.de>
To: parisc-linux@thepuffingroup.com
Date: Tue, 30 May 2000 20:10:48 +0200
Content-Type: text/plain
MIME-Version: 1.0
Message-Id: <00053020434701.00442@P100>
Subject: [parisc-linux] STI-Console Mini-HOWTO
List-ID: <linux-parisc.vger.kernel.org>

Hi,

After my last commits regarding keyboard-support and STI-Console I think a 
small MINI-HOWTO should help to avoid the most problems for people, who want to
try the STI-Console on their machines.....

But first of all, I would like to thank Philipp Rumpf <prumpf@tux.org> for
allowing me to commit his sticon.[c|h] drivers.

As usual, any feedback is welcome :-)

Helge

-----------------------------------------------------------------

STI-console MINI-HOWTO:
-----------------------

-  check out a fresh linux-2.3 and palo, delete your .config and 
   use "make menuconfig" :-)

-  SELECT ONLY ONE of 
	"Support for console on serial port"
    ** OR **
	"STI-Console".

-  if you get "unable to open initial console", check the
   MAJOR/MINOR of /dev/console in your ramdisk or NFS:
   mknod /dev/console c 5 1 	-- for serial console
   mknod /dev/console c 4 0	-- for STI-console (should it be 4/1 ?) 
   
   For both cases I uploaded new ramdisks (ramdisk20000530-[sercon|sticon].tgz)
   to ftp://puffin.external.hp.com/pub/parisc/binaries/ramdisks
   I added special files for lp- and parport-devices there too.

-  for the STI-console you may define the initial number of 
   rows & columns in drivers/video/dummycon.c (this is temporary).
   You may adjust the numbers to the kernel message
   "Console: switching to colour STI console <numcols>x<numrows>"
   you will get during the first time the kernel starts.
   
-  once you see your STI-console is working you may reenable 
   "unregister_console()" at the end of arch/parisc/pdc_cons.c
   This will disable the "double" output from the kernel.

-  The only tested keyboard-support is currently with HIL-keyboards as 
   used in 715/64's. PS/2-Keyboards *may* work (feedback welcome!).
