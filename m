Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from femail40.sdc1.sfba.home.com (femail40.sdc1.sfba.home.com [24.254.60.34])
	by dsl2.external.hp.com (Postfix) with ESMTP id BB40E482B
	for <parisc-linux@parisc-linux.org>; Sun, 12 Aug 2001 20:01:06 -0600 (MDT)
Received: from nick ([65.12.82.119]) by femail40.sdc1.sfba.home.com
          (InterMail vM.4.01.03.20 201-229-121-120-20010223) with SMTP
          id <20010813020105.PBSO25522.femail40.sdc1.sfba.home.com@nick>
          for <parisc-linux@parisc-linux.org>;
          Sun, 12 Aug 2001 19:01:05 -0700
Content-Type: text/plain;
  charset="iso-8859-1"
From: Nicholas Leippe <nick@byu.edu>
To: parisc-linux@parisc-linux.org
Date: Sun, 12 Aug 2001 19:01:03 -0700
MIME-Version: 1.0
Message-Id: <01081219010300.29208@nick>
Subject: [parisc-linux] Can't boot 9.2 iso on B132L
List-ID: <linux-parisc.vger.kernel.org>

I've tried both graphical and serial console and get the same thing.
I also burned a second disk with the iso since the first couldn't be
read on my x86 box.  The second disk mounted just fine on my x86 box,
so I assume that it at least is good, though it gives the same error.

Main Menu: Enter command > sea
 
Searching for potential boot device(s)...
This may take several minutes.
 
To discontinue search, press any key (termination may not be immediate).
 
 
   Path Number        Device Path              Device Type
   -----------        -----------------        -----------
   P0                 FWSCSI.6.0               SEAGATE ST34572WD
   P1                 FWSCSI.0.0               SGI     QUANTUM XP32150W
   P2                 SESCSI.5.0               TOSHIBA CD-ROM XM-5301TA


Main Menu: Enter command > bo P2
Interact with IPL (Y, N, Q)?> n
 
Booting...
Failed to initialize.
 
ENTRY_INIT
Status = -10
 
FFFFFFF6 00000001 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000 00000000 00000000 00000000 454E4841 00000005 00000000 454E4846
00000000 00000000 00000000 00000000 00000002 00000005 00000020 00000000
 
Failed to initialize.



Any suggestions?

Nick

-- 
Nobody will ever need more than 640 kB RAM.
                 -- Bill Gates, 1983
Windows 98 requires 16 MB RAM.
                 -- Bill Gates, 1999
Nobody will ever need Windows 98.
                 -- logical conclusion
