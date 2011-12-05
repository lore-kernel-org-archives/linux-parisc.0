From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH-RFC 07/10] parisc: switch to GENERIC_PCI_IOMAP
Date: Mon, 05 Dec 2011 10:46:03 -0600
Message-ID: <1323103563.7213.31.camel@dabdike.int.hansenpartnership.com>
References: <cover.1322163031.git.mst@redhat.com>
	 <9dab609cdf0c22a35f58b0f821a10230a487480d.1322163031.git.mst@redhat.com>
	 <20111204104817.GI15464@redhat.com>
	 <1323008554.3003.4.camel@dabdike.int.hansenpartnership.com>
	 <20111204143000.GB21238@redhat.com>
	 <1323009144.3003.6.camel@dabdike.int.hansenpartnership.com>
	 <20111204144236.GA21506@redhat.com>
	 <1323099209.7213.18.camel@dabdike.int.hansenpartnership.com>
	 <20111205162412.GA15603@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20111205162412.GA15603@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, 2011-12-05 at 18:24 +0200, Michael S. Tsirkin wrote:
> > > so ... ACK?
> > 
> > Um, well, it looks like a trivial code shift, so it doesn't really need
> > one (it can just go through the trivial tree).
> 
> It's part of a larger set not all of which is trivial.

OK, so it looks fine to me.

> >  Unless there's some
> > reason actually to test it out on parisc because something will break
> > (in which case, I'll need the actual patch, not just a quoted one).
> > 
> > James
> 
> A build test would be nice. Just forwarded you a patch.
> It's also on linux-next.

Actually, sending it to me doesn't help.  Being busy and lazy, I want to
see if someone else will test it ... that's why we send patches to the
list.

James



