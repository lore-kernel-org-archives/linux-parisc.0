From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] drop superfluous .align 16
Date: Tue, 26 Aug 2008 09:10:28 -0500
Message-ID: <1219759828.3341.6.camel@localhost.localdomain>
References: <200808242026.06295.deller@gmx.de>
	 <200808242051.12202.deller@gmx.de>
	 <1219604258.4550.3.camel@localhost.localdomain> <48B2A62C.2060001@gmx.de>
	 <20080826042619.GB30449@colo.lackof.org>
	 <119aab440808260542i28772da4x89c1f98d8a28d710@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Cc: Grant Grundler <grundler@parisc-linux.org>,
	Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	Kyle McMartin <kyle@mcmartin.ca>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440808260542i28772da4x89c1f98d8a28d710@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2008-08-26 at 08:42 -0400, Carlos O'Donell wrote:
> On Tue, Aug 26, 2008 at 12:26 AM, Grant Grundler
> <grundler@parisc-linux.org> wrote:
> > Thanks for tracking and resubmitting this...Carlos already ACK'd and I think
> > it would be good if kyle added it to his patch queue.
> >
> > But I liked two other things proposed in this thread.
> > 1) jejb's preference to document the alignement requirement
> > 2) jda's proposal for ENTRY_ALIGN() (which accomplishes (1))
> >
> > So I've hacked your patch to include those two things.
> >
> > I've only build-tested this for 64-bit builds.
> >
> > thanks,
> > grant
> >
> > Signed-off-by: Helge Deller <deller@gmx.de>
> > Signed-off-by: Grant Grundler <grundler@parisc-linux.org>

Can we get this right, please ... we'll get into awful penguin trouble
if he catches us misusing the DCO:

> Signed-off-by: Carlos O'Donell <carlos@systemhalted.org>

That's not signed off by you.  You only get to add a signed-off-by if
the patch physically passes through your hands.  That means that Grant's
above is correct because he modified the patch and resent it, but yours
isn't because you did nothing with it (and you didn't pass it on).

You can add Acked-by: if you like (that usually means I'm the person in
charge of the relevant code and I approved sending it through someone
else's tree) or Reviewed-by: (I actually looked through the patch and it
seems to be fine to me).

James


