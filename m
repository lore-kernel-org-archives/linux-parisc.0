From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
Date: Thu, 20 Mar 2003 18:51:27 +0100
Message-ID: <3E689FC4000046DF__38199.8661593117$1416622312$gmane$org@ocpmta1.freegates.net>
References: <200303182055.h2IKthRI017578@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: b.gunreben@web.de, willy@debian.org, doko@cs.tu-berlin.de,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org, kuznet@ms2.inr.ac.ru,
	linux-net@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>, tausq@debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200303182055.h2IKthRI017578@hiauly1.hia.nrc.ca>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

>> 
>> these are definitely kernel addresses....
>
>Right.  I see the code that's causing the problem in kernel/signal.c:
>
>                if (k->sa.sa_handler == SIG_IGN
>		    || (k->sa.sa_handler == SIG_DFL
>
>
>You don't want to canonicalize k->sa.sa_handler here, so a cast to
>void * or something is needed.  The PA is the only port that I am
>aware of that needs to canonicalize function pointers.
>
Well I try to test some:
--- signal.h.orig       2003-03-20 15:12:24.000000000 +0100
+++ signal.h    2003-03-20 15:11:47.000000000 +0100
@@ -106,9 +106,15 @@
 #define SIG_UNBLOCK        1   /* for unblocking signals */
 #define SIG_SETMASK        2   /* for setting the signal mask */
 
+#if __GNUC__ == 3 && __GNUC_MINOR__ >= 3 || __GNUC__ > 3
+#define SIG_DFL        (0)                     /* default signal handling
*/
+#define SIG_IGN        (1)                     /* ignore signal */
+#define SIG_ERR        (-1)                    /* error return from signal
*/
+#else
 #define SIG_DFL        ((__sighandler_t)0)     /* default signal handling
*/
 #define SIG_IGN        ((__sighandler_t)1)     /* ignore signal */
 #define SIG_ERR        ((__sighandler_t)-1)    /* error return from signal
*/
+#endif
 
 # ifndef __ASSEMBLY__

Unfortunaltely, I don't actualy know if it could help because I update kernel
src to pa31 and the problem move to:

IAOQ = 102f1e6c
Func: $lcfu_loop, Off: 0, Addr: 0x102f1e6c
102f1e60:	08 16 32 40 	or,<> r22,r0,r0
102f1e64:	08 00 02 41 	copy r0,r1
102f1e68:	00 01 58 20 	mtsp r1,sr1
102f1e6c <$lcfu_loop>:
102f1e6c:	0f 22 50 21 	ldb,ma 1(sr1,r25),r1
102f1e70:	af 1f 3f ed 	addib,<> -1,r24,102f1e6c <$lcfu_loop>

GR0 = 00000000

GR1 = 000000dd

GR2 = 1016dd94
Func: copy_mount_options, Off: 70, Addr: 0x1016dd94
1016dd90:	08 04 02 58 	copy r4,r24
1016dd94:	0b 84 04 04 	sub r4,ret0,r4
1016dd98:	08 03 02 5a 	copy r3,r26
1016dd9c:	84 80 20 70 	cmpib,= 0,r4,1016dddc <copy_mount_options+0xb8>

GR3 = 1ffb9000

GR4 = 00001000

GR5 = 1ffff005

GR6 = 00001000

GR7 = 107c8788

GR8 = 103ab810
Func: packet_init, Off: 3c, Addr: 0x103ab810
103ab810:	87 80 20 18 	cmpib,= 0,ret0,103ab824 <packet_init+0x50>
103ab814:	22 72 12 06 	ldil 10324800,r19
103ab818:	4a 74 09 48 	ldw 4a4(r19),r20
103ab81c:	6b 80 00 68 	stw r0,34(ret0)

GR9 = 103e0010
Func: Version_132116, Off: 0, Addr: 0x103e0010

GR10 = 10418010
Func: blkdevs, Off: 4e4, Addr: 0x10418010

GR11 = 102f8000
Func: ic_bootp_cookie, Off: 440, Addr: 0x102f8000

GR12 = 10340810
Func: syscall_names, Off: 49c, Addr: 0x10340810

GR13 = 10413810
Func: log_buf, Off: 79e4, Addr: 0x10413810

GR14 = 00000000

GR15 = f0400004

GR16 = f00008c4

GR17 = f000017c

GR18 = f0000174

GR19 = 107c8000

GR20 = bffd00d5

GR21 = f0047000

GR22 = 00000000

GR23 = 00000000

GR24 = 00000005

GR25 = 20000000

GR26 = 1ffb9ffb

GR27 = 10330010
Func: $global$, Off: 0, Addr: 0x10330010

GR28 = fffffff4

GR29 = 80dea173

GR30 = 107c8880

GR31 = 101563e4
Func: blkdev_put, Off: 1f4, Addr: 0x101563e4
101562bc:	86 60 22 50 	cmpib,= 0,r19,101563ec <blkdev_put+0x1fc>
101563e0:	08 1f 02 42 	copy r31,rp
101563e4:	c9 1c 9d d5 	movb,tr ret0,r8,101562d4 <blkdev_put+0xe4>
101563e8:	48 b3 00 30 	ldw 18(r5),r19
101563ec:	08 05 02 5a 	copy r5,r26

Kernel symbols on the stack:
[<1016dd60>]: Func: copy_mount_options, Off: 3c, Addr: 0x1016dd60
[<1016e5e8>]: Func: sys_mount, Off: 30, Addr: 0x1016e5e8
[<101004b8>]: Func: prepare_namespace, Off: bc, Addr: 0x101004b8
[<10100240>]: Func: init, Off: 58, Addr: 0x10100240
[<10108c4c>]: Func: ret_from_kernel_thread, Off: 18, Addr: 0x10108c4c
[<10108cf4>]: Func: _switch_to_ret, Off: 0, Addr: 0x10108cf4
[<1012187c>]: Func: call_console_drivers, Off: b8, Addr: 0x1012187c
[<1012187c>]: Func: call_console_drivers, Off: b8, Addr: 0x1012187c
[<10121d2c>]: Func: release_console_sem, Off: 50, Addr: 0x10121d2c
[<10121b94>]: Func: printk, Off: 1f0, Addr: 0x10121b94
[<101001e8>]: Func: init, Off: 0, Addr: 0x101001e8
[<10126488>]: Func: it_real_fn, Off: 0, Addr: 0x10126488

Any other additional idea?

Thanks,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
