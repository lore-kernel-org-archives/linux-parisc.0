From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Wed, 17 Nov 2010 09:38:08 -0500 (EST)
Message-ID: <20101117143809.1F8A14DA1@hiauly1.hia.nrc.ca>
References: <20101117054210.GD27930@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, grundler@parisc-linux.org,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101117054210.GD27930@lackof.org> from "Grant Grundler" at Nov 16, 2010 10:42:10 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On Wed, Nov 17, 2010 at 12:26:42AM -0500, Kyle McMartin wrote:
> > On Tue, Nov 16, 2010 at 10:22:18PM -0700, Grant Grundler wrote:
> > > I agree. The kernel is expected to emulate/handle unaligned loads/stores.
> > > 
> > > I thought we had all that misaligned access handlers working years ago and
> > > somewhere probably have a user space program to test it. Oh...ldd won't be
> > > user space since we don't have a PA2.0 64-bit user space. LDD support
> > > can't be as well tested.
> > > 
> > > On that note, can you try a 32-bit kernel? (SMP maybe)
> > > 
> > 
> > We really shouldn't be fixing up unaligned access in the kernel, since
> > we can just fix the code... If ipv6 is causing them, there must be some
> > missing define that's getting defaulted to something un-padded,
> > otherwise sparc wouldn't work at all (it definitely does /not/ fix
> > unalignd accesses, period.)
> 
> I agree but thought davem refused patches to use get/put_unaligned macros
> in networking code. Searching for "davem ulog put_unaligned" shows him
> accepting such patches. So this is clearly the right path to pursue.

I also agree that the kernel shouldn't fix unaligned accesses occuring
in the kernel.  It allows for sloppy coding and the fixup can be a
major performance hit on strict alignment machines like sparc and hppa.

It would appear handle_unaligned can't always fixup kernel accesses.
At least, emulate_ldd causes a hpmc attempting to fixup the ldd in
init_page_buffers.  This may be because this is a wrong code error
and the address is in someway invalid.  Maybe more address checking
is needed.

The unaligned access in __tcp_v6_send_check seems to be caused by
saddr being misaligned.  It's possible daddr is also misaligned.
I was going to add a BUG_ON or two to try and get more info.  Don't
know if emulate_ldd can fix this access.

In the case of ipv4, it's possible to pad/start packets in a manner
to make it easier to access the ip header.  Don't know about ipv6.
This may be what Kyle is suggesting.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
