Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D4B4485E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 10 Jul 2002 14:34:52 -0600 (MDT)
Date: Wed, 10 Jul 2002 13:34:51 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP (in)stability 
In-Reply-To: <Pine.LNX.4.44.0207100032050.19290-100000@garibaldi.apptechsys.com>
Message-ID: <Pine.LNX.4.44.0207100858100.19290-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, 10 Jul 2002, Jeremy Drake wrote:

> I will look at the tgz and also cvs update tomorrow when I get in the same 
> building with the box, and send uname -a and .config, and also any 
> observations I can make of the box when I get to it (any messages on the 
> LCD, any ser pim output that it may have, any log messages)...  Next time 
> I'll leave a serial console open to it :)

The LCD screen reads "OFF 0000:".  This is a new one for me :)

uname -a says "Linux krakatoa 2.4.18-pa53 #1 SMP Tue Jul 9 14:38:41 PDT 
2002 parisc unknown"

The last smp kernel to work is:
krakatoa:~# dpkg-deb -I kernel-image-2.4.17-32-smp_23.1_hppa.deb
 new debian package, version 2.0.
 size 2945664 bytes: control archive= 19355 bytes.
     836 bytes,    20 lines      control
   52806 bytes,  1626 lines   *  postinst             #!/usr/bin/perl
    8679 bytes,   226 lines   *  postrm               #!/usr/bin/perl
    8595 bytes,   219 lines   *  preinst              #!/usr/bin/perl
    6591 bytes,   211 lines   *  prerm                #!/usr/bin/perl
 Package: kernel-image-2.4.17-32-smp
 Version: 23.1
 Section: base
 Priority: optional
 Architecture: hppa
 Depends: initrd-tools (>= 0.1.6), fileutils (>= 4.0), modutils (>= 
2.3.12)
 Suggests: palo
 Provides: kernel-image,  kernel-image-2.4
 Installed-Size: 8268
 Maintainer: Bdale Garbee <bdale@gag.com>
 Source: kernel-image-2.4.17-hppa
 Description: 32 bit SMP Linux kernel image for version 2.4.17 on HPPA.
  This package contains the 32 bit SMP Linux kernel image for version
  2.4.17 on HPPA, the corresponding System.map file, and the modules built
  by the packager.  It also contains scripts that try to ensure that the
  system is not left in a unbootable state after an update.
  .
  Kernel image packages are generally produced using kernel-package,
  and it is suggested that you install that package if you wish to
  create a custom kernel.

The log just stops and picks up again when I rebooted.

You can get the .deb for the smp kernel that I build from 
http://linux.apptechsys.com/~jeremyd/kernel-image-2.4.18-pa53_jeremyd.200207091430.smp_hppa.deb

Here's the output of ser pim for the one that has the right date/time 
stamp.  Looks like another "runway broad error" -- broad seems to be short 
for broadcast.
-----------------  Processor 1 HPMC Information ------------------

Timestamp =
  Tue Jul  9 22:21:13 GMT 2002    (20:02:07:09:22:21:13)

HPMC Chassis Codes = 2cbf0  25108  2cbfb

General Registers 0 - 31
00-03   0000000000000000  000000001034cf20  000000001010090c  
0000000000000000
04-07   0000000000354000  00000000f0400008  00000000000000fa  
00000000f0002f68
08-11   0000000000000000  0000000000000000  000000000004000e  
0000000010393408
12-15   00000000000000f2  0000000000000001  0000000000000001  
00000000000000f3
16-19   0000000002020202  0000000000000002  00000000f000016c  
000000001117c000
20-23   0000000000000000  00000000103262a0  0000000010347804  
0000000000000000
24-27   00000000103478e0  0000000000000032  0000000000000019  
0000000010326010
28-31   0000000000000000  0000000000000010  000000001117c6c0  
00000000103478e0

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
08-11   0000000000000114  0000000000000000  00000000000000c0  
000000000000001e
12-15   0000000000000000  0000000000000000  0000000000106000  
00000000ff000000
16-19   000005b532c52d74  0000000000000000  000000001010090c  
0000000003c008b3
20-23   0000000000000000  0000000000000000  000000000006ff0f  
0000000000000000
24-27   0000000000354000  000000001f778000  0000000000044021  
00000000f0412000
28-31   0000000055555555  0000000055555555  000000001117c000  
0000000011111111
Space Registers 0 - 7

