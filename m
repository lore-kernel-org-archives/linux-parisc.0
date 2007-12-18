From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [git patches] parisc fixes for 2.6.24
Date: Tue, 18 Dec 2007 01:02:32 -0500
Message-ID: <20071218060232.GF16467@fattire.cabal.ca>
References: <20071218052750.GD16467@fattire.cabal.ca> <200712180533.lBI5XfLW009839@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: kyle@hera.kernel.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200712180533.lBI5XfLW009839@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 18, 2007 at 12:33:20AM -0500, John David Anglin wrote:
> > sigh, i bet this is 84f4506cb788d85a50c97b399f2999f90e6272b0[1]
> > 
> > does gsyprf11 have a quad port ethernet card installed?
> 
> Not sure of the specifics but I see:
> 20:00.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5703X Gigabit Ethernet (rev 02)
> 30:00.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5703X Gigabit Ethernet (rev 02)
> 
> These devices probably contain a Broadcom switch.
> 

can you post the console log of where it fails and/or try reverting that
changeset and rebuilding? that's the only obvious change that i can
think of causing a panic on boot.

cheers,
	kyle
