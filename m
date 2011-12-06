From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: [PATCH-RFC 07/10] parisc: switch to GENERIC_PCI_IOMAP
Date: Tue, 6 Dec 2011 08:18:43 -0800
Message-ID: <CANEJEGu0SD+z1ZvD05F0TzomZW9Lp-Cok4GL2eBiHQatW4+wPg@mail.gmail.com>
References: <cover.1322163031.git.mst@redhat.com>
	<9dab609cdf0c22a35f58b0f821a10230a487480d.1322163031.git.mst@redhat.com>
	<20111204104817.GI15464@redhat.com>
	<1323008554.3003.4.camel@dabdike.int.hansenpartnership.com>
	<20111204143000.GB21238@redhat.com>
	<CANEJEGuHpT-SWEbRVN0WXbOSBcbP8HDhFjKjxUfShyV84pqazw@mail.gmail.com>
	<20111206110608.GA10379@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20111206110608.GA10379@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 6, 2011 at 3:06 AM, Michael S. Tsirkin <mst@redhat.com> wro=
te:
> On Mon, Dec 05, 2011 at 10:23:17AM -0800, Grant Grundler wrote:
=2E..
>> I'm going to assume this is NOT a problem since any code that
>> generates anything that tries to look like an INB/OUTB just won't
>> compile on parisc. =C2=A0I think removing the parisc specific defini=
tion
>> and using the generic one instead looks fine to me. =C2=A0But I'm no=
t
>> confident enough to offer a formal ACKed-by line. Sorry. :(
>>
>> cheers,
>> grant
>
> How about a Tested-by line? I presume you have the hardware to
> try this out?

I do have the HW at home to test this...but it's not been powered up
in 6+ months. I have to point dpkg at a new repository and update all
the SW on the machine. If you don't mind waiting another week, I'll
make time to do that later this week (or weekend).



> You can also get the patches from my tree:
> git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-nex=
t
> or from linux-next.

That's easy enough - thanks!
grant

>
> --
> MST
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
