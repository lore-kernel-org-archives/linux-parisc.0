From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: 64bit kernel not booting with CONFIG_PRINTK_TIME=y
Date: Tue, 29 Jul 2008 00:29:29 -0400
Message-ID: <20080729042929.GB11425@phobos.i.cabal.ca>
References: <20080717190502.74c238d5@bleh.bxl.tuxicoman.be> <20080719215459.GA2550@phobos.i.cabal.ca> <20080719230418.GA4263@phobos.i.cabal.ca> <20080720112345.07869299@bleh.bxl.tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org,
	linux-kernel@vger.kernel.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080720112345.07869299@bleh.bxl.tuxicoman.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jul 20, 2008 at 11:23:45AM +0200, Guy Martin wrote:
> [    0.000000] FP[0] enabled: Rev 1 Model 16
> [    0.000000] The 64-bit Kernel has started...

I pushed a better fix to my git tree on kernel.org on top of
v2.6.27-rc1. Can you test that?

r, Kyle
