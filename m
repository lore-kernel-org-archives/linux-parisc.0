Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 50980482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 12:54:20 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19c8Rm-0002a2-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 14:53:14 -0400
Date: Mon, 14 Jul 2003 14:53:13 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030714185313.GE14114@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] oops with 2.4.20-pa10-UP on rp2430
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

pa,

In an attempte to get a new rp2430 booting I tried the latest online
kernels without much success.

ftp://ftp.parisc-linux.org/kernels/a500

Booted 2.4.20-UP
Using teh dump-analyzer, but objdump on x86 complains a little about the
architecture... objdump: Can't disassemble for architecture UNKNOWN!,
which I'm assuming means I should probably be using a cross or
multi-arch binutils to do this?
---

IAOQ = 000000001011675c
Func: iosapic_set_irt_data, Off: c, Addr: 0x1011675c

GR0 = 0000000000000000

GR1 = 00000000103d2530
Func: __gp, Off: 1800, Addr: 0x103d2530

GR2 = 00000000101168ac
Func: iosapic_enable_irq, Off: 3c, Addr: 0x101168ac

GR3 = 00000000103d0d30
Func: __gp, Off: 0, Addr: 0x103d0d30

GR4 = 0000000010054db8

GR5 = 00000000103d0d30
Func: __gp, Off: 0, Addr: 0x103d0d30

GR6 = 00000000103c8690
Func: __stop___ksymtab, Off: 14840, Addr: 0x103c8690

GR7 = 00000000102ede58
Func: twist_table___0, Off: 4d0, Addr: 0x102ede58

GR8 = 0000000010452228
Func: IRQ_ports, Off: 428, Addr: 0x10452228

GR9 = 0000000004000000

GR10 = 00000000000243c8

GR11 = 00000000faf00012

GR12 = 000000000000ffff

GR13 = 0000000000013000

GR14 = 0000000000013000

GR15 = 0000000000013000

GR16 = 0000000000005000

GR17 = 0000000000013000

GR18 = 00000000000243c8

GR19 = 0000000000000000

GR20 = 00000000103d7530
Func: __gp, Off: 6800, Addr: 0x103d7530

GR21 = 0000000000000000

GR22 = 0000000010079200

GR23 = 00000000102ede58
Func: twist_table___0, Off: 4d0, Addr: 0x102ede58

GR24 = 0000000017a0d00c

GR25 = 0000000017a0d008

GR26 = 0000000010054db8

GR27 = 00000000103d0d30
Func: __gp, Off: 0, Addr: 0x103d0d30

GR28 = 0000000000000060

GR29 = 0000000017a0d070

GR30 = 0000000017a0d080

GR31 = 0000000000000000

Kernel symbols on the stack:
[<0000000010153e44>]: Func: __alloc_pages, Off: 84, Addr: 0x10153e44
[<000000001010d714>]: Func: enable_irq, Off: 5c, Addr: 0x1010d714
[<000000001010e1e8>]: Func: request_irq, Off: 138, Addr: 0x1010e1e8
[<0000000010154118>]: Func: get_zeroed_page, Off: 58, Addr: 0x10154118
[<00000000101d6b40>]: Func: startup, Off: 580, Addr: 0x101d6b40
[<00000000101d84a4>]: Func: set_serial_info, Off: 404, Addr: 0x101d84a4
[<00000000101d8f84>]: Func: rs_ioctl, Off: 39c, Addr: 0x101d8f84
[<00000000101447d0>]: Func: handle_mm_fault, Off: 148, Addr: 0x101447d0
[<00000000101bdae4>]: Func: tty_ioctl, Off: 2f4, Addr: 0x101bdae4
[<00000000101272a4>]: Func: do_tiocgserial, Off: 44, Addr: 0x101272a4
[<00000000101715f4>]: Func: sys_ioctl, Off: bc, Addr: 0x101715f4
[<0000000010127648>]: Func: sys32_ioctl, Off: 140, Addr: 0x10127648
[<000000001015c150>]: Func: sys_open, Off: c0, Addr: 0x1015c150
[<0000000010171538>]: Func: sys_ioctl, Off: 0, Addr: 0x10171538
[<0000000010108df0>]: Func: syscall_exit, Off: 0, Addr: 0x10108df0
[<000000001010809c>]: Func: intr_restore, Off: 0, Addr: 0x1010809c
[<0000000010108b3c>]: Func: child_return, Off: 0, Addr: 0x10108b3c
[<000000001015bcbc>]: Func: dentry_open, Off: 9c, Addr: 0x1015bcbc
[<0000000010130d64>]: Func: call_console_drivers, Off: ec, Addr: 0x10130d64

Done.
---


Stack Dump:
 0000000017a0d080:  000000380804060e 00000000fffffff4 0000000010153e44 0000000000000000
 0000000017a0d060:  0000000000000802 00000000106fb6f8 0000000000000001 000000001033a150
 0000000017a0d040:  0000000000000000 000000001033a128 00000000103d0d30 0000000000007988
 0000000017a0d020:  0000000000000085 00000000103d0d30 0000000000000006 0000000600024a34
 0000000017a0d000:  000000001798a080 0000000000000000 000000001010d714 0000000017a0c000
 0000000017a0cfe0:  000000000000000f 00000000178e0000 00000000103d0d30 00000000103d0d30

Kernel addresses on the stack:
 [<0000000010153e44>]  [<000000001010d714>]  [<000000001010e1e8>]  [<0000000010154118>] 
 [<00000000101d6b40>]  [<00000000101d84a4>]  [<00000000101d8f84>]  [<00000000101447d0>] 
 [<00000000101bdae4>]  [<00000000101272a4>]  [<00000000101715f4>]  [<0000000010127648>] 
 [<000000001015c150>]  [<0000000010171538>]  [<0000000010108df0>]  [<000000001010809c>] 
 [<0000000010108b3c>]  [<000000001015bcbc>]  [<0000000010130d64>] 

Kernel Fault: Code=26 regs=0000000017a0d080 (Addr=0000000000000003)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001000000011000001110 Not tainted
r00-03  0000000000000000 00000000103d2530 00000000101168ac 00000000103d0d30
r04-07  0000000010054db8 00000000103d0d30 00000000103c8690 00000000102ede58
r08-11  0000000010452228 0000000004000000 00000000000243c8 00000000faf00012
r12-15  000000000000ffff 0000000000013000 0000000000013000 0000000000013000
r16-19  0000000000005000 0000000000013000 00000000000243c8 0000000000000000
r20-23  00000000103d7530 0000000000000000 0000000010079200 00000000102ede58
r24-27  0000000017a0d00c 0000000017a0d008 0000000010054db8 00000000103d0d30
r28-31  0000000000000060 0000000017a0d070 0000000017a0d080 0000000000000000
sr0-3   000000000000b980 000000000000b980 0000000000000000 000000000000b980
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001011675c 0000000010116760
 IIR: 0e661014    ISR: 0000000000000000  IOR: 0000000000000003
 CPU:        0   CR30: 0000000017a0c000 CR31: 0000000010420000
 ORIG_R28: 000000001015384c
