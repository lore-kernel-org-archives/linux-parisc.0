From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] hppa DIR21L and DIR14R relocs against read-only data?
Date: Wed, 12 Apr 2006 23:34:09 -0400
Message-ID: <119aab440604122034t1feabb5ftcfa14bc49d79c6cf@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: "Randolph Chung" <randolph@tausq.org>,
 "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

I'm looking for any generic pointers to something I might have missed.
I'll probably cc libc-ports next.

1. Merged my tls changes into local copy upstream binutils.
2. Merge changes into local copy of upstream glibc.
3. Build binutils, build gcc with binutils, build glibc with binutils and g=
cc.

The trial by fire is the first run of rpcgen for the newly built dynamic lo=
ader.
The dynamic loader crashes with a sigsegv trying to handle a relocation to
a read-only section.

The following interesting relocs are emitted in the dynamic loader:

0001751c  00000302 R_PARISC_DIR21L   0001a528   .rodata + 3674
00017520  00000306 R_PARISC_DIR14R   0001a528   .rodata + 3674
000175a0  00000302 R_PARISC_DIR21L   0001a528   .rodata + 3668
000175b0  00000306 R_PARISC_DIR14R   0001a528   .rodata + 3668

I have support for these in my local glibc patches.
I can debug all the way to the handling of the DIR21L reloc.

(gdb) disassemble 0x4139ee1c 0x4139ee1f
Dump of assembler code from 0x4139ee1c to 0x4139ee1f:
0x4139ee1c <_dl_start+1752>:    stw r20,0(,r7)
End of assembler dump.
(gdb) i r r20
r20            0x239d8826       597526566
(gdb) i r r7
r7             0x413b351c       1094399260

This last instruction is the store to reloc_addr of the newly computed valu=
e.

(gdb) si

Program received signal SIGSEGV, Segmentation fault.
_dl_start (arg=3D0xc00bfc70) at dl-machine.h:595
595             *(unsigned int *)reloc_addr =3D insn;
(gdb)

The map at the time was:

4139c000-413bb000 r-xp 00000000 08:01 5407284                        =20
  /mnt/flaire/src/glibc-work/builds/libc/elf/ld.so

413ca000-413ce000 rwxp 0001e000 08:01 5407284                        =20
  /mnt/flaire/src/glibc-work/builds/libc/elf/ld.so

c00bf000-c00d4000 rwxp c00bf000 00:00 0
[stack]

How does this normally work?
Did I break something fundamental in the toolchain?
I didn't expect to see

Cheers,
Carlos.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
