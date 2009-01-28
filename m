From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH] parisc: don't touch driver core internals
Date: Wed, 28 Jan 2009 09:58:23 -0800
Message-ID: <20090128175823.GA13517@kroah.com>
References: <20090127010733.GA21660@kroah.com> <1233163519.3236.82.camel@localhost.localdomain> <20090128173557.GA7583@kroah.com> <20090128174122.GB9492@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	Kay Sievers <kay.sievers@vrfy.org>
To: Kyle McMartin <kyle@infradead.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090128174122.GB9492@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jan 28, 2009 at 12:41:22PM -0500, Kyle McMartin wrote:
> On Wed, Jan 28, 2009 at 09:35:57AM -0800, Greg KH wrote:
> > I wrote that?  heh, I forgot all about that...
> > 
> > Yeah, that looks fine to me.
> > 
> 
> If you and Pat hadn't converted struct device to use klists we
> wouldn't be in this mess... ;-)

Well, you could have used the helper functions then...

> Ack... My tree or yours, greg? I've already got James' patch I believe.

If you want to take it, I have no objection.  Let me know which is
easier for you.

thanks,

greg k-h
