Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id IAA11901
	for <parisc-linux@puffin.external.hp.com>; Mon, 22 Jan 2001 08:59:56 -0700
Received: from athena.louisville.edu (athena.louisville.edu [136.165.1.37])
	by erouter1.it-datacntr.louisville.edu (Postfix) with ESMTP id AD2C722EBC
	for <parisc-linux@thepuffingroup.com>; Mon, 22 Jan 2001 10:49:44 -0500 (EST)
Date: Mon, 22 Jan 2001 10:49:12 -0500
From: "Phillip D. Beal" <pdbeal@louisville.edu>
To: parisc-linux@thepuffingroup.com
Message-ID: <20010122104912.B56158@athena.louisville.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Kernel Swapping yet?
List-ID: <linux-parisc.vger.kernel.org>

Hey,

I've been playing around with the 715 I got to boot, and I've found an
odd occurance.  If I open an existing file with vi, and hit escape the
kernel crashes.  It doesn't matter if the file is locally or on a remote
system it does it either way.  So, I remeber the instructions from the
PA-Linux 0.1 CD saying the kernel isn't useing the swap space yet.  Is
this still true? I know the problem is not vi because the kernel dies
even if I use vi on the remote system.  The PARISC system dies when I go
to hit ESC to exit insert mode of vi.

Thanks,
-- 
Phillip Beal                           ___           _               _   
Electrical and Computer Engineering   | _ ) ___ __ _| |___  _ _  ___| |_ 
pdbeal@louisville.edu                 | _ \/ -_) _` | |_ /_| ' \/ -_)  _|
http://www.bealz.net/                 |___/\___\__,_|_/__(_)_||_\___|\__|
