From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: resource_size_t printk woes...
Date: Fri, 2 Jan 2009 12:50:21 -0700
Message-ID: <20090102195021.GB1051@colo.lackof.org>
References: <495DDB0E.9010203@gmx.de> <20090102164303.605D94EF0@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, dave.anglin@nrc-cnrc.gc.ca,
	kyle@infradead.org, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090102164303.605D94EF0@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 02, 2009 at 11:43:03AM -0500, John David Anglin wrote:
...
> On this, there is a problem with config's for my c3000.  2.6.28 builds
> and boots fine with a config based on Kyle's allegro config.  However,
> it crashes with thw config that I'd being using.  This is just a guess,
> but I think IDE support is broken (machine has a cd drive).

That's posible. Can you look for HPMC PIM dump?
If so, I can take a look at it.

thanks,
grant
