Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (unknown [63.224.241.66])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5985482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Oct 2001 15:54:40 -0600 (MDT)
Date: Sun, 21 Oct 2001 15:54:03 -0600
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011021155403.A2435@beavis.ybsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: rbradetich@uswest.net (Ryan Bradetich)
Subject: [parisc-linux] [PATCH] I/O Tree patch ... CVS Head will be unstable for the next few days.
List-ID: <linux-parisc.vger.kernel.org>

Hello parisc-linux hackers,

The general consensus between the developers is to commit the I/O
tree patch, and fix what is broken.  So I am going to commit the
patch to CVS and start working on bug reports, etc.  

Right now we are pretty sure PAT boxes are broken ... but Grant
has given me access to an A500 to work on so I can fix PAT boxes
to use iotree. 

If you are interested in kernel stability, do not run CVS head
for a couple of days.  I will probably send out another message
once we feel the kernel has stabalized.

Thanks,

- Ryan

P.S. I will start committing the iotree patch in an hour or
so giving anyone a (short) chance to get the latest CVS head
before I commit the patch.
