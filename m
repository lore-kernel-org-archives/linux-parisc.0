Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (e146.dhcp212-198-142.noos.fr [212.198.142.146])
	by dsl2.external.hp.com (Postfix) with ESMTP id 776F84829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 15:35:51 -0700 (MST)
Received: from Tatooine (varenet@Tatoine [192.168.69.3])
	by mail.zigoo.net (8.12.5/8.12.1) with SMTP id gBDMZgas004270
	for <parisc-linux@lists.parisc-linux.org>; Fri, 13 Dec 2002 23:35:43 +0100
Date: Fri, 13 Dec 2002 23:35:40 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.20-pa14 64bit crash on boot - A500-5X
Message-Id: <20021213233540.503b16d3.varenet@esiee.fr>
In-Reply-To: <20021213132838.F044D49C55@mail.esiee.fr>
References: <20021213132838.F044D49C55@mail.esiee.fr>
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

I strike again, now being able to provide a first analysis of the reg dump:

IAOQ = 0000000010143c48
AOUT: 0x10143c48 mod_timer+b0
Func: mod_timer, Off: b0, Addr: 0x10143c48
    10143c40:	0e 70 10 d3 	ldd 8(sr0,r19),r19
    10143c44:	0e 60 10 d4 	ldd 0(sr0,r19),r20
    10143c48:	0e 83 12 d0 	std r3,8(sr0,r20)
    10143c4c:	0c 74 12 c0 	std r20,0(sr0,r3)
    10143d2c:	e8 1f 1e 1d 	b,l 10143c40 <mod_timer+0xa8>,r0
    10143d60:	e8 1f 1d b5 	b,l 10143c40 <mod_timer+0xa8>,r0

GR2 = 0000000010143bd4
AOUT: 0x10143bd4 mod_timer+3c
Func: mod_timer, Off: 3c, Addr: 0x10143bd4
    10143bd0:	08 01 02 5a 	copy r1,r26
    10143bd4:	08 06 02 5b 	copy r6,dp
    10143bd8:	70 64 00 20 	std r4,10(r3)
    10143bdc:	0c 60 10 d4 	ldd 0(sr0,r3),r20

GR3 = 0000000010538b48
AOUT: 0x10538b48 hp_diva_timer+0
Func: hp_diva_timer, Off: 0, Addr: 0x10538b48

GR20 = 0000000000000000

Kernel addresses on the stack:
[<0000000010143bd4>]  mod_timer+3c
[<000000001014bf2c>]  dev_probe_lock+54
[<0000000010281a94>]  pci_announce_device+7c
[<000000001014018c>]  __request_region+134
[<0000000010281b98>]  pci_register_driver+b8
[<00000000101003c0>]  init+30
[<0000000010108460>]  ret_from_kernel_thread+1c
[<0000000010108518>]  _switch_to_ret+0
[<00000000101317dc>]  __wake_up+13c
[<0000000010137c98>]  release_console_sem+1a0
[<0000000010326804>]  __umoddi3+1c
[<0000000010100390>]  init+0
[<0000000010137960>]  printk+230

spin_unlock(000000001039a8d0): no lock cpu 0 curr PC 00000000101101a4
0x1039a8d0 pdc_lock+0
0x101101a4 pdc_emergency_unlock+24

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
