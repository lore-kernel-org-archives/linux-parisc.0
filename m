Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id XAA07132
	for <parisc-linux@puffin.external.hp.com>; Wed, 29 Sep 1999 23:39:52 -0600
Received: from thepuffingroup.com (IDENT:adevries@localhost [127.0.0.1])
	by feather.thepuffingroup.com (8.9.3/8.9.3) with ESMTP id BAA19875
	for <parisc-linux@thepuffingroup.com>; Thu, 30 Sep 1999 01:57:22 -0400
Sender: adevries@thepuffingroup.com
Message-ID: <37F2FBC1.4A09AF1E@thepuffingroup.com>
Date: Thu, 30 Sep 1999 01:57:21 -0400
From: Alex deVries <adevries@thepuffingroup.com>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Testers needed for hardware detection code...
List-ID: <linux-parisc.vger.kernel.org>


Yesterday I committed some hardware detection code that actually worked
on my A180.  I spent today refining it to work on my 715, which works,
but I need others to test it on different hardware.

Here's what I get on my 715:

Probing PDC firmware for devices, found:
This is an older box...
   - Scorpio Sr. Core SCSI (10) at 0xf0825000, versions 0x19, 0x0, 0x71,
0x0,    
   - Scorpio Sr. Core LAN (802.3) (10) at 0xf0826000, versions 0x19,
0x0, 
   - Scorpio Sr. Core HIL (10) at 0xf0821000, versions 0x19, 0x0, 0x73,
0x0, 
   - Scorpio Sr. Core RS-232 (10) at 0xf0823000, versions 0x19, 0x0,
0x75, 
   - Scorpio Sr. Core RS-232 (10) at 0xf0822000, versions 0x19, 0x0,
0x75, 
   - Scorpio Sr. Core Centronics (10) at 0xf0824000, versions 0x19, 0x0,
0x74, 
   - Scorpio Sr. Audio (10) at 0xf1000000, versions 0x19, 0x0, 0x7b,
0x0, 0x0
That's 7 devices total.
Linux version 2.2.12 (adevries@rum) (gcc version egcs-2.91.60 19981201
(egcs-1.5 Thu Sep 30 09:22:07 EDT 1999
etc

On my A180 (with an add in 10/100 ethernet card and a dual gigabit
ethernet card), I get:

Probing PDC firmware for devices, found:
   - Phantom PseudoBC GSC+ Port (7) at 0xffc00000, versions 0x504, 0x0,
0x0,  
   - Phantom PseudoBC GSC+ Port (7) at 0xffc01000, versions 0x505, 0x0,
0x0,   
   - HP HSC-PCI Cards (4) at 0xfff84000, versions 0x4, 0x0, 0x9d, 0x0,
0x80
   - HP HSC-PCI Cards (4) at 0xfff88000, versions 0x4, 0x0, 0x9d, 0x0,
0x80
   - Staccato L2 180 (A Class 180) (0) at 0xfffbe000, versions 0x516,
0x0,     
   - Staccato L2 180 Memory (1) at 0xfffbf000, versions 0x8b, 0x0, 0x9,
0x0,    
   - Staccato 180 Lasi (11) at 0xffd00000, versions 0x5f, 0x0, 0x81,
0x0, 0x0
   - Staccato 180 Core LAN RS-232 (10) at 0xffd05000, versions 0x5f,
0x0, 
   - Staccato 180 Core SCSI (10) at 0xffd06000, versions 0x5f, 0x0,
0x82, 0x0, 
   - Dino PCI Bridge (13) at 0xfff80000, versions 0x680, 0x3, 0xa, 0x0,
0x0
That's 10 devices total.
Linux version 2.2.12 (adevries@rum) (gcc version egcs-2.91.60 19981201
(egcs-1.5 Thu Sep 30 09:22:07 EDT 1999

I'm very interested in seeing the results on pretty much any other
hardware.  Could people please test either building a kernel from
source, or from the binary at:

ftp://puffin.external.hp.com/pub/parisc/binaries/kernels/Image-19990929

I'd appreciate it if you could just mail me
(adevries@thepuffingroup.com) the results of an entire bootup.  If you
could put the machine name in the subject, it'd help.

Getting this to go was pretty hard, since the docs for MEM_MAP and
SYSTEM_MAP were unavailable at the time of the writing of the code. The
somewhat random alignment chewed up a lot of time.  

In other good news, it sounds like Philipp is close to getting a serial
console on Lasi going.

- Alex

-- 
Alex deVries
Vice President of Engineering
The Puffin Group
