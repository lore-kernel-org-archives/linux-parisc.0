Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id MAA00786
	for <parisc-linux@puffin.external.hp.com>; Sat, 6 Nov 1999 12:49:17 -0700
Date: Sat, 6 Nov 1999 20:27:38 +0100
From: Philipp Rumpf <prumpf@mathe.stud.uni-erlangen.de>
To: Paul Bame <bame@debian.fc.hp.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] exec() problem
Message-Id: <19991106202738.K11609@mathe.stud.uni-erlangen.de>
References: <199911060255.TAA24869@debian.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <199911060255.TAA24869@debian.fc.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> This is rumored to be a known problem.  Since I've seen it a lot recently

I am not sure it's the one I do know (and which will be fixed as soon as I got
my machines set-up again and got time to do debugging).

> and am going on vacation, here's what I know in case it helps.  The problem
> can manifest on one machine and not another with the same bits.  It can
> come and go as the size of code in arch/parisc/kernel changes.  The
> problem shows in the boot like this:
> 
>     Attempting to execute '/sbin/init'
> 
>     PSW  : 0004000b  GR 1 : c0128800  GR 2 : c0029390  GR 3 : 00000000
>     GR 4 : 00000000  GR 5 : ffffffff  GR 6 : 00000000  GR 7 : c0092708
>     GR 8 : c0fdba20  GR 9 : c00924c8  GR10 : 00000080  GR11 : 0000000a
>     GR12 : 00000000  GR13 : 00000000  GR14 : 00000001  GR15 : c00927c8
>     GR16 : c0100000  GR17 : c00292e0  GR18 : c0092720  GR19 : 00000000
>     GR20 : c0128a00  GR21 : a0000024  GR22 : 00000000  GR23 : c012bc7c
>     GR24 : c00927c8  GR25 : 00000000  GR26 : c0092708  GR27 : c008e000
>     GR28 : 00000000  GR29 : 00000000  GR30 : c0092a00  GR31 : c0039914
>     SR0  : 00000000  SR1  : 00000000  SR2  : 00000000  SR3  : 00000000
>     SR4  : 00000000  SR5  : 00000000  SR6  : 00000000  SR7  : 00000000
>     IAOQ : c0028e5c c0028e60
> 
>     bad address a000002c (code 15)
>     Kernel panic: bad address
> 
> adb on the IAOQ address says:
> 
>     do_generic_file_read+16C:       LDW             8(r21),r19
> 
> which is consistent with the value in r21 (a0000024).  This is
> inside a call which I believe is called eventually from do_execve()
> called within init/main.c:init().  I didn't track down do_execve().

This looks a lot like a completely bogus pointer which might be both memory
corruption and the schedule() returns early bug I know of.

	Philipp Rumpf
