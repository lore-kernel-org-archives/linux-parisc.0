Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id PAA11545
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 15:43:03 -0600
Received: from bame.riverrock.org (really [127.0.0.1]) by bame.riverrock.org
	via in.smtpd with esmtp (ident bame using rfc1413)
	id <m12wXAe-001VqQC@chalet> (Debian Smail3.2.0.102)
	for <parisc-linux@thepuffingroup.com>; Mon, 29 May 2000 15:34:00 -0600 (MDT)
Message-Id: <m12wXAe-001VqQC@chalet>
From: bame@puffin.external.hp.com
Reply-To: bame@puffin.external.hp.com
Errors-To: bame@puffin.external.hp.com
To: parisc-linux@thepuffingroup.com
Date: Mon, 29 May 2000 15:34:00 -0600
Sender: bame@bame.riverrock.org
Subject: [parisc-linux] Foiled by the linker again
List-ID: <linux-parisc.vger.kernel.org>


Through some hacks, and special thanks to taggart for producing
header files, I built a tool chain which cross compiles all applications
I've attempted... well almost.  Anyway the good news is I have a
native binutils for palinux.  Unfortunately cross-compiling
bash, tar, and gcc all fail in the link stage with:

/home/bame/xc/bin/../lib/gcc-lib/hppa1.1-linux/2.9-hppa-991112/../../../../hppa1.1-linux/lib/libc.a(execve.o): In function `__execve':
/users/bame/palinux/glibc/posix/../sysdeps/unix/sysv/linux/execve.c:39: undefined reference to `$global$'
collect2: ld returned 1 exit status

I checked, and the absence of $global$ is a special case in the linker.  I
tried adding a file which defined $global$ by hand and that didn't help
either.

My tentative conclusion is that smaller apps link and larger ones don't --
possibly some interaction with the decision to start using %r8-based stubs
when the app gets too big.  I'm stuck.

I'll leave puffin.external.hp.com:~bame/rrtar.o around for anyone who
wants to mess with the linker.  It is the "ld -r" of all the object files
for tar.  'hppa1.1-linux-gcc -o tar rrtar.o' should create tar,
but this causes the (my) linker to fail.

The tool chain I'm using, which has some hand patches in it because I
don't really know where they belong in sources, can be rsync-ed from
puffin.external.hp.com:~bame/xc or grab the tarball
ftp://puffin.external.hp.com/pub/parisc/binaries/tgz/elf32x86.tar.gz

In the meantime I think this is pretty cool:

    VFS: Mounted root (NFS filesystem) readonly.
    request_irq(538, c01aca7c, 0x4000000, serial, c02cf95c)
    Stand-alone shell (version 3.4)
    > ar tv /usr/lib/libcrypt.a
    rw-r--r-- 16602/100  12176 May 28 00:01 2000 crypt-entry.o
    rw-r--r-- 16602/100  29312 May 28 00:01 2000 md5-crypt.o
    rw-r--r-- 16602/100  31364 May 28 00:01 2000 md5.o
    > objdump -d /usr/lib/crti.o
										
    /usr/lib/crti.o:     file format elf32-hppa
										
    Disassembly of section .text:
    Disassembly of section .init:
										
    00000000 <_init>:
       0:   6b c2 3f d9     stw rp,-14(sr0,sp)
       4:   37 de 00 80     ldo 40(sp),sp
       8:   6b d3 3f c1     stw r19,-20(sr0,sp)
       c:   6b c4 3f 81     stw r4,-40(sr0,sp)
      10:   e8 40 00 00     b,l 18 <gcc2_compiled.+0x18>,rp
      14:   08 13 02 44     copy r19,r4
    Disassembly of section .fini:
										
    00000000 <_fini>:
       0:   6b c2 3f d9     stw rp,-14(sr0,sp)
       4:   37 de 00 80     ldo 40(sp),sp
       8:   6b d3 3f c1     stw r19,-20(sr0,sp)
       c:   6b c4 3f 81     stw r4,-40(sr0,sp)
      10:   08 13 02 44     copy r19,r4


	-Paul Bame
