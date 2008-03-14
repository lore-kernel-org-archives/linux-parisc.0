From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Yet another ccio fix idea?
Date: Thu, 13 Mar 2008 23:53:38 -0600
Message-ID: <20080314055338.GI24794@colo.lackof.org>
References: <JXIYMR$256BE935A3E5246D8157FA715B3F4508@scarlet.be> <20080310172644.580BD4E4A@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: grundler@parisc-linux.org, soete.joel@scarlet.be,
	linux-parisc@vger.kernel.org, kyle@parisc-linux.org,
	matthew@wil.cx, John David Anglin <dave@hiauly1.hia.nrc.ca>
To: rubisher <rubisher@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080310172644.580BD4E4A@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Mar 10, 2008 at 01:26:43PM -0400, John David Anglin wrote:
> > > On Sun, Mar 09, 2008 at 01:55:15PM +0000, Joel Soete wrote:
> > > > Hello Grant,
> > > >
> > > > Always tracking this ccio-dma bug, I figure out this stuff could be 
> > > > helpfull:
> > > > --- a/drivers/parisc/ccio-dma.c	2008-03-09 12:55:00.000000000 +0000
> > > > +++ b/drivers/parisc/ccio-dma.c	2008-03-09 12:55:21.000000000 +0000
> > > > @@ -802,7 +802,7 @@
> > > >  			 * Hopefully someone figures out how to patch (NOP) the
> > > >  			 * FDC/SYNC out at boot time.
> > > >  			 */
> > > > -			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr[7]));
> > > > +			asm volatile("fdc %%r0(%0)" : : "r" (pdir_ptr));
> > > 
> > > BTW, once you've tested/demostrated this fixes the DMA problems on C-xxx,
> > > please resend with "Signed-off-by:" line.
> 
> The existing code is clearly wrong.  pdir_ptr[7] is not a pointer and
> the previous statement sets it to zero to clear the valid bit.  So, don't
> drop this line of investigation.

Dave is right. Please submit the proper patch (with Signed-off-by)
and I'll Ack it.

I was hoping testing this would "just work".

thanks,
grant

> 
> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
