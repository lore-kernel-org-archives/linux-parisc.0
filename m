From: Frans Pop <elendil@planet.nl>
Subject: Re: vmlinux.lds:319: undefined symbol `THREAD_SIZE'
Date: Fri, 2 Oct 2009 02:25:28 +0200
Message-ID: <200910020225.29192.elendil@planet.nl>
References: <200910010339.52904.elendil@planet.nl> <200910010535.39189.elendil@planet.nl> <20091001163244.GS11961@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20091001163244.GS11961@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thursday 01 October 2009, Kyle McMartin wrote:
> On Thu, Oct 01, 2009 at 05:35:38AM +0200, Frans Pop wrote:
> > On Thursday 01 October 2009, Carlos O'Donell wrote:
> > > On Wed, Sep 30, 2009 at 9:39 PM, Frans Pop <elendil@planet.nl> wrote:
> > > > arch/parisc/kernel/vmlinux.lds:319: undefined symbol `THREAD_SIZE'
> > > > referenced in expression
> > > > make[5]: *** [.tmp_vmlinux1] Error 1
> > >
> > > Fixed upstream?
> > >
> > > http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=comm
> > >itdi ff;h=f32ed3954c5e365907738b1206e849b6bbe9bcef
> >
> > Nope. With that patch applied I still get the error, even for an
> > 'allnoconfig" build.
>
> You need this one too:
> http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdi
>ff;h=8cf06fc9bd660c28afea4115fd91a2cc4978eb54

Yep, that fixed it.

The resulting kernel boots fine on my box, but there does seem to be a 
regression. With 2.6.31 I not had any problems running aptitude, but with 
this kernel it's segfaulted on me once and frozen twice. Unfortunately 
it's not reliably reproducible,

Thanks,
FJP
