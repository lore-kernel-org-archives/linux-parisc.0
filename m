From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: vmlinux.lds:319: undefined symbol `THREAD_SIZE'
Date: Thu, 1 Oct 2009 12:32:44 -0400
Message-ID: <20091001163244.GS11961@bombadil.infradead.org>
References: <200910010339.52904.elendil@planet.nl> <119aab440909301905v26cbeb76o91be0bd674461fbb@mail.gmail.com> <200910010535.39189.elendil@planet.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Carlos O'Donell <carlos@systemhalted.org>,
	linux-parisc@vger.kernel.org
To: Frans Pop <elendil@planet.nl>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200910010535.39189.elendil@planet.nl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Oct 01, 2009 at 05:35:38AM +0200, Frans Pop wrote:
> On Thursday 01 October 2009, Carlos O'Donell wrote:
> > On Wed, Sep 30, 2009 at 9:39 PM, Frans Pop <elendil@planet.nl> wrote:
> > > arch/parisc/kernel/vmlinux.lds:319: undefined symbol `THREAD_SIZE'
> > > referenced in expression
> > > make[5]: *** [.tmp_vmlinux1] Error 1
> >
> > Fixed upstream?
> >
> > http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdi
> >ff;h=f32ed3954c5e365907738b1206e849b6bbe9bcef
> 
> Nope. With that patch applied I still get the error, even for an
> 'allnoconfig" build.

You need this one too:
http://git.kernel.org/?p=linux/kernel/git/kyle/parisc-2.6.git;a=commitdiff;h=8cf06fc9bd660c28afea4115fd91a2cc4978eb54
