Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 23028482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 28 Aug 2001 13:21:40 -0600 (MDT)
Date: Tue, 28 Aug 2001 15:22:21 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, baldric-exec@baldric.uwo.ca
Subject: Re: [parisc-linux] Building from scratch.
Message-ID: <20010828152221.B4741@megatonmonkey.net>
References: <20010826162754.A10072@megatonmonkey.net> <20010827203849.H525@parcelfarce.linux.theplanet.co.uk> <20010828003952.M28978@megatonmonkey.net> <20010828061037.A13332@parcelfarce.linux.theplanet.co.uk> <20010828071743.A1289@megatonmonkey.net> <20010828155619.I18341@parcelfarce.linux.theplanet.co.uk> <20010828112900.B30657@megatonmonkey.net> <20010828194713.A2995@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010828194713.A2995@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Tue, Aug 28, 2001 at 07:47:13PM +0100
List-ID: <linux-parisc.vger.kernel.org>

> 
> Mmm.  I would expect it to not work.  My build dies when it uses part of itself
> in the install:
> 
> /home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/obj/elf/ld.so.1 --library-path 
> /home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/obj:/home/willy/glibc/2.2.4-1/g
> libc-2.2.4/hppa-linux/obj/math:/home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/
> obj/elf:/home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/obj/dlfcn:/home/willy/g
> libc/2.2.4-1/glibc-2.2.4/hppa-linux/obj/nss:/home/willy/glibc/2.2.4-1/glibc-2.2.
> 4/hppa-linux/obj/nis:/home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/obj/rt:/ho
> me/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/obj/resolv:/home/willy/glibc/2.2.4
> -1/glibc-2.2.4/hppa-linux/obj/crypt:/home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-l
> inux/obj/linuxthreads /home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/obj/timez
> one/zic -d /home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/install_root/usr/sha
> re/zoneinfo -L /dev/null -y ./yearistype africa
> make[3]: *** [/home/willy/glibc/2.2.4-1/glibc-2.2.4/hppa-linux/install_root/usr/
> share/zoneinfo/Africa/Algiers] Segmentation fault
> 
> running this under gdb gives:
> 
> Program received signal SIGSEGV, Segmentation fault.
> _dl_debug_vdprintf (fd=0, tag_p=0, 
>     fmt=0x173dc <Address 0x173dc out of bounds>, arg=0xbff008d8)
>     at dl-misc.c:101
> 101       while (*fmt != '\0')
> (gdb) bt
> #0  _dl_debug_vdprintf (fd=0, tag_p=0, 
>     fmt=0x173dc <Address 0x173dc out of bounds>, arg=0xbff008d8)
>     at dl-misc.c:101
> #1  0x4100e468 in _dl_dprintf (fd=2, 
>     fmt=0x173dc <Address 0x173dc out of bounds>) at dl-misc.c:273
> #2  0x41012454 in __assert_fail (
>     assertion=0x15314 <Address 0x15314 out of bounds>, file=0x0, line=62, 
>     function=0xbff008d8 "") at dl-minimal.c:190
> #3  0x41002e88 in elf_get_dynamic_info___3 (l=0x2) at rtld.c:62
> #4  0x41002f90 in _dl_start (arg=0xbff004f4) at rtld.c:172
> #5  0x41002ac8 in _dl_start_user () at rtld.c:135
> (gdb) 
> 
> It looks to me like the problem occurred in frame #3 where
> elf_get_dynamic_info was passed `2' as a value.  Bizarrely, this is the
> address of a stack variable (take a look in rtld.c), so I am stumped and
> I've been working on more interesting stuff instead.  I tried several
> times to attract BenC's attention on this and didn't get anywhere.
> 
> -- 
> Revolutions do not require corporate support.

That's odd, I built it fine. And went back and rebuilt the rest of GCC 
while I was at it (had to symlink ./src/linux/include/linux and 
./src/linux/include/asm so that they would sit in 
-isystem $DEST/hppa-linux/include used by the last bits of xgcc)

What is running at the moment? One of the binutils or gcc?
It should most definately not segfault in any of the _dl_xxxxx routines ;)

I grabbed the glibc2.2.4 from the debian pool (orig.tar.gz), then applied
the 2.2.4-1 patch, followed by running the glibc22-hppa.dpatch (since I
don't have any deb tools).

The last two patches should probably have been run in the reverse order,
could this be the crux?

I'm still very confused about the ia64 stuff that wants to get touched
by the glibc22-hppa.dpatch?

Although I've built it all without failing... I have yet to test the
new system.


I will:

- Test the compiler by building a new kernel.
- Test glibc on a 712/60.
- Try to reverse the patching order and see if it compiles.

Cheers,
Carlos.
