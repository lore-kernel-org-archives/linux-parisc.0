Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4A3AD4A19
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 Mar 2001 16:53:06 -0700 (MST)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id KAA30545;
	Wed, 21 Mar 2001 10:51:11 +1100
Date: Wed, 21 Mar 2001 10:51:11 +1100 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Matt Taggart <taggart@carmen.fc.hp.com>
Cc: randolph@tausq.org, "Paul J.Y. Lahaie" <plahaie@linuxcare.com>,
	Richard Hirst <rhirst@linuxcare.com>,
	Jane Vinet <jvinet@linuxcare.com>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.21.0103210901030.25567-100000@front.linuxcare.com.au>
Message-ID: <Pine.LNX.4.21.0103211008160.25567-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Re: c++ problem
List-ID: <linux-parisc.vger.kernel.org>

On Wed, 21 Mar 2001, Alan Modra wrote:

> What is interesting from the above is that if my std::basic_ios::widen
> function happened to need a plt call stub, then my `hello' prog would
> crash too for the same reason.

This is probably relevant to the perl problem too, hence the extra cc's.

Take a look at the following gdb dump.  I've added a few comments `#...'

alan@tea:/scsi/tmp$ gdb test.tagg2
GNU gdb 5.0
Copyright 2001 Free Software Foundation, Inc.
GDB is free software, covered by the GNU General Public License, and you are
welcome to change it and/or distribute copies of it under certain conditions.
Type "show copying" to see the conditions.
There is absolutely no warranty for GDB.  Type "show warranty" for details.
This GDB was configured as "hppa-linux"...(no debugging symbols found)...
(gdb) set env LD_LIBRARY_PATH=.
(gdb) b *0x1724			# The plt call stub where we crash
Breakpoint 1 at 0x1724
(gdb) b _init
Breakpoint 2 at 0x16c4
(gdb) b _start
Breakpoint 3 at 0x17b4
(gdb) r
Starting program: /scsi/tmp/test.tagg2 

Breakpoint 1, 0x00001724 in _end_init ()
(gdb) set var $dp=0x2d90	# cheat.  set up dp = $global$
(gdb) c
Continuing.

Breakpoint 1, 0x00001724 in _end_init ()
(gdb) p/x $dp
$1 = 0x2d90
(gdb) c
Continuing.

Breakpoint 1, 0x00001724 in _end_init ()
(gdb) c
Continuing.

Breakpoint 1, 0x00001724 in _end_init ()
(gdb) c
Continuing.

Breakpoint 3, 0x000017b4 in _start ()
(gdb) c
Continuing.

Breakpoint 2, 0x000016c4 in _init ()
(gdb) c
Continuing.

Breakpoint 1, 0x00001724 in _end_init ()
(gdb) disable 1
(gdb) c
Continuing.
Hello

Program exited normally.

The problem is that dp is set up in _start.  Any plt call stubs __in the
main application__ called before _start runs will die horribly.  It's OK
to call plt call stubs in a shared lib as they use r19.

I propose we set up dp in the dynamic linker to avoid this problem, as
it's quite legal to have a mix of static and dynamic libraries, each
needing to run constructors.

Alan
-- 
Linuxcare
