From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: in ccio_io_pdir_entry(),BUG_ON() seems to break gcc-4.2     optimization?
Date: Sat, 28 Jun 2008 18:45:10 -0400 (EDT)
Message-ID: <20080628224510.D3FDA431A@hiauly1.hia.nrc.ca>
References: <4866BA91.9040607@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, linux-parisc@vger.kernel.org
To: soete.joel@scarlet.be (Joel Soete)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4866BA91.9040607@scarlet.be> from "Joel Soete" at Jun 28, 2008 10:26:25 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Grant Grundler wrote:
> > On Thu, Jun 26, 2008 at 07:28:03AM +0100, Joel Soete wrote:
> >> Just for remind:
> >>
> >> Joel Soete wrote:
> >>  >
> >>  >
> >> [snip]
> >>  >>> But this time, it seems not consider assembly:
> >>  >>>         asm volatile ("lci %%r0(%%sr1, %1), %0" : "=r" (ci) : "r"
> >>  >>> (vba));
> >>  >>>         asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
> >>  >>>         asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));
> >>  >>>
> >>  >>> as a 'volatile' block and insert line 1c:
> >>
> >> This seems to make better what I want:
> >>         __asm__ __volatile__ (
> >>         "lci    %%r0(%%sr1, %2), %0\n"
> >>         "\textru        %0,19,12,%0\n"
> >>         "\tdepw         %0,15,12,%1\n"
> >>         : "+r" (ci), "+r" (pa)
> >>         : "r" (vba)
> >>         : "memory"
> > 
> > Why the "memory"? This asm code isn't modifying memory at all.
> > 
> well I certainly still have wrongly understand what "memory" clobber means but for me "pa" is a memory location modified 
> (the plus sign in '"+r" (pa)' and that either after 64bit computation or 32bit initialization pa=0).

The "+r" constraint indicates a register operand that is both read and written.
However, "ci" and "pa" are not read, so the constraints for them should be
"=r".  None of the instructions modify memory, so the "memory" clobber
is unnecessary.

> so why not simply get rid of its declaration (btw save a line of code ;-)) and just use a common temporay reg as r19?

r19 is the pic register in 64-bit mode and can't be used without saving
and restoring it.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
