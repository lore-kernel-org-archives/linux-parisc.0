Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id E6AE8482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Dec 2002 15:28:24 -0700 (MST)
Date: Mon, 16 Dec 2002 23:28:08 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: "Grant Grundler" <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.20-pa14 64bit crash on boot - A500-5X
Message-Id: <20021216232808.1fe41efc.varenet@esiee.fr>
In-Reply-To: <20021215035359.GA18647@dsl2.external.hp.com>
References: <20021213132838.F044D49C55@mail.esiee.fr>
	<20021213233540.503b16d3.varenet@esiee.fr>
	<20021215035359.GA18647@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat, 14 Dec 2002 20:53:59 -0700
"Grant Grundler" <grundler@dsl2.external.hp.com> wrote:

> On Fri, Dec 13, 2002 at 11:35:40PM +0100, Thibaut VARENE wrote:
> > AOUT: 0x10143bd4 mod_timer+3c
> ...
> > AOUT: 0x10538b48 hp_diva_timer+0
> 
> Good News: I reproduced this and fixed it.
> But I don't know exactly what I did that fixed it. :^(
> (drawbacks of the shotgun approach).
> Fairly small patch is on ftp.parisc-linux.org/patches/diff-2.4.20-timer
> This isn't ready to commit until someone narrows it down to one thing.
> 
> Bad News: SMP kernel now hangs during SCSI device discover.
> I haven't tried CONFIG_SMP=n yet and I guess that would be a next step.
> Console output of the a500-44 boot with 2.4.20-pa14 + patch is on
> 	dsl2.e.h.c:~grundler/rp2470-2.4.20-symhang-01
With CONFIG_SMP=y, here is what happens upon boot:

SMP: Total 2 of 2 processors activated (2195.46 BogoMIPS noticed).
Waiting on wait_init_idle (map = 0x2)
All processors have done init_idle
Linux NET4.0 for Linux 2.4
Based upon Swansea University Computer Society NET3.039
Initializing RT netlink socket
Soft power switch support not available.
Performance monitoring counters enabled for Crescend

Some investigation provided the following (after TOC/SER PIM) CPU0:
IAOQ = 0x0000000010144f1c
Func: timer_bh, Off: 1a4, Addr: 0x10144f1c
    10144f10:	52 d3 0d f0 	ldd 6f8(r22),r19
    10144f14:	08 01 02 57 	copy r1,r23
    10144f18:	0e 60 10 94 	ldw 0(sr0,r19),r20
    10144f1c:	2b 61 20 00 	addil 3000,dp,%r1
    10144ff4:	e8 1f 1e 2d 	b,l 10144f10 <timer_bh+0x198>,r0

GR1 = 000000001047ae00
Func: __gp, Off: a000, Addr: 0x1047ae00

GR2 = 0000000010144fd8
Func: timer_bh, Off: 260, Addr: 0x10144fd8
    10144fd0:	eb df bc 81 	b,l 10103e18 <spin_lock>,%r2
    10144fd4:	08 13 02 5a 	copy r19,r26
    10144fd8:	08 0e 02 5b 	copy r14,dp
    10144fdc:	2b 65 00 00 	addil a000,dp,%r1

GR6 = 0000000010540b48
Func: hp_diva_timer, Off: 0, Addr: 0x10540b48

GR14 = 0000000010470e00
Func: __gp, Off: 0, Addr: 0x10470e00

GR18 = 0000000010540898
Func: serial_driver, Off: 0, Addr: 0x10540898

GR19 = 0000000010520e48
Func: tv1, Off: 0, Addr: 0x10520e48

GR26 = 00000000103e37c0
Func: timerlist_lock, Off: 0, Addr: 0x103e37c0

on a second try it went up to:

Performance monitoring counters enabled for Crescendo 550
Starting kswapd
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 o

Now the UP try:

went up to:

Performance monitoring counters enabled for Crescendo 550
Starting kswapd
Journalled Block Device driver loaded
Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
pty: 256 Unix98 ptys configured
Serial driver version 5.05c (2001-07-08) with MANY_PORTS SHARE_IRQ SERIAL_PCI enabled

Investigation showed that:

IAOQ = 0x000000001021210c
Func: hp_diva_check, Off: ec, Addr: 0x1021210c
    10212100:	eb 94 be 61 	b,l 1013b038 <add_timer>,%r2
    10212104:	08 15 02 5a 	copy r21,r26
    10212108:	08 03 02 5b 	copy r3,dp
    1021210c:	53 c2 3e e1 	ldd -90(sp),rp

GR0 = 0000000000000000

GR1 = 000000001045df70
Func: timer_jiffies, Off: 0, Addr: 0x1045df70

GR2 = 0000000010212108
Func: hp_diva_check, Off: e8, Addr: 0x10212108
    10212100:	eb 94 be 61 	b,l 1013b038 <add_timer>,%r2
    10212104:	08 15 02 5a 	copy r21,r26
    10212108:	08 03 02 5b 	copy r3,dp
    1021210c:	53 c2 3e e1 	ldd -90(sp),rp

GR3 = 00000000103bd2a0
Func: __gp, Off: 0, Addr: 0x103bd2a0

GR6 = 0000000010472df8
Func: hp_diva_timer, Off: 0, Addr: 0x10472df8

GR18 = 0000000010472b48
Func: serial_driver, Off: 0, Addr: 0x10472b48

GR19 = 000000001045df68
Func: run_timer_list_running, Off: 0, Addr: 0x1045df68

GR20 = 0000000000001e11

GR21 = 000000001045df68
Func: run_timer_list_running, Off: 0, Addr: 0x1045df68

GR26 = 0000000010472df8
Func: hp_diva_timer, Off: 0, Addr: 0x10472df8

I think that the patch is quite wrong somehow...

Will investigate further tomorrow.


HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
