From: Guy Martin <gmsoft@tuxicoman.be>
Subject: Re: 64bit kernel not booting with CONFIG_PRINTK_TIME=y
Date: Tue, 29 Jul 2008 19:42:12 +0200
Message-ID: <20080729194212.31a0a9f3@bleh.bxl.tuxicoman.be>
References: <20080717190502.74c238d5@bleh.bxl.tuxicoman.be>
	<20080719215459.GA2550@phobos.i.cabal.ca>
	<20080719230418.GA4263@phobos.i.cabal.ca>
	<20080720112345.07869299@bleh.bxl.tuxicoman.be>
	<20080729042929.GB11425@phobos.i.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080729042929.GB11425@phobos.i.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


Hi Kyle,

Works like a charm !

ELF64 executable
Entry 00100000 first 00100000 n 3
Segment 0 load 00100000 size 5029888 mediaptr 0x1000
Segment 1 load 0063c000 size 395176 mediaptr 0x4cd000
Segment 2 load 006a0000 size 251456 mediaptr 0x52e000
Branching to kernel entry point 0x00100000.  If this is the last
message you see, you may need to switch your console.  This is
a common symptom -- search the FAQ and mailing list at parisc-linux.org

[17179569.184000] Linux version 2.6.27-rc1 (root@spiderman) (gcc version 4.2.4 (Gentoo 4.2.4 p1.0)) #1 SMP Tue Jul 29 19:32:01 CEST 2008
[17179569.184000] FP[0] enabled: Rev 1 Model 16
[17179569.184000] The 64-bit Kernel has started...
[17179569.184000] console [ttyB0] enabled
[17179569.184000] Initialized PDC Console for debugging.
[17179569.184000] Determining PDC firmware type: 64 bit PAT.


Thanks,
  Guy


On Tue, 29 Jul 2008 00:29:29 -0400
Kyle McMartin <kyle@mcmartin.ca> wrote:

> On Sun, Jul 20, 2008 at 11:23:45AM +0200, Guy Martin wrote:
> > [    0.000000] FP[0] enabled: Rev 1 Model 16
> > [    0.000000] The 64-bit Kernel has started...
> 
> I pushed a better fix to my git tree on kernel.org on top of
> v2.6.27-rc1. Can you test that?
> 
> r, Kyle


-- 
Guy Martin
Gentoo Linux - HPPA port lead
