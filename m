Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1A84B4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 May 2003 06:08:05 -0600 (MDT)
Date: Mon, 19 May 2003 12:07:28 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Inconsistency detected by ld.so:.. / do_page_fault()
In-Reply-To: <20030518203855.GK548@tausq.org>
Message-ID: <Pine.BSF.4.53.0305191159520.86062@e0-0.zab2.int.zabbadoz.net>
References: <Pine.BSF.4.53.0305181226340.86062@e0-0.zab2.int.zabbadoz.net>
 <20030518161001.GG548@tausq.org> <Pine.BSF.4.53.0305181640470.86062@e0-0.zab2.int.zabbadoz.net>
 <20030518171645.GH548@tausq.org> <Pine.BSF.4.53.0305181942400.86062@e0-0.zab2.int.zabbadoz.net>
 <20030518203855.GK548@tausq.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sun, 18 May 2003, Randolph Chung wrote:

Hi,

> > rebuild vim by hand with gcc 3.3 and it again segfaulted on startup :(
> > seems like this is a problem with shared libs ?
>
> don't rebuild vim, rebuild glibc :)

just to note for the further message; the machine (715/100) is running:
Linux apollo 2.5.69-pa1 #22 Sat May 17 16:48:19 UTC 2003 parisc GNU/Linux
gcc-3.3, binutils 2.14.90.0.1-0.1, libc6 2.3.1-17


ok, started glibc build over night and ...

--- cut ---
gcc-3.3 tst-pathopt.c -c -std=3Dgnu99 -O2 -Wall -Winline -Wstrict-prototype=
s -Wwrite-strings -fstrict-aliasing -g -pipe      -I../include -I. -I/u1/sr=
c/glibc/glibc-2.3.1/hppa-linux/obj/elf -I.. -I../libio  -I/u1/src/glibc/gli=
bc-2.3.1/hppa-linux/obj -I../sysdeps/hppa/elf -I../linuxthreads/sysdeps/uni=
x/sysv/linux/hppa -I../linuxthreads/sysdeps/unix/sysv/linux -I../linuxthrea=
ds/sysdeps/pthread -I../sysdeps/pthread -I../linuxthreads/sysdeps/unix/sysv=
 -I../linuxthreads/sysdeps/unix -I../linuxthreads/sysdeps/hppa -I../sysdeps=
/unix/sysv/linux/hppa -I../sysdeps/unix/sysv/linux -I../sysdeps/gnu -I../sy=
sdeps/unix/common -I../sysdeps/unix/mman -I../sysdeps/unix/inet -I../sysdep=
s/unix/sysv -I../sysdeps/unix -I../sysdeps/posix -I../sysdeps/hppa/hppa1.1 =
-I../sysdeps/wordsize-32 -I../sysdeps/ieee754/flt-32 -I../sysdeps/ieee754/d=
bl-64 -I../sysdeps/ieee754/ldbl-128 -I../sysdeps/hppa/fpu -I../sysdeps/hppa=
 -I../sysdeps/ieee754 -I../sysdeps/generic/elf -I../sysdeps/generic  -nostd=
inc -isystem /usr/lib/gcc-lib/hppa-linux/3.3/include -isystem /usr/src/kern=
el-headers-2.5.69-pa1-hppa/include -D_LIBC_REENTRANT -include ../include/li=
bc-symbols.h   -DNOT_IN_libc=3D1    -o /u1/src/glibc/glibc-2.3.1/hppa-linux=
/obj/elf/tst-pathopt.o
make[4]: Target `tests' not remade because of errors.
make[4]: Leaving directory `/u1/src/glibc/glibc-2.3.1/glibc-2.3.1/elf'
make[3]: *** [elf/tests] Error 2
make[3]: Target `check' not remade because of errors.
make[3]: Leaving directory `/u1/src/glibc/glibc-2.3.1/glibc-2.3.1'
make[2]: *** [check] Error 2
make[2]: Leaving directory `/u1/src/glibc/glibc-2.3.1/hppa-linux/obj'
date >>/u1/src/glibc/glibc-2.3.1/log-test-hppa-linux
make[1]: Leaving directory `/u1/src/glibc/glibc-2.3.1'
touch /u1/src/glibc/glibc-2.3.1/hppa-linux/compiled-source
Segmentation fault
--- cut ---


my ssh connection had been terminated/crashed I woke up this morning
and after re-connection I had those in dmegs:

--- cut ---
do_page_fault() pid=3D268 command=3D'sshd' type=3D6 address=3D0x00000003

YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 401e3e44 40110d07 401e75b0
r04-07  401e75b0 401e5644 00000002 000fe588
r08-11  00000001 000f7f60 000fa438 000e7760
r12-15  00000001 000f7f60 000e7760 000e7760
r16-19  000e7760 00000004 00000004 401e5644
r20-23  00000060 00000000 0002ad9c faf01020
r24-27  00000004 00000001 401e75b0 000e7760
r28-31  00000001 00000000 faf00e40 0002e8d3
sr0-3   00000000 000004bf 00000000 000004bf
sr4-7   000004bf 000004bf 000004bf 000004bf

IASQ: 000004bf 000004bf IAOQ: 00000003 00000007
IIR: 34250fe0    ISR: 000004bf  IOR: 401df8ec
CPU:        0   CR30: 15b84000 CR31: 102e1000
ORIG_R28: 00000000

kernel BUG at mm/memory.c:1443!
Kernel addresses on the stack:
 [<1012414c>] printk+0x17c/0x1bc
 [<101059e8>] dump_stack+0x10/0x1c
 [<101492dc>] do_file_page+0x124/0x12c
 [<101493c0>] handle_mm_fault+0xdc/0x16c
 [<10104a6c>] do_page_fault+0x218/0x2a8
 [<10126ca4>] do_setitimer+0x208/0x238
 [<10106364>] handle_interruption+0x274/0x5b4
 [<1012be1c>] sys_alarm+0x28/0x44
 [<1010afe8>] syscall_exit+0x0/0x28
 [<1010a088>] intr_check_sig+0x0/0xc

kernel BUG at mm/memory.c:1443!
Kernel addresses on the stack:
 [<1012414c>] printk+0x17c/0x1bc
 [<101059e8>] dump_stack+0x10/0x1c
 [<101492dc>] do_file_page+0x124/0x12c
 [<101493c0>] handle_mm_fault+0xdc/0x16c
 [<101ec820>] sock_aio_write+0xc4/0xdc
 [<10104a6c>] do_page_fault+0x218/0x2a8
 [<1014b188>] unmap_vma_list+0x24/0x3c
 [<10106364>] handle_interruption+0x274/0x5b4
 [<10157310>] __fput+0x90/0xf4
 [<1015661c>] sys_write+0x4c/0x68
 [<1010afe8>] syscall_exit+0x0/0x28
 [<1010a088>] intr_check_sig+0x0/0xc
--- cut ---


then tried to shutdown and got an endless loop of those:

--- cut ---
kernel BUG at include/linux/swapops.h:68!
Kernel addresses on the stack:
 [<1012414c>] printk+0x17c/0x1bc
 [<101059e8>] dump_stack+0x10/0x1c
 [<10152790>] unuse_pmd+0x160/0x168
 [<101ce120>] blk_remove_plug+0x5c/0x84
 [<1015281c>] unuse_pgd+0x84/0x110
 [<10120168>] schedule+0x1cc/0x40c
 [<10152914>] unuse_vma+0x6c/0xf4
 [<10152a0c>] unuse_process+0x70/0xbc
 [<10152ce8>] try_to_unuse+0x240/0x620
 [<10153650>] sys_swapoff+0x1f8/0x384
 [<1014b6a4>] sys_munmap+0x50/0x6c
 [<1010afe8>] syscall_exit+0x0/0x28
 [<1010a088>] intr_check_sig+0x0/0xc

kernel BUG at include/linux/swapops.h:68!
Kernel addresses on the stack:
 [<1012414c>] printk+0x17c/0x1bc
 [<101059e8>] dump_stack+0x10/0x1c
 [<10152790>] unuse_pmd+0x160/0x168
 [<101ce120>] blk_remove_plug+0x5c/0x84
 [<1015281c>] unuse_pgd+0x84/0x110
 [<10120168>] schedule+0x1cc/0x40c
 [<10152914>] unuse_vma+0x6c/0xf4
 [<10152a0c>] unuse_process+0x70/0xbc
 [<10152ce8>] try_to_unuse+0x240/0x620
 [<10153650>] sys_swapoff+0x1f8/0x384
 [<1014b6a4>] sys_munmap+0x50/0x6c
 [<1010afe8>] syscall_exit+0x0/0x28
 [<1010a088>] intr_check_sig+0x0/0xc
--- cut ---

--=20
Greetings

Bjoern A. Zeeb=09=09=09=09bzeeb at Zabbadoz dot NeT
56 69 73 69 74=09=09=09=09http://www.zabbadoz.net/
