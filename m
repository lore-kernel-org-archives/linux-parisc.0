Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.yashy.com (mail.yashy.com [66.11.170.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1DC1F4829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 24 Sep 2002 22:46:56 -0600 (MDT)
Received: from yashy (helo=localhost)
	by mail.yashy.com with local-esmtp (Exim 4.10)
	id 17u44c-000EBq-00
	for parisc-linux@lists.parisc-linux.org; Wed, 25 Sep 2002 00:46:54 -0400
Date: Wed, 25 Sep 2002 00:46:54 -0400 (EDT)
From: Yasholomew Yashinski <yashy@mail.yashy.com>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020925034329.D56EA4829@dsl2.external.hp.com>
Message-ID: <20020925000736.V54476-100000@mail.yashy.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: B1000
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

On Tue, 24 Sep 2002, Grant Grundler wrote:

> >  I hope all is well. I see that Debian 3 is available now for hppa, so I
> > recently burnt it to try on my B1000. I went to install it tonight,
> > however it's rebooting with:
> >
> > High Priority Machine Check (HPMC): Code=1 regs=102f3080 (Addr=000000000)
> >
> > and on the LCD: FLT CBFB4
>
> FLT CBFB4 is HPMC. Odd that it dies with an HPMC.

 If I boot off the disk (0.9.3 with dist-upgrade, and kernel upgrade), it
seems to work okay, I get to:

 Starting periodic command scheduler: cron.
and then the cursor just flashes. (Tux is in the top left)
At this point the LCD states "Linux 2.4.1932" which is correct.
I use serial console no problem at this stage.

 When I try to boot off the CD I just burnt, it dies with the error
message I placed above. The image I burnt was
debian-30r0-hppa-binary-1.iso from the 2nd ftp site, I just took a guess
which is the proper one to use, as you'll read in my comments below.

> Can you send "ser pim" output to parisc-linux mailing list?
> (hint: setup serial console to capture that)

This is long. I have added addtional comments below.

Main Menu: Enter command > ser pim

PROCESSOR PIM INFORMATION

-----------------  Processor 0 HPMC Information ------------------

Timestamp =
  Tue Sep  24 19:22:19 GMT 2002    (20:02:09:24:19:22:19)

HPMC Chassis Codes = 2cbf0  2500b  2cbfb

General Registers 0 - 31
00-03   0000000000000000  0000000000029a90  0000000000000008
00000000401d3000
04-07   0000000000000000  0000000000000000  0000000000000007
0000000000000001
08-11   0000000000000010  0000000000000001  00000000faf005d0
0000000000000010
12-15   0000000000029a90  0000000000000000  0000000000029a90
0000000000000000
16-19   000000000002b010  0000000000029a90  0000000000029a90
00000000401d3000
20-23   0000000000000000  0000000000000000  000000000000001c
0000000000000000
24-27   0000000000000000  0000000000000000  0000000000000000
0000000000029a90
28-31   0000000000000008  0000000000000000  00000000faf00700
0000000000000000

<Press any key to continue (q to quit)>

Control Registers 0 - 31
00-03   0000000000000000  0000000000000000  0000000000000000
0000000000000000
04-07   0000000000000000  0000000000000000  0000000000000000
0000000000000000
08-11   0000000000000222  0000000000000000  00000000000000c0
000000000000001e
12-15   0000000000000000  0000000000000000  0000000000105000
00000000ffffffff
16-19   0000000b8cba9370  0000000000000111  000000000001555f
000000000e661200
20-23   00000000100403ec  40000000001d3000  00000000000cff0f
0000000000000000
24-27   000000000030b000  000000000f29c000  00000000ffffffff
00000000ffffffff
28-31   00000000ffffffff  00000000ffffffff  000000001f308000
00000000103a0000
Space Registers 0 - 7

00-03   00000111          00000111          00000000          00000111
04-07   00000111          00000111          00000111          00000111

<Press any key to continue (q to quit)>

IIA Space                    = 0x0000000000000111
IIA Offset                   = 0x00000000000151b3
Check Type                   = 0x20000000
CPU State                    = 0x9e000004
Cache Check                  = 0x00000000
TLB Check                    = 0x00000000
Bus Check                    = 0x003010bb
Assists Check                = 0x00000000
Assist State                 = 0x00000000
Path Info                    = 0x00031800
System Responder Address     = 0xfffffffffed10200
System Requestor Address     = 0xfffffffffffa0000

Floating-Point Registers 0 - 31
00-03   0000001f00000000  0000000000000000  0000000000000000
0000000000000000
04-07   1030381000000001  0000000110149d78  000000020028a286
0000000000000000
08-11   1030a02000000002  ffffffff0000000a  0000000000000000
103aed9f00000000
12-15   0000000000000000  0000000010139d8c  0000000010303810
1030081010300810
16-19   1f4a50001039c000  0000000000000002  0000000010300810
1039b8101f4a5000
20-23   1039c00000000000  0000000200000000  0000000000000000
0000000000000000
24-27   0000080000000000  0000001e00000000  103b4d64102b9364
1f4a5005102b9474
28-31   3031323334353637  3839616210139f94  6768696a6b6c6d6e
6f70717273747576

<Press any key to continue (q to quit)>


'9000/785 B,C,J Workstation Unarchitected (per-CPU)', rev 1, 140 bytes:

Check Summary                = 0xcb81041000000000
Available Memory             = 0x0000000010000000
CPU Diagnose Register 2      = 0x0203000000000004
CPU Status Register 0        = 0x2420c20000000000
CPU Status Register 1        = 0x8080000000000000
SADD LOG                     = 0x010008a100000001
Read Short LOG               = 0xc1a0f0f0f0400804
ERROR_STATUS                 = 0x0000000000000010
MEM_ADDR                     = 0x000001ff3fffffff
MEM_SYND                     = 0x0000000000000000
MEM_ADDR_CORR                = 0x000001ff3fffffff
MEM_SYND_CORR                = 0x0000000000000000
RUN_DATA_HIGH                = 0xc1bff0fffed08040
RUN_DATA_LOW                 = 0xc1bff0fffed08040
RUN_CTRL                     = 0x0000021c00001418
RUN_ADDR                     = 0xc1bff0fffed08040
System Responder Path        = 0x00ffffffffffffff


HPMC PIM Analysis Information:

Timestamp =
  Tue Sep  24 19:22:19 GMT 2002    (20:02:09:24:19:22:19)


'9000/785 B,C,J Workstation HPMC PIM Analysis (per-CPU)', rev 0, 1304
bytes:

A Data Miss Timeout occurred while CPU 0 was
requesting information.


Memory/IO Controller Error Analysis Information:

The Memory/IO Controller only observed the Broadcast Error.  It did not
log
any additional information about the HPMC.

<Press any key to continue (q to quit)>

-----------------  Processor 0 LPMC Information ------------------

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


-----------------  Processor 0 TOC Information -------------------

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


<Press any key to continue (q to quit)>

Memory Error Log Information:

Timestamp =
  Tue Sep  24 19:22:19 GMT 2002    (20:02:09:24:19:22:19)


'9000/785 B,C,J Workstation Memory Error Log', rev 0, 64 bytes:

   No memory errors logged


I/O Module Error Log Information:

Timestamp =
  Tue Sep  24 19:22:19 GMT 2002    (20:02:09:24:19:22:19)


'9000/785 B,C,J Workstation IO Error Log', rev 0, 228 bytes:

 Rope     Word1        Word2            Word3
------ ------------ ------------
   0    0x00000000   0x0e0cc009   0x00000000fed30048
   1    0x00000000   0x1e0cc009   0x00000000fed32048
   2    ----------   0x2e0cc009   ------------------
   3    ----------   0x3e0cc009   ------------------
   4    0x00000000   0x4e0cc009   0x00000000fed38048
   5    ----------   0x5e0cc009   ------------------
   6    0x00000000   0x6e0cc009   0x00000000fed3c048
   7    ----------   0x7e0cc009   ------------------
Main Menu: Enter command >

> And can you try one of the more recent net install ISO's from ESIEE?
> See www.parisc-linux.org front page for links to ESIEE downloads.

 Sure, I'll let you know.

 Just a few comments on the two websites.

http://pateam.esiee.fr/ could use an English editor:
 "This website is run by a"  # ran is past tense.
 "Please forgive us if either.. or the server has some troubles" # the
users shouldn't have to apologize to the authors.
 "see the announcement"
 "If you have any questions, suggestions or comments, feel free to contact
us at any time"
 "on the project, the team, and.."
 "Latest News"

http://www.parisc-linux.org
 There are three mirrors containing 600+ MB ISOs. The first link is
broken.
 What is the difference between debian-30r0-hppa-binary-1.iso and
debian-30r0-hppa-binary-1_NONUS.iso on the second ftp site? What are the
other files? (A README in that directory with a brief description of each
would be great).
 When the third ftp site works (only a few times in the past 48 hours,
when I've tried), it contains different files than the others. A README
file would be great here as well.

> >  as soon as it hits Init/BusyBox. Am I to assume the A4977a Vis EG-PCI is
> > still unsupported? If so, any idea when it will be supported? If it is now
> > supported, any idea what needs to change on my end?
>
> Vis-EG PCI is supported and working as a Frame buffer.
> That's known to work on B180/C200/B2600/C3000 and probably a few others.

 Where is this documented? All I could find was the 0.9.3 release
information saying it isn't working yet.

 Thanks for all your efforts in this project. I can't wait to use my
framebuffer on this machine finally. HP/UX is unfortunately too expensive
for a home user, at least from what documentation I could find.

 Signet,

--
Yashy
