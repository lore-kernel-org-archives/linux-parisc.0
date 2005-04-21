From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] k-class and j3514A (tulip dual 100mbit tulip)
Date: Thu, 21 Apr 2005 00:45:03 -0600
Message-ID: <20050421064503.GB26004@colo.lackof.org>
References: <20050420143849.GB30984@ing.umu.se>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Anders <dizzey@ing.umu.se>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050420143849.GB30984@ing.umu.se>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Apr 20, 2005 at 04:38:50PM +0200, Anders wrote:
> Linux Tulip driver version 1.1.13 (December 15, 2004)
> tulip0:  MII transceiver #1 config 3100 status 7849 advertising 01e1.
> eth1: Digital DS21140 Tulip rev 34 at 80000080, 00:30:6E:27:99:EC, IRQ 
> 20.
> tulip1:  MII transceiver #1 config 3100 status 786b advertising 01e1.
> eth2: Digital DS21140 Tulip rev 34 at 80000100, 00:30:6E:27:99:ED, IRQ 
> 21.
> 
> but when i try to ping something it gives me
> Dino 0xf1000000: stuck interrupt 2
> Dino 0xf1000000: stuck interrupt 6

IRQ routing is wrong. The card-mode dino support probably needs 
some love since we switched from the home-brew "IRQ region" support
I hacked together 5 years to the "generic" IRQ support willy
switched us over to late last year.

Feel free to hack around on drivers/parisc/dino.c.
Key part is in dino_isr() has to lookup the global index
before calling __do_IRQ(). IRQ 20 is obviously not connecting
to "stuck interrupt 2".

Issue is likely something in how dino_device.global_irq[] array
is (or is not) getting initialized in dino_assign_irq().
Particularly when dino_assign_irq() is called from dino_fixup_bus().

Enable DINO_DEBUG and see if you need to add more printk's to
sort that out.

hth,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
