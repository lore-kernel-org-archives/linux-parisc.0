From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Tue, 16 Nov 2010 22:42:10 -0700
Message-ID: <20101117054210.GD27930@lackof.org>
References: <20101104153507.GA7198@lackof.org> <20101107193156.F14EF4E1C@hiauly1.hia.nrc.ca> <20101110033527.GA24762@hiauly1.hia.nrc.ca> <20101114234212.GA20422@hiauly1.hia.nrc.ca> <20101117022140.GA2110@hiauly1.hia.nrc.ca> <20101117052218.GB27930@lackof.org> <20101117052642.GF22651@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Grant Grundler <grundler@parisc-linux.org>,
	John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101117052642.GF22651@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Nov 17, 2010 at 12:26:42AM -0500, Kyle McMartin wrote:
> On Tue, Nov 16, 2010 at 10:22:18PM -0700, Grant Grundler wrote:
> > I agree. The kernel is expected to emulate/handle unaligned loads/stores.
> > 
> > I thought we had all that misaligned access handlers working years ago and
> > somewhere probably have a user space program to test it. Oh...ldd won't be
> > user space since we don't have a PA2.0 64-bit user space. LDD support
> > can't be as well tested.
> > 
> > On that note, can you try a 32-bit kernel? (SMP maybe)
> > 
> 
> We really shouldn't be fixing up unaligned access in the kernel, since
> we can just fix the code... If ipv6 is causing them, there must be some
> missing define that's getting defaulted to something un-padded,
> otherwise sparc wouldn't work at all (it definitely does /not/ fix
> unalignd accesses, period.)

I agree but thought davem refused patches to use get/put_unaligned macros
in networking code. Searching for "davem ulog put_unaligned" shows him
accepting such patches. So this is clearly the right path to pursue.

thanks,
grant
