Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9A856482A
	for <parisc-linux@parisc-linux.org>; Sun,  6 May 2001 16:14:37 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14wWmg-0002JU-00; Sun, 06 May 2001 23:13:46 +0100
Date: Sun, 6 May 2001 23:13:46 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Ulrich Drepper <drepper@cygnus.com>
Cc: Matthew Wilcox <matthew@wil.cx>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
Message-ID: <20010506231346.A4917@parcelfarce.linux.theplanet.co.uk>
References: <20010504220214.I32445@parcelfarce.linux.theplanet.co.uk> <200105042131.RAA15852@hiauly1.hia.nrc.ca> <20010504223825.J32445@parcelfarce.linux.theplanet.co.uk> <m3d79ngg0w.fsf@otr.mynet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m3d79ngg0w.fsf@otr.mynet>; from drepper@redhat.com on Sat, May 05, 2001 at 11:14:55PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, May 05, 2001 at 11:14:55PM -0700, Ulrich Drepper wrote:
> Matthew Wilcox <matthew@wil.cx> writes:
> 
> > On Fri, May 04, 2001 at 05:31:30PM -0400, John David Anglin wrote:
> > > Doesn't look like _setjmp comes back at all.  Put a break on ea18
> > > and start stepping.  It might help to do a static link.
> > 
> > this code is in the dynamic linker :-))
> 
> And the problem is?  I debug ld.so as a normal program.  The necessary
> patches I came up with are in the official gdb for quite some time
> now.

ok, here's a gdb session from yesterday.  i'm trying to find out why
dlfcn/tst-dladdr is failing.

here's my .gdbinit:

set env GCONV_PATH=/home/willy/cvs/glibc-B/iconvdata
set env LC_ALL=C
file /home/willy/cvs/glibc-B/elf/ld.so.1
set args --library-path /home/willy/cvs/glibc-B:/home/willy/cvs/glibc-B/math:/home/willy/cvs/glibc-B/elf:/home/willy/cvs/glibc-B/dlfcn:/home/willy/cvs/glibc-B/nss:/home/willy/cvs/glibc-B/nis:/home/willy/cvs/glibc-B/rt:/home/willy/cvs/glibc-B/resolv:/home/willy/cvs/glibc-B/crypt:/home/willy/cvs/glibc-B/linuxthreads /home/willy/cvs/glibc-B/dlfcn/tst-dladdr --direct
break _dl_init
run
add-symbol-file /home/willy/cvs/glibc-B/dlfcn/tst-dladdr 0x010000
add-symbol-file /home/willy/cvs/glibc-B/dlfcn/libdl.so 0x40001000
add-symbol-file /home/willy/cvs/glibc-B/libc.so 0x040014000

start gdb, check the /proc/<pid>/maps file:

0000000000010000-0000000000012000 r-xp 0000000000000000 08:03 279751     /home/willy/cvs/glibc-B/dlfcn/tst-dladdr
0000000040001000-0000000040004000 r-xp 0000000000000000 08:03 279740     /home/willy/cvs/glibc-B/dlfcn/libdl.so
0000000040014000-0000000040141000 r-xp 0000000000000000 08:03 639967     /home/willy/cvs/glibc-B/libc.so
0000000041000000-000000004101a000 r-xp 0000000000000000 08:03 1327771    /home/willy/cvs/glibc-B/elf/ld.so

so all seems well.

here's the output from gdb:

This GDB was configured as "hppa2.0-unknown-linux-gnu".
Breakpoint 1 at 0xebe8: file dl-init.c, line 98.
Breakpoint 1 at 0x4100ebe8: file dl-init.c, line 98.

Breakpoint 1, _dl_init (main_map=0x84690, argc=545552, argv=0x86210, env=0x0)
    at dl-init.c:98
98        if (__builtin_expect (_dl_initfirst != NULL, 0))
add symbol table from file "/home/willy/cvs/glibc-B/dlfcn/tst-dladdr" at
        .text_addr = 0x10000
add symbol table from file "/home/willy/cvs/glibc-B/dlfcn/libdl.so" at
        .text_addr = 0x40001000
add symbol table from file "/home/willy/cvs/glibc-B/libc.so" at
        .text_addr = 0x40014000
(gdb) break main 
Breakpoint 2 at 0x10614: file ../test-skeleton.c, line 123.
(gdb) c
Continuing.

Breakpoint 1, _dl_init (main_map=0x3, argc=-2147483646, argv=0x0, 
    env=0x40157ebc) at dl-init.c:98
98        if (__builtin_expect (_dl_initfirst != NULL, 0))
(gdb) c
Continuing.
/home/willy/cvs/glibc-B/dlfcn/tst-dladdr: dladdr failed

Program exited with code 01.

so the program never stops at main().

-- 
Revolutions do not require corporate support.
