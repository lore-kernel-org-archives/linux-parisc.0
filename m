Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 48FF04900
	for <parisc-linux@lists.parisc-linux.org>; Sat,  6 Oct 2001 11:55:56 -0600 (MDT)
Received: from sh.od.inet (IDENT:root@systemhalted [192.168.1.1])
	by megatonmonkey.net (8.11.0/8.11.0) with ESMTP id f96IWkG31522
	for <parisc-linux@lists.parisc-linux.org>; Sat, 6 Oct 2001 14:32:46 -0400
Received: (from carlos@localhost)
	by sh.od.inet (8.11.0/8.11.0) id f96Htw310654
	for parisc-linux@lists.parisc-linux.org; Sat, 6 Oct 2001 13:55:58 -0400
Date: Sat, 6 Oct 2001 13:55:58 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011006135558.B8206@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Glibc 2.2.4-2 Woes...
List-ID: <linux-parisc.vger.kernel.org>

M,

I see what you mean now.
I have glibc 2.2.4-2 compiling all the way to the point where it
starts churning thorugh:

make  -C sunrpc others
make[2]: Entering directory `/home/carlos/palinux/glibc-2.2.4/glibc-2.2.4/sunrpc'
/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/elf/ld.so.1 --library-path /home/carlos/palinux/glibc-2.2.4/hppa-linux/obj:/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/math:/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/elf:/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/dlfcn:/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/nss:/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/nis:/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/rt:/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/resolv:/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/crypt:/home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/linuxthreads /home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/sunrpc/rpcgen -Y `gcc -print-file-name=cpp | sed 's|/cpp$||'` -c rpcsvc/bootparam_prot.x -o /home/carlos/palinux/glibc-2.2.4/hppa-linux/obj/sunrpc/xbootparam_prot.T

At which point I've followed ld down with gdb to:

0x41003198 <_dl_start+1584>:	copy r1,r20
0x4100319c <_dl_start+1588>:	addil 0,r19,%r1
0x410031a0 <_dl_start+1592>:	copy r1,r21
0x410031ac <_dl_start+1604>:	ldw 2c(sr0,r21),r21
0x410031b0 <_dl_start+1608>:	copy r1,r23
0x410031b4 <_dl_start+1612>:	copy r20,r26
0x410031b8 <_dl_start+1616>:    ldw 30(sr0,r23),r23
0x410031bc <_dl_start+1620>:    b,l 0x41012b70 <__assert_fail>,rp
0x410031c0 <_dl_start+1624>:    copy r21,r25
0x410031c4 <_dl_start+1628>:    addil 0,r19,%r1

The assertion fails.
The address in r21/r25 is 0x15b78, which is clearly not a valid
address, and thus dl's printf barfs.

I will add that the address is not always 0x15b78, and it varies.
Which might mean that it's just random stuff being pulled off
the stack (or I haven't been that thorough in tracing the assembly).

#0  _dl_debug_vdprintf (fd=0, tag_p=0, fmt=0x17c94 <Address 0x17c94 out of bounds>,
    arg=0xbff008d8) at dl-misc.c:101
#1  0x4100ebc8 in _dl_dprintf (fd=2, fmt=0x17c94 <Address 0x17c94 out of bounds>)
    at dl-misc.c:279
#2  0x41012bd0 in __assert_fail (assertion=0x15b64 <Address 0x15b64 out of bounds>,
    file=0x0, line=62, function=0xbff008d8 "") at dl-minimal.c:190
#3  0x410031c4 in _dl_start (arg=0xbff004f4) at rtld.c:62
#4  0x41002ae8 in _dl_start_user () at rtld.c:143

Program received signal SIGSEGV, Segmentation fault.
_dl_debug_vdprintf (fd=0, tag_p=0, fmt=0x17c94 <Address 0x17c94 out of bounds>,
    arg=0xbff008d8) at dl-misc.c:101
101       while (*fmt != '\0')

I'm completely confused by the usage of the registers.
But that's compiler tuned assembly for you :)

It's not something that clearly jumps out at you, and after
tracing about the assembly, trying to follow what goes where,
It is not any clearer.

It's not a blatently obvious mistake :}

---

I've also noticed that the tests for glibc bail out with:

./tst-iconv1: error while loading shared libraries: ./tst-iconv1: symbol __deregister_frame_info, version GLIBC_2.2 not defined in file libc.so.6 with link time reference

Does __deregister_frame_info and __register_frame_info have to do with
the stack unwinding for DWARF2 vsyscalls?

Both of these functions have weak bindings, and I remember there being
some odd rules about bidning in dl_main.

---

c.
