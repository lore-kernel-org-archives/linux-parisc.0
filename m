Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id WAA19143
	for <parisc-linux@puffin.external.hp.com>; Sat, 4 Nov 2000 22:01:06 -0700
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id QAA02661;
	Sun, 5 Nov 2000 16:02:43 +1100
Date: Sun, 5 Nov 2000 16:02:43 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Randolph Chung <randolph@tausq.org>
cc: parisc-linux@puffin.external.hp.com, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldd segfaulting?
In-Reply-To: <20001104180203.A1271@tausq.org>
Message-ID: <Pine.LNX.4.21.0011051539120.2082-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Sat, 4 Nov 2000, Randolph Chung wrote:

> frodo:~# ldd ./test
> 
> do_page_fault() pid=144 command='ld.so.1'

Most likely a case of new kernel, ld.so compiled with old gcc.  Old is
earlier than 25th Oct.  Before that gcc put plabels, which need
relocating, in .rodata, which is mapped read-only.  The new kernel
enforces the read-only mapping, so you run into problems when ld.so tries
to relocate itself.

Fortunately, you only need recompile glibc with a new gcc.  Older binaries
with plabels in .rodata are handled OK as ld.so re-maps the segments
read/write, something it doesn't manage to do for itself.

Alan Modra
-- 
Linuxcare.  Support for the Revolution.
