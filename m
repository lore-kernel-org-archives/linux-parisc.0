From: Grant Grundler <grantgrundler@gmail.com>
Subject: Re: [PATCH-RFC 07/10] parisc: switch to GENERIC_PCI_IOMAP
Date: Thu, 15 Dec 2011 18:11:26 -0800
Message-ID: <CANEJEGtRHNpZ2AN5di3joGa2JjgSiBbUjiTVfjkC8p1hE8T6cw@mail.gmail.com>
References: <cover.1322163031.git.mst@redhat.com>
	<9dab609cdf0c22a35f58b0f821a10230a487480d.1322163031.git.mst@redhat.com>
	<20111204104817.GI15464@redhat.com>
	<1323008554.3003.4.camel@dabdike.int.hansenpartnership.com>
	<20111204143000.GB21238@redhat.com>
	<CANEJEGuHpT-SWEbRVN0WXbOSBcbP8HDhFjKjxUfShyV84pqazw@mail.gmail.com>
	<20111206110608.GA10379@redhat.com>
	<CANEJEGu0SD+z1ZvD05F0TzomZW9Lp-Cok4GL2eBiHQatW4+wPg@mail.gmail.com>
	<20111206162434.GB3245@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>,
	Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	"James E.J. Bottomley" <jejb@parisc-linux.org>,
	linux-parisc@vger.kernel.org
To: "Michael S. Tsirkin" <mst@redhat.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20111206162434.GB3245@redhat.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Dec 6, 2011 at 8:24 AM, Michael S. Tsirkin <mst@redhat.com> wrote:
...
>> I do have the HW at home to test this...but it's not been powered up
>> in 6+ months. I have to point dpkg at a new repository and update all
>> the SW on the machine. If you don't mind waiting another week, I'll
>> make time to do that later this week (or weekend).
>>
>> > You can also get the patches from my tree:
>> > git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
>> > or from linux-next.
>>
>> That's easy enough - thanks!
>> grant
>
> Waiting for 3.4 window to open anyway, so yes that will be nice.

Michael,
Just an update that I haven't forgotten your request. I tried to
update the machine on Monday and the current state of hppa for
debian-ports is dselect can't resolve dependencies on versions of
packages because those versions don't exist for hppa. I've just asked
for help with this on debian-hppa mailing list and will see if we can
get this machine updated.

cheers,
grant
