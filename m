From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: Changes to fcntl.h and F_* numbers?
Date: Thu, 19 Nov 2009 12:23:34 -0500
Message-ID: <1258651414.6363.12.camel@mulgrave.site>
References: <119aab440911181222v79ad775ena36a4140e80847e3@mail.gmail.com>
	 <20091119032220.GG28962@bombadil.infradead.org>
	 <119aab440911190900t62122ed8m987c55821ca64062@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: Kyle McMartin <kyle@mcmartin.ca>, Helge Deller <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440911190900t62122ed8m987c55821ca64062@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 2009-11-19 at 12:00 -0500, Carlos O'Donell wrote:
> On Wed, Nov 18, 2009 at 10:22 PM, Kyle McMartin <kyle@mcmartin.ca> wrote:
> > On Wed, Nov 18, 2009 at 03:22:15PM -0500, Carlos O'Donell wrote:
> >> Kyle, Helge,
> >>
> >> I've seen some recent churn regarding the kernel fcntl.h and F_* numbers.
> >>
> >> If our numbers change please keep me in the loop so I can update the C
> >> library side.
> >>
> >
> > ?
> 
> http://marc.info/?l=linux-api&m=125688056905828&w=2

But this isn't parisc specific ... it's a bug CodeSourcery reported in
the ABI assignment in asm-generic.

We already look to have this sorted out locally in our fcntl.h ... so
we're not going to be changing anything, are we?  Or are you saying
(because we could get into trouble in future) that we should adopt the
asm generic ones?

James


