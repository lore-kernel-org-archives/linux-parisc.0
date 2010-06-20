From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: [RFC] fix the relative jump problem on large modules
Date: Sun, 20 Jun 2010 10:35:09 -0400
Message-ID: <20100620143508.GA27920@hiauly1.hia.nrc.ca>
References: <20100619232128.6010C5160@hiauly1.hia.nrc.ca> <1277042128.5242.2.camel@mulgrave.site>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1277042128.5242.2.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, 20 Jun 2010, James Bottomley wrote:

> On Sat, 2010-06-19 at 19:21 -0400, John David Anglin wrote:
> > > The theory was that the linker should do the right thing and not emit a
> > > relocation that can't reach the boundary of the text segment (i.e. it
> > > should embed a stub between the sections as it combines them).  I'll
> > > have to fire up a 32 bit compile and see exactly what it thinks it's
> > > doing ... I've got a nasty feeling it expects us to be able to stub
> > > either at the beginning or the end, which the in-kernel loader doesn't.
> > 
> > See ld --stub-group-size=N option.
> 
> I was assuming that was the default, like on arm, I take it it's not?

The default N value stubs at the beginning or end.  A negative value
puts stubs before the input section.  There's a default value for N
which matches the value in gcc which came from hpux.

I believe that arm originally followed the parisc approach.  Possibly,
their current implementation should be looked at.

> >   GCC assumes stub sections are at
> > the beginning and that the linker can insert stubs between input sections.
> > Merging text sections is likely to cause problems.
> 
> Well, the theory was that ld was capable of more intelligent section
> layout decisions than the in-kernel linker.  If you're saying that's not
> true, then there's probably not much point to doing this.

I'm not sure it's more intelligent.  The code for generating stub groups
is quite old now.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
