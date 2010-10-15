From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: shmctl() broken on 64bit kernel
Date: Fri, 15 Oct 2010 17:16:53 -0400
Message-ID: <20101015211653.GL8332@bombadil.infradead.org>
References: <4CB8C1E5.2090609@steuerkanzlei-deller.de>
 <20101015211227.GK8332@bombadil.infradead.org>
 <4CB8C47A.4090507@steuerkanzlei-deller.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@mcmartin.ca>, linux-parisc@vger.kernel.org
To: Helge Deller <helge.deller@steuerkanzlei-deller.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4CB8C47A.4090507@steuerkanzlei-deller.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Oct 15, 2010 at 11:15:38PM +0200, Helge Deller wrote:
>  On 10/15/2010 11:12 PM, Kyle McMartin wrote:
> >On Fri, Oct 15, 2010 at 11:04:37PM +0200, Helge Deller wrote:
> >>  32bit shmctl() syscall is broken on the 64bit parisc kernel.
> >>
> >Have you had a chance to look at the patch you posted a few weeks ago
> >about the SHM_INFO breakage? I suspect it fixes this as well?
> >
> >I think plucking the sparc64 or ppc64 structs should be ok, I don't
> >think there's any alignment differences offhand.
> 
> heh - I completely forgot I did sent the patch that time.... :-)
> Anyway, no I didn't tested further yet (due to lack of time).
> 

Ok, I'll look at it over the weekend.

cheers, Kyle