00-03   00000000          0000008a          00000000          0000008a
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000010100910
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x0030000d
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0xfffffffffffa2000
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000  
0000000000000000
04-07   2ffba00000000001  000000011015fa10  1035305000000000  
11174000103e8000
08-11   1035305000000002  ffffffff0000000a  10101fc000000000  
103ffdb300000000
12-15   0000000010347810  1117469010148340  1034781010353640  
11174000103e8000
16-19   2ffba00011174000  0000000000000002  000000001034b010  
1034781010346810
20-23   1034701010347810  103478102ffba000  cccccccd51eb874f  
0000000333333334
24-27   b38cf9b100000450  0000000600000000  0000000f102f46a8  
2ffba005102f46b4
28-31   3031323334353637  38396162101485e8  6768696a6b6c6d6e  
6f70717273747576

'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81841000000000
Available Memory             = 0x0000000020000000
CPU Diagnose Register 2      = 0x0201010000000004
CPU Status Register 0        = 0x3440c24000000000
CPU Status Register 1        = 0x8000000000000000
SADD LOG                     = 0x4800000000000000
Read Short LOG               = 0xc1af00fffed30000
ERROR_STATUS                 = 0x0000000000100010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0x020008bc36a20000
RUN_DATA_LOW                 = 0xe840c002000014bc
RUN_CTRL                     = 0x0000005c00001658
RUN_ADDR                     = 0xc13ff0f0f0002b48
System Responder Path        = 0x00ffffffffffffff

HPMC PIM Analysis Information:

Timestamp =
  Tue Jul  9 22:21:13 GMT 2002    (20:02:07:09:22:21:13)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304 
bytes:

CPU 1 observed a Broadcast Error on the Runway Bus.


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not 
log
any additional information about the HPMC.

-----------------  Processor 1 LPMC Information ------------------

Check Type                   = 0x00000000
I/D Cache Parity Info        = 0x00000000
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x00000000
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00000000
System Responder Address     = 0x0000000000000000
System Requestor Address     = 0x0000000000000000

-----------------  Processor 1 TOC Information -------------------

General Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  
0000000000000000

<Press any key to continue (q to quit)>

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
08-11   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
12-15   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
16-19   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
20-23   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
28-31   0000000000000000  0000000000000000  0000000000000000  
0000000000000000
Space Registers 0 - 7

00-03   00000000          00000000          00000000          00000000
04-07   00000000          00000000          00000000          00000000

IIA Space                    = 0x0000000000000000
IIA Offset                   = 0x0000000000000000
CPU State                    = 0x00000000

Memory Error Log Information:

Timestamp =
  Tue Jul  9 22:21:13 GMT 2002    (20:02:07:09:22:21:13)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged


I/O Module Error Log Information:

Timestamp =
  Tue Jul  9 22:21:13 GMT 2002    (20:02:07:09:22:21:13)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc229   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc009   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------


> 
> > 
> > thanks,
> > grant
> > 
> > _______________________________________________
> > parisc-linux mailing list
> > parisc-linux@lists.parisc-linux.org
> > http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> > 
> 
> 

-- 
	NEW YORK-- Kraft Foods, Inc. announced today that its board of
directors unanimously rejected the $11 billion takeover bid by Philip
Morris and Co. A Kraft spokesman stated in a press conference that the
offer was rejected because the $90-per-share bid did not reflect the
true value of the company.
	Wall Street insiders, however, tell quite a different story.
Apparently, the Kraft board of directors had all but signed the takeover
agreement when they learned of Philip Morris' marketing plans for one of
their major Middle East subsidiaries.  To a person, the board voted to
reject the bid when they discovered that the tobacco giant intended to
reorganize Israeli Cheddar, Ltd., and name the new company Cheeses of Nazareth.
