Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA04807
	for <parisc-linux@puffin.external.hp.com>; Tue, 16 Jan 2001 08:53:29 -0700
Received: from localhost (ingram@localhost)
	by maestro.symsys.com (8.9.3/8.9.3) with ESMTP id JAA25528
	for <parisc-linux@thepuffingroup.com>; Tue, 16 Jan 2001 09:57:09 -0600
Date: Tue, 16 Jan 2001 09:57:09 -0600 (CST)
From: Greg Ingram <ingram@symsys.com>
To: parisc-linux@thepuffingroup.com
In-Reply-To: <20010116152219.D20275@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.LNX.4.21.0101160937530.25295-100000@maestro.symsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C100 Boots!  Really!  Got a shell!
List-ID: <linux-parisc.vger.kernel.org>


Gentlemen,

In a previous post I reported that telnet was answering but I got a
'permission denied' error and never saw a login prompt.  I suspected that
the root file system was never being remounted as read-write.  After
appending 'rw' to the kernel command line I'm able to login via
telnet.  Woohoo!  I'm using the nfsroot tarball from the FTP site.  Might
there be a problem in it such that / isn't properly remounted?

Some other things:

Trying STI for the console didn't work.  I eventually enabled the console
on the line printer (no printer connected though) and disabled the console
on the serial port.  I stop getting messages on the serial port at:

	Set default PSW W bit to 0

but the boot continues.

Also, I find this in dmesg output:

!!die_if_kernel: sleep(52): Unaligned data reference 28
 
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001011
r0-3     00000000 40178938 4018cc7b 401760d4
r4-7     40197148 00000000 00000031 001e8481
r8-11    bb00014c bb000140 00000002 4001ada0
r12-15   4001ad7c 00000000 000929b0 00000000
r16-19   00000000 0007e808 00078440 40197148
r20-23   001e8000 40188f14 bb000414 00000008
r24-27   40190460 00000000 401760d4 00076808
r28-31   00000016 00000000 bb0006c0 4009d987
sr0-3    0000007a 0000007a 00000000 0000007a
sr4-7    0000007a 0000007a 0000007a 0000007a
 
IASQ: 0000007a 0000007a IAOQ: 4018d0ab 4018d0af
 IIR: 0c6011d4    ISR: 0000007a  IOR: 401760d4
ORIG_R28: 00000000
!!die_if_kernel: nscd(97): Unaligned data reference 28
 
     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001011
r0-3     00000000 40167938 40029c7b 401650d4
r4-7     40034148 00000000 00000031 001e8481
r8-11    bb000160 bb000158 00000001 4001ada0
r12-15   4001ad7c 00000000 0008c350 00000000
r16-19   00000000 0007e808 00078440 40034148
r20-23   001e8000 40025f14 bb000414 00000008
r24-27   4002d460 00000000 401650d4 000054dc
r28-31   00000016 00000000 bb0006c0 4008c987
sr0-3    000000f9 000000f9 00000000 000000f9
sr4-7    000000f9 000000f9 000000f9 000000f9
 
IASQ: 000000f9 000000f9 IAOQ: 4002a0ab 4002a0af
 IIR: 0c6011d4    ISR: 000000f9  IOR: 401650d4
ORIG_R28: 00000000
                                                                                
Next on the agenda:  Get Linux on the local hard drive.

Cheers,

- Greg
