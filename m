From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH-RFC 07/10] parisc: switch to GENERIC_PCI_IOMAP
Date: Tue, 6 Dec 2011 18:24:34 +0200
Message-ID: <20111206162434.GB3245@redhat.com>
References: <cover.1322163031.git.mst@redhat.com>
 <9dab609cdf0c22a35f58b0f821a10230a487480d.1322163031.git.mst@redhat.com>
 <20111204104817.GI15464@redhat.com>
 <1323008554.3003.4.camel@dabdike.int.hansenpartnership.com>
 <20111204143000.GB21238@redhat.com>
 <CANEJEGuHpT-SWEbRVN0WXbOSBcbP8HDhFjKjxUfShyV84pqazw@mail.gmail.com>
 <20111206110608.GA10379@redhat.com>
 <CANEJEGu0SD+z1ZvD05F0TzomZW9Lp-Cok4GL2eBiHQatW4+wPg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: Grant Grundler <grantgrundler@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CANEJEGu0SD+z1ZvD05F0TzomZW9Lp-Cok4GL2eBiHQatW4+wPg@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 06, 2011 at 08:18:43AM -0800, Grant Grundler wrote:
> On Tue, Dec 6, 2011 at 3:06 AM, Michael S. Tsirkin <mst@redhat.com> w=
rote:
> > On Mon, Dec 05, 2011 at 10:23:17AM -0800, Grant Grundler wrote:
> ...
> >> I'm going to assume this is NOT a problem since any code that
> >> generates anything that tries to look like an INB/OUTB just won't
> >> compile on parisc. =A0I think removing the parisc specific definit=
ion
> >> and using the generic one instead looks fine to me. =A0But I'm not
> >> confident enough to offer a formal ACKed-by line. Sorry. :(
> >>
> >> cheers,
> >> grant
> >
> > How about a Tested-by line? I presume you have the hardware to
> > try this out?
>=20
> I do have the HW at home to test this...but it's not been powered up
> in 6+ months. I have to point dpkg at a new repository and update all
> the SW on the machine. If you don't mind waiting another week, I'll
> make time to do that later this week (or weekend).
>
> > You can also get the patches from my tree:
> > git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-n=
ext
> > or from linux-next.
>=20
> That's easy enough - thanks!
> grant

Waiting for 3.4 window to open anyway, so yes that will be nice.
Thanks!

--=20
MST
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
