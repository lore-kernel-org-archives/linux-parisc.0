Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from student.cs.ucc.ie (student.cs.ucc.ie [143.239.211.125])
	by dsl2.external.hp.com (Postfix) with ESMTP id 49486482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 08:25:17 -0700 (MST)
Received: from localhost (xam@localhost)
	by student.cs.ucc.ie (8.9.3/8.9.3) with SMTP id PAA08914
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 15:25:35 GMT
Date: Mon, 12 Nov 2001 15:25:35 +0000 (GMT)
From: Markus Grabert <xam@student.cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.OSF.3.96.1011112145357.4562A-100000@student.cs.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] C240: Graphics, 64bit kernel and more
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

Hello,

I'm going to buy a C240 (I already have a 730 (not here) and had a F10).
It has 512MB and FX/2 24bit graphics. I think it's rather good supported
by parisc-linux, am I right ?

Before I actually buy the computer, I wanted to know whether STI
and/or the framebuffer for a 64bit kernel is working.

Moreover I've read that UW-SCSI is not working yet.
So is it working in FAST-SCSI (narrow) mode ?

Are you aware of any other gcc/binutils bugs or should
gcc/binutils NOW create proper executables for pa2.0 and
pa1.1 (including the old CPUs like 730's PCX-S CPU) ?

does produce gcc rather good optimized code for parisc
(compared to HP's cc, is there a significant performance difference) ?

I can imagine that the Linux/HPPA kernel is not very optimized yet
(can't compare the speed on my 730 with HP/UX since I don't
have the OS software anymore ...). Is the speed difference just a
few percent or can you 'feel' it (mhh, fuzzy question) ?

Can I put in any PC PCI graphic card (as a second graphic card) ?
The same for any PC PCI cards (ethernet, modem, TV, ...) ?

Thanks in advance for answering my (newbie) questions!

I installed Linux/HPPA on my 730 (even before the 0.9.0 release),
but I moved to Ireland and the machine is now in Germany ...
I try to follow the mailing list, but I probably haven't read all
the mails, so forgive me if I asked questions already discussed
on the mailing list.

Greetings Max

... and keep on the good work
