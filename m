Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id DAA23984
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 03:56:30 -0700
Received: from linuxcare.com.au (HELO front.linuxcare.com.au) (203.29.91.49)
  by mailserv2.iuinc.com with SMTP; 5 Dec 2000 10:53:40 -0000
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id VAA04475
	for <parisc-linux@thepuffingroup.com>; Tue, 5 Dec 2000 21:53:35 +1100
Date: Tue, 5 Dec 2000 21:53:35 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: parisc-linux@thepuffingroup.com
Message-ID: <Pine.LNX.4.21.0012052124480.16721-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] linker magic
List-ID: <linux-parisc.vger.kernel.org>

I've just committed a binutils change that should mean we can build glibc
(and other large shared libs) that happen to use a "ld -r" link stage
without needing to resort to gcc -ffunction-sections.  Previously, a
"ld -r" would combine all input .text sections into one output section,
which, if the library was large enough, would mean that branches couldn't
reach their long-branch or import stubs.  Now the linker will refuse to
combine .text during a "ld -r".  This is done without altering the default
linker scripts, so should be effective even with packages that provide
their own linker scripts.

At the moment, there's no way to turn it off...  Let me know how it goes.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
