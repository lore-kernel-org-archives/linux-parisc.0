From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: TLB Miss Bug?
Date: Tue, 29 Nov 2011 12:41:19 -0600
Message-ID: <1322592079.11875.43.camel@dabdike.int.hansenpartnership.com>
References: <BLU0-SMTP178D0B9C9992607985308C97CE0@phx.gbl>
	 <1322277527.7362.12.camel@dabdike.cust.hotspot.t-mobile.com>
	 <BLU0-SMTP4684050CC4E337BF49371797CD0@phx.gbl>
	 <BLU0-SMTP69497471F7AC39085A11CC97CD0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP69497471F7AC39085A11CC97CD0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2011-11-26 at 20:54 -0500, John David Anglin wrote:
> On 26-Nov-11, at 7:35 PM, John David Anglin wrote:
> 
> > On 25-Nov-11, at 10:18 PM, James Bottomley wrote:
> >
> >> I'm still a bit Jetlagged from a customer trip to Germany, but this
> >> looks entirely possible: Appendix F says that a later TLB insertion
> >> purges an earlier one, so I'd say in a combined I/D TLB inserting
> >> consecutive I and D entries purges the I.
> >>
> >> It looks like a fix might be to insert TLB entries supporting both  
> >> data
> >> and instruction access in the combined TLB case.
> >
> > In looking at the code, I couldn't see why the I and D entries would  
> > differ.
> > Except for the dtlb_check_alias_20w check, the I and D handlers appear
> > identical.  Maybe the hardware can't handle this case.
> >
> > Don't understand this comment:
> >
> >        /*
> >         * I miss is a little different, since we allow users to fault
> >         * on the gateway page which is in the kernel address space.
> >         */
> >
> > There is also a typo in this comment:
> >
> >         * Then incredible subtlety: The access rights are
> >         * _PAGE_GATEWAY _PAGE_EXEC _PAGE_READ
> >
> > I believe the last bit should be _PAGE_WRITE.

Yes ... I was obviously in brain burn out when I wrote that.  It had
just taken me days to figure out what was going on if I remember
correctly.

> I just realized there is a difference.  In the I case, va and spc are  
> loaded
> from %pcoq and %pcsq, respectively.  In the D case, they are loaded from
> %ior and %isr.  I haven't wrapped my head around this but space_adjust
> may not be handling the b field correctly (D case)

I don't really think so: T D and B are all loaded from the page table
entry (so they overwrite anything in the space adjust).

Looking at the code again, it does seem that the insertions are all
correct for the combined TLB case on either an I or D fault, so whatever
the problem is, it must lie elsewhere.

James


