From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [git patches] parisc fixes for 2.6.24
Date: Tue, 18 Dec 2007 00:33:20 -0500 (EST)
Message-ID: <200712180533.lBI5XfLW009839@hiauly1.hia.nrc.ca>
References: <20071218052750.GD16467@fattire.cabal.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@hera.kernel.org, linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20071218052750.GD16467@fattire.cabal.ca> from "Kyle McMartin" at Dec 18, 2007 00:27:50 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> sigh, i bet this is 84f4506cb788d85a50c97b399f2999f90e6272b0[1]
> 
> does gsyprf11 have a quad port ethernet card installed?

Not sure of the specifics but I see:
20:00.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5703X Gigabit Ethernet (rev 02)
30:00.0 Ethernet controller: Broadcom Corporation NetXtreme BCM5703X Gigabit Ethernet (rev 02)

These devices probably contain a Broadcom switch.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
