Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id QAA03259
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Sep 2000 16:41:39 -0600
Sender: rbrad@mailserv2.iuinc.com
Message-ID: <39B1822A.4E8F20AB@uswest.net>
Date: Sat, 02 Sep 2000 16:41:46 -0600
From: Ryan Bradetich <rbradetich@uswest.net>
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Boot error on C200+
List-ID: <linux-parisc.vger.kernel.org>

Hello,

I am getting the following error when I attempt to boot parisc-linux on
the
C200+.

VFS: Mounted root (nfs filesystem) readonly.
execve /sbin/init c0270008 c0270030

Kernel Fault: Code=7 regs=c7f98248 (Addr=00000110)

PSW  : 0004000b  GR 1 : 00002000  GR 2 : 00013403  GR 3 : 00000000
GR 4 : 2001ff74  GR 5 : 00000000  GR 6 : 000777f4  GR 7 : 000010c4
GR 8 : 000011bc  GR 9 : c7f98000  GR10 : c022fa78  GR11 : c0270030
GR12 : c0270008  GR13 : c022fe14  GR14 : c0270000  GR15 : 617bfdfb
GR16 : c027c60c  GR17 : 00000000  GR18 : c02b0000  GR19 : 00000001
GR20 : 00000037  GR21 : 00089b9c  GR22 : 00089bd8  GR23 : 000010c4
GR24 : 2001ff74  GR25 : 00000001  GR26 : 00000000  GR27 : 00088f00
GR28 : b64d8e60  GR29 : b44302d0  GR30 : 20020140  GR31 : 00022d63
SR0  : 00002000  SR1  : fffd2dff  SR2  : 00000000  SR3  : 00002000
SR4  : 00000000  SR5  : 00002000  SR6  : 00002000  SR7  : 00002000

IASQ : 00000000 00000000 IAOQ : 00000110 00000114 ORIG_R28 : ffdf7fff
 IIR : 43ffff40 ISR : 00000000 IOR : 00000000



Paul Bame helped me start tracking this error down.  I wanted to post
his
analysis along with the boot message to this list for further comment.
(Hopefully his analysis will help other how to start debugging these
errors
as Paul helped me.)

- Kernel Fault Code 7 is an Instruction Memory Protection Trap.

- Stack Pointer (GR30) is in user space.   Most of the time if the
kernel
is in kernel space GR30 will look like this: 0xcxxxxxxx.

- GR2 is often the address where a subroutine will return, so it tells
where
it was called from.  In this case: 00013403.

- The last two bits of GR2 are non-zero, which is consistent with a
userspace program.

- Perform an objdump -d on sash and look for address 133f8.
        (GR2 & 0xfffffffc) - 0x8 (two instructions).

   133f8:       e8 47 12 b4     b,l 22d58 <__libc_fcntl>,rp
   133fc:       34 19 00 02     ldi 1,r25
   13400:       8f 9f 20 50     cmpib,<> -1,ret0,13430
<check_one_fd+0x44>
   13404:       4b c2 3f 59     ldw -54(sr0,sp),rp

- Find out who/what called your kernel, by looking up the sysmbols in
sash (Note the sasy binary must contain symbols):

    hppa-linux-nm -n sash | grep 22d58

00022d58 W __fcntl
00022d58 T __libc_fcntl
00022d58 W fcntl


I am going to start digging around in sash and glibc to see if I can
figure out
anymore information on this problem.  Any help/advice is appreciated.

Thanks,

Ryan
