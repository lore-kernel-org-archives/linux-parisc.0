Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA03452
	for <parisc-linux@puffin.external.hp.com>; Thu, 6 Apr 2000 15:30:50 -0600
Received: (from steve@localhost)
	by osiris.silug.org (8.9.3/8.9.3) id QAA25142
	for parisc-linux@thepuffingroup.com; Thu, 6 Apr 2000 16:30:46 -0500
From: Steven Pritchard <steve@silug.org>
Message-Id: <200004062130.QAA25142@osiris.silug.org>
Subject: Re: [parisc-linux] K100 problem
In-Reply-To: <002801bf9b5f$c12180e0$4b58000f@jh73313p.cup.hp.com> from Jim Hull
 at "Mar 31, 2000 02:23:35 pm"
To: parisc-linux@thepuffingroup.com
Date: Thu, 6 Apr 2000 16:30:46 -0500 (CDT)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Jim Hull said:
> WARN  A008  No bootable device found 

Apparently the terminal was dead.  I hooked it up to my PC and got
output.  Now I have another problem...  The box outputs to the serial
console, but it doesn't seem to want to take input on the serial
console.  Any ideas what might cause that?

Here's the boot messages:

--

Firmware Version  1.8

Duplex Console IO Dependent Code (IODC) revision 4

------------------------------------------------------------------------------
   (c) Copyright 1990-1994, Hewlett-Packard Company, All rights reserved
------------------------------------------------------------------------------

  Processor   Speed            State           CoProcessor State  Cache Size
  ---------  --------   ---------------------  -----------------  ----------

      0      100  MHz   Active                 Functional          256 KB

  Central Bus Speed (in MHz)  :        100  
  Available Memory (bytes)    :  167772160  
  Good Memory Required (bytes):   16211968  


   Primary boot path:    8/0.6   (dec)
   Alternate boot path:  8/12/5.0   (dec)
   Console path:         8/4/0.0   (dec)
   Keyboard path:        8/12/7.0   (dec)

CPU 0
  WARNING:  Memory configuration is not optimized for performance.  Refer
            to the System Installation or Memory Installation manuals for 
            memory configuration guidelines.


Processor is starting autoboot process.

To discontinue, press any key within 10 seconds.

10 seconds expired.
Proceeding...

Trying Primary Boot Path
------------------------

Booting... 
Boot IO Dependent Code (IODC) revision 7


HARD Booted.

ISL Revision A.00.38  OCT 26, 1994 

ISL booting  hpux

Boot
: disc(8/0.6.0;0)/stand/vmunix
4334092 + 380928 + 407872 start 0x17ce68

--

It does boot into HP-UX, so if I can figure out a way into it over the
network, I can probably reload the box with IgniteUX and just use it
as a HP-UX system, but obviously life would be easier if I could use
the console...

Steve
-- 
steve@silug.org           | Linux Users of Central Illinois
(618)398-7320             | Meetings the 4th Tuesday of every month
Steven Pritchard          | http://www.luci.org/ for more info
