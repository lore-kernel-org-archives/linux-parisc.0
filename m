From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] parisc: don't touch driver core internals
Date: Wed, 28 Jan 2009 12:41:22 -0500
Message-ID: <20090128174122.GB9492@bombadil.infradead.org>
References: <20090127010733.GA21660@kroah.com> <1233163519.3236.82.camel@localhost.localdomain> <20090128173557.GA7583@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	linux-parisc@vger.kernel.org, Kyle McMartin <kyle@mcmartin.ca>,
	Matthew Wilcox <matthew@wil.cx>,
	Grant Grundler <grundler@parisc-linux.org>,
	Kay Sievers <kay.sievers@vrfy.org>
To: Greg KH <greg@kroah.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090128173557.GA7583@kroah.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Jan 28, 2009 at 09:35:57AM -0800, Greg KH wrote:
> I wrote that?  heh, I forgot all about that...
> 
> Yeah, that looks fine to me.
> 

If you and Pat hadn't converted struct device to use klists we
wouldn't be in this mess... ;-)

Ack... My tree or yours, greg? I've already got James' patch I believe.

cheers, Kyle
