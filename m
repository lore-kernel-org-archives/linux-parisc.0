From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [git patches] parisc fixes for 2.6.24
Date: Tue, 18 Dec 2007 00:02:26 -0700
Message-ID: <20071218070226.GA6570@colo.lackof.org>
References: <20071216183215.GB8558@fattire.cabal.ca> <200712172353.lBHNrnWf001417@hiauly1.hia.nrc.ca> <20071218052750.GD16467@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, kyle@hera.kernel.org,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071218052750.GD16467@fattire.cabal.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 18, 2007 at 12:27:50AM -0500, Kyle McMartin wrote:
...
> sigh, i bet this is 84f4506cb788d85a50c97b399f2999f90e6272b0[1]
> does gsyprf11 have a quad port ethernet card installed?

Nope. Eveything on PCI bus 0 is on the motherboard.
It has three addon cards:
-+-[0000:30]-+-00.0  Broadcom Corporation NetXtreme BCM5703X Gigabit Ethernet
 |           +-02.0  LSI Logic / Symbios Logic 53C896/897
 |           \-02.1  LSI Logic / Symbios Logic 53C896/897
 +-[0000:20]---00.0  Broadcom Corporation NetXtreme BCM5703X Gigabit Ethernet

Two tg3 cards and a dual port sym2 card.
"ios" (cupertino test cluster) has a 4-port card if you
want to netboot some kernels on "ios". It's currently sitting at a
PDC prompt.

hth,
grant
