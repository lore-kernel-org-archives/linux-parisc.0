From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Sun, 30 Nov 2008 19:00:12 -2900 (EST)
Message-ID: <20081201000013.349294DF8@hiauly1.hia.nrc.ca>
References: <4932FFB7.4040506@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: gmsoft@tuxicoman.be, carlos@systemhalted.org,
	grundler@parisc-linux.org, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4932FFB7.4040506@gmx.de> from "Helge Deller" at Nov 30, 2008 10:03:51 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> So, we should convert everything to (unsigned long long).
> I was planning to send such patches soon, but didn't had time yet.

All the warnings are for addresses.  We also need to change the format
specifier depending on whether addresses are 32 or 64 bits.  For example,

hil_init_chip(struct parisc_device *dev)
{
        if (!dev->irq) {
		printk(KERN_WARNING "HIL: IRQ not found for HIL bus at 0x%08lx\n", dev->hpa.start);

Are there some standard 32 and 64 bit defines for format strings?  Or, do we
always want 16 hex digits?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
