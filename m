Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id EAA17397
	for <parisc-linux@puffin.external.hp.com>; Tue, 15 Jun 1999 04:23:08 -0600
From: Ulrich.Strelow@schering.de
Received: from fw-wiss.schering.de (be2314.schering.de [149.234.1.29])
	by be3334.schering.de (8.9.1/8.9.1) with SMTP id MAA12401
	for <parisc-linux@thepuffingroup.com>; Tue, 15 Jun 1999 12:21:48 +0200 (MET DST)
To: parisc-linux@thepuffingroup.com
Message-ID: <C1256791.00392418.00@BE2314.schering.de>
Date: Tue, 15 Jun 1999 12:22:46 +0200
Mime-Version: 1.0
Content-type: text/plain; charset=us-ascii
Subject: [parisc-linux] Compiling Linux Kernel on HP-UX
List-ID: <linux-parisc.vger.kernel.org>



Hi,

I'm trying to compile the latest CVS-snapshot (19990615) on my HP 715/33
using gcc 2.7.2.2 and binutils 2.7. Compiling kernel/sched.c gives the
following error:

sched.c:579: section attributes are not supported for this target

I am running HP-UX 10.20, so I cannot use the depots from
ftp://puffin.external.hp.com/pub/parisc/binaries/depot/.
So the question is: do I need gcc 2.8.1 and binutils 2.9.1 to build the
kernel on HP-UX or is this some other error ?

Ulrich
---------------------------------------------
Ulrich Strelow
<ulrich.strelow@schering.de or
ulrich_strelow@csi.com>
Berlin, Germany
