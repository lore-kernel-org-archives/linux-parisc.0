Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6657482D
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 13:16:51 -0600 (MDT)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 19c8nZ-0002pM-00
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Jul 2003 15:15:45 -0400
Date: Mon, 14 Jul 2003 15:15:45 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] oops with 2.4.20-pa10-UP on rp2430
Message-ID: <20030714191545.GA10098@systemhalted>
References: <20030714185313.GE14114@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030714185313.GE14114@systemhalted>
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

> In an attempte to get a new rp2430 booting I tried the latest online
> kernels without much success.
> 
> ftp://ftp.parisc-linux.org/kernels/a500
> 
> Booted 2.4.20-UP
> Using teh dump-analyzer, but objdump on x86 complains a little about the
> architecture... objdump: Can't disassemble for architecture UNKNOWN!,
> which I'm assuming means I should probably be using a cross or
> multi-arch binutils to do this?
> ---

Using the correct binutils:


IAOQ = 000000001011675c
Func: iosapic_set_irt_data, Off: c, Addr: 0x1011675c
0000000010116750 <iosapic_set_irt_data>:
    10116750:	0f 50 10 d3 	ldd 8(,r26),r19
    10116754:	2b 60 30 00 	addil 1800,dp,%r1
    10116758:	34 15 00 00 	ldi 0,r21
    1011675c:	0e 66 10 14 	ldb 3(,r19),r20

GR0 = 0000000000000000

GR1 = 00000000103d2530
Func: __gp, Off: 1800, Addr: 0x103d2530

GR2 = 00000000101168ac
Func: iosapic_enable_irq, Off: 3c, Addr: 0x101168ac
    101168a0:	37 d9 3f 11 	ldo -78(sp),r25
    101168a4:	eb ff bd 4d 	b,l 10116750 <iosapic_set_irt_data>,%r2
    101168a8:	08 04 02 5a 	copy r4,r26
    101168ac:	08 05 02 5b 	copy r5,dp

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
