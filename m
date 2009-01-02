From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: resource_size_t printk woes...
Date: Fri, 2 Jan 2009 11:43:03 -0500 (EST)
Message-ID: <20090102164303.605D94EF0@hiauly1.hia.nrc.ca>
References: <495DDB0E.9010203@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, kyle@infradead.org,
	linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <495DDB0E.9010203@gmx.de> from "Helge Deller" at Jan 2, 2009 10:14:54 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I assume something in your .config is different than what is in
> James' .config. It would be interesting to know what it
> is. I didn't checked further at that time.

On this, there is a problem with config's for my c3000.  2.6.28 builds
and boots fine with a config based on Kyle's allegro config.  However,
it crashes with thw config that I'd being using.  This is just a guess,
but I think IDE support is broken (machine has a cd drive).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
