Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Message-Id: <20020915153613.5AFBD4829@dsl2.external.hp.com>
Date: Sun, 15 Sep 2002 09:36:13 -0600 (MDT)
From: grundler@dsl2.external.hp.com (Grant Grundler)
Subject: [parisc-linux] rp2470 hang in sym2 driver
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

Hi all,

I've revisited this "rp2470 hang" issue. This happens with sym2.
The same kernels boot on A500-44 but hang on A500-65 (650Mhz).
It smells like a deadlock.

I don't believe this is a result of interrupt distribution. I can't
say for sure since I've had the IRQ distr code in my tree for a while.
I don't think I've ever booted rp2470 with 2.4.19.

I will try sym1 driver *and* try disabling IRQ distribution
in the next couple of days.

I've reproduced the hang twice with 2.4.19-pa18.
Console output stops after first line of either "sym3:" output
or "sym4:" (ie only one line is printed for that interface.
TOC had the following:

	CPU0 0x10143420 timer_bh+200
	CPU0 0x102276fc sym53c8xx_timer+ec

	CPU1 0x1010dd40 do_irq+100
	CPU1 0x102275f0 sym53c8xx_intr+140

and

	CPU0 GR02 0x10143420 timer_bh+200
	CPU0 IOAQ 0x102276fc sym53c8xx_timer+ec

	CPU1 GR02 0x102274f4 sym53c8xx_intr+44
	CPU1 IOAQ 0x102275f0 sym53c8xx_intr+140

I hoped someone else has a chance to look at this too.
The rp2470 (gsyprf11) is externally accessible if a volunteer has time
to dig into this. Or let me know what I might try next.

thanks,
grant
