Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id F41DE482C
	for <parisc-linux@lists.parisc-linux.org>; Fri, 14 Mar 2003 09:31:35 -0700 (MST)
Date: Fri, 14 Mar 2003 17:31:22 +0100
Message-ID: <3E68A12A0000231A@ocpmta3.freegates.net>
In-Reply-To: <20030314131757.GF29631@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: "Matthew Wilcox" <willy@debian.org>
Cc: "Randolph Chung" <tausq@debian.org>,
	"Matthias Klose" <doko@cs.tu-berlin.de>,
	debian-hppa@lists.debian.org, debian-gcc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org,
	"Alexey Kuznetsov" <kuznet@ms2.inr.ac.ru>, linux-net@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>
>On Fri, Mar 14, 2003 at 01:48:59PM +0100, Joel Soete wrote:
>> net/network.o(.text.rtnetlink_rcv+0x84): In function `rtnetlink_rcv':
>> : undefined reference to `rtnetlink_rcv_skb'
>> make: *** [vmlinux] Error 1
>> 
>> (with gcc-3.2 with same src && same .config there was no pb)
>
>You've just hit the gcc thinks it's smarter than you are bug.
>
>net/core/rtnetlink.c:extern __inline__ int rtnetlink_rcv_skb(struct sk_buff
>*skb)
>
>gcc 3.3 decides to not believe you want this function inlined.  probably
>the right fix for this is to make this function static inline (you can
>drop the `__' around inline, it's not necessary).  This is also the case
>for linux 2.5.
>
Right Willy that allow to compile :)

Unfortunately it failled to boot :_( with following dump:
Freeing unused kernel memory: 246k freed

Stack Dump:
 10674680:  0006ff0f 10371278 100dc000 00000000 
 10674670:  107dd2a0 101639e4 107dd220 103fcc80 
 10674660:  10398010 1003bd20 00027174 faf00068 
 10674650:  100bbd20 00000001 00000040 100bba00 
 10674640:  00000000 00000000 00000000 00000004 
 10674630:  faf00290 101342f8 00020002 00020002 

Kernel addresses on the stack:
 [<101639e4>]  [<101342f8>]  [<1010bbf8>]  [<101346d4>] 
 [<10110f90>]  [<10110084>]  [<1010fcf4>]  [<10164e10>] 
 [<101639e4>]  [<1017bfc4>]  [<1017c21c>]  [<1012d9f4>] 


Kernel Fault: Code=15 regs=10674680 (Addr=00027750)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001101111111100001111 Not tainted
r00-03  00000000 103eee50 101342f8 00027750
r04-07  00000000 0000000e 0000000e 00027174
r08-11  00016800 00000001 10674000 1017c21c
r12-15  00027174 ffffffff 00000000 00000000
r16-19  103af5c0 00027974 ffffffff 10398010
r20-23  00001000 00027753 fffffff8 100bb9f4
r24-27  00000000 10674558 00027752 10398010
r28-31  00027752 00000000 10674680 40061077
sr0-3   00000001 00000001 00000000 00000001
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 10351b7c 10351b80
 IIR: 0c601094    ISR: 00000000  IOR: 00027750
 CPU:        0   CR30: 10674000 CR31: 10438000
 ORIG_R28: 00001000

Submitted to dump_analyser.sh, I obtain:

IAOQ = 10351b7c
Func: __canonicalize_funcptr_for_compare, Off: 38, Addr: 0x10351b7c
10351b70:	2a 6b 50 00 	addil 56800,r19,%r1
10351b74:	48 21 0c a8 	ldw 654(r1),r1
10351b78:	d4 60 1c 1e 	depwi 0,31,2,r3
10351b7c:	0c 60 10 94 	ldw 0(sr0,r3),r20

GR0 = 00000000

GR1 = 103eee50
Func: _GLOBAL_OFFSET_TABLE_, Off: 0, Addr: 0x103eee50

GR2 = 101342f8
Func: do_sigaction, Off: a8, Addr: 0x101342f8
101342f0:	e8 50 0b 39 	b,l 10114894 <print_parisc_device+0x3d0>,rp
101342f4:	0c 73 12 99 	stw r19,-4(sr0,r3)
101342f8:	34 1a 00 02 	ldi 1,r26
101342fc:	e8 50 0b 21 	b,l 10114894 <print_parisc_device+0x3d0>,rp

GR3 = 00027750

GR4 = 00000000

GR5 = 0000000e

GR6 = 0000000e

GR7 = 00027174

GR8 = 00016800

GR9 = 00000001

GR10 = 10674000

GR11 = 1017c21c
Func: sys_dup, Off: 28, Addr: 0x1017c21c
1017c210:	34 13 3f ef 	ldi -9,r19
1017c214:	e8 5f 1b ed 	b,l 1017c010 <dupfd>,rp
1017c218:	08 00 02 40 	nop
1017c21c:	08 1c 02 53 	copy ret0,r19

GR12 = 00027174

GR13 = ffffffff

GR14 = 00000000

GR15 = 00000000

GR16 = 103af5c0
Func: init_mm, Off: 0, Addr: 0x103af5c0

GR17 = 00027974

GR18 = ffffffff

GR19 = 10398010
Func: $global$, Off: 0, Addr: 0x10398010

GR20 = 00001000

GR21 = 00027753

GR22 = fffffff8

GR23 = 100bb9f4

GR24 = 00000000

GR25 = 10674558

GR26 = 00027752

GR27 = 10398010
Func: $global$, Off: 0, Addr: 0x10398010

GR28 = 00027752

GR29 = 00000000

GR30 = 10674680

GR31 = 40061077

Kernel symbols on the stack:
[<101639e4>]: Func: dentry_open, Off: f4, Addr: 0x101639e4
[<101342f8>]: Func: do_sigaction, Off: a8, Addr: 0x101342f8
[<1010bbf8>]: Func: handle_interruption, Off: 150, Addr: 0x1010bbf8
[<101346d4>]: Func: sys_rt_sigaction, Off: 84, Addr: 0x101346d4
[<10110f90>]: Func: syscall_exit, Off: 0, Addr: 0x10110f90
[<10110084>]: Func: intr_check_sig, Off: 0, Addr: 0x10110084
[<1010fcf4>]: Func: _switch_to_ret, Off: 0, Addr: 0x1010fcf4
[<10164e10>]: Func: chrdev_open, Off: 64, Addr: 0x10164e10
[<101639e4>]: Func: dentry_open, Off: f4, Addr: 0x101639e4
[<1017bfc4>]: Func: locate_fd, Off: 70, Addr: 0x1017bfc4
[<1017c21c>]: Func: sys_dup, Off: 28, Addr: 0x1017c21c
[<1012d9f4>]: Func: it_real_fn, Off: 0, Addr: 0x1012d9f4

Done.

It doesn't help me more right now (some sleep need :) ).

Thanks,
    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Faites des economies avec Tiscali Complete
... Plus d'info sur http://complete.tiscali.be
