Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA20322
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 Jan 2001 17:44:41 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 26 Jan 2001 00:48:32 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Lx43-0002qk-00
	for parisc-linux@thepuffingroup.com; Fri, 26 Jan 2001 00:48:31 +0000
Date: Fri, 26 Jan 2001 00:48:31 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] linux-2.4.0
Message-ID: <20010126004831.A8137@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>


ok, the merge is complete and the head of the tree is now linux-2.4.0.
it's marked with the LINUS_240_DEVEL tag.  sorry for messing it up
so badly.

drivers/pci is almost unaltered from 2.4.0-test10 as grant thinks the
changes which have been made will break our PCI code.

a few conflicts worth noting... jsm had merged some stuff from -test11
into our tree.  dealt with those dual patches, no problem.

kernel/ptrace.c, kernel/module.c got some cache flushing changeswhich
conflicted with some of ours (only textually, not semantically).

tulip_core.c seemed to have absorbed some of our patches.  acenic.c had
some small changes.

we have large outstanding diffs in the scsi directory -- richard
volunteered to take care of this.  some other drivers need submitting
/ updating.

i'm going to send linus a patch tomorrow to get our arch/parisc and
include/asm-parisc trees uptodate in his tree.

-- 
Revolutions do not require corporate support.
