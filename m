From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] b2k 32bit 2.6.11-rc3-pa3 panic during the night :-(
Date: Tue, 8 Feb 2005 10:31:47 +0100
Message-ID: <41DE4A3A0000AAB6@mail-1-bnl.tiscali.it>
References: <20050207034629.4CF9E4958E4@palinux.hppa>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: willy@parisc-linux.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050207034629.4CF9E4958E4@palinux.hppa>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> -- Original Message --
> To: parisc-linux-cvs@lists.parisc-linux.org
> Date: Sun,  6 Feb 2005 20:46:29 -0700 (MST)
> From: willy@parisc-linux.org (Matthew Wilcox)
> Reply-To: parisc-linux@lists.parisc-linux.org
> Subject: [parisc-linux-cvs] linux-2.6 willy
> 
> 
> CVSROOT:	/var/cvs
> Module name:	linux-2.6
> Changes by:	willy@cvs.parisc-linux.org	2005-02-06 20:46:29
> 
> Modified files:
> 	arch/parisc/kernel: irq.c 
> 
> Log message:
> 	Remove sufficiently obsolete DEBUG_IRQ code
> 	Remove limit on times around the loop.  If we exit the loop while
> 	interrupts are still pending, we'll only be re-interrupted as soon
> 	as we exit the function.
> 	Remove now-unnecessary slab.h include
> 
Hello pa,

I just got this text to fix the cvs update lvel I used as kernel.

I just got very  unsual panic on b2k runing a 32bit 2.6.11-rc3-pa3:
Backtrace:
 [<1014dda4>] cache_grow+0xd4/0x1ac
 [<1014e024>] cache_alloc_refill+0x1a8/0x26c
 [<1014e348>] kmem_cache_alloc+0x48/0x4c
 [<101828d8>] d_alloc+0x34/0x1cc
 [<10176d10>] real_lookup+0x104/0x178
 [<10177130>] do_lookup+0xb4/0xcc
 [<10177934>] link_path_walk+0x7ec/0xe78
 [<1017831c>] path_lookup+0xc0/0x1ec
 [<10178630>] __user_walk+0x5c/0x78
 [<10172974>] vfs_lstat+0x20/0x64
 [<10172e7c>] sys_lstat64+0x18/0x40
 [<1010d120>] syscall_exit+0x0/0x14


Kernel Fault: Code=3D15 regs=3D1913c600 (Addr=3D2c60c84c)

     YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00000000000001001111111100001111 Not tainted
r00-03  00000000 104fb50c 1014dda4 104e78c8
r04-07  1c125000 10999a40 00000010 000000d0
r08-11  00000001 000423a8 00000001 000423a8
r12-15  00031590 00043808 000423c5 0000002f
r16-19  00030d90 00030d90 00031590 2c60c8c8
r20-23  2c60c83c 000051ae 00000294 000000d0
r24-27  104e783c 1c125000 10999a40 103ce010
r28-31  2c60c83c 00000210 1913c600 10150710
sr0-3   00000000 00000085 00000000 000019b0
sr4-7   00000000 00000000 00000000 00000000

IASQ: 00000000 00000000 IAOQ: 1014db30 1014db34
 IIR: 6b800020    ISR: 00000000  IOR: 2c60c84c
 CPU:        0   CR30: 1913c000 CR31: 10494000
 ORIG_R28: 00000000
 IAOQ[0]: alloc_slabmgmt+0x30/0x6c
 IAOQ[1]: alloc_slabmgmt+0x34/0x6c
 RP(r2): cache_grow+0xd4/0x1ac
Kernel panic - not syncing: Kernel Fault
 <0>Rebooting in 120 seconds..

fwiw no pb on b180 with same kernel level and same unstable debian instal=
l?

Any idea or similar event on other model?

Thanks,
    Joel

-------------------------------------------------------------------------=
--
Tiscali solde! 1 mois et activation Gratuits, modem =E0 9,99=80
http://reg.tiscali.be/adsl/default.asp?lg=3DFR



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
