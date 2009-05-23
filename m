From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH, RFC] fix parisc runtime hangs wrt pa_tlb_lock
Date: Sat, 23 May 2009 11:34:30 -0400 (EDT)
Message-ID: <20090523153430.A246E4FB4@hiauly1.hia.nrc.ca>
References: <20090523152657.4FCA54FB4@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090523152657.4FCA54FB4@hiauly1.hia.nrc.ca> from "John David Anglin" at May 23, 2009 11:26:56 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > -#define purge_tlb_start(x) spin_lock(&pa_tlb_lock)
> > -#define purge_tlb_end(x) spin_unlock(&pa_tlb_lock)
> > +#define purge_tlb_start(x)	do { unsigned long flags; spin_lock_irqsave(&pa_tlb_lock, flags)
> > +#define purge_tlb_end(x)	     spin_unlock_irqrestore(&pa_tlb_lock, flags); } while (0)
> 
> To my taste, the handling of the "flags" variable is ugly and potentially
> error prone.
> 
> I think it would be better to add another argument to the macros, and declare
> the variable flags in the routines that use the macros (as is done for the
> current users of spin_lock_irqsave macro).

Actually, the 'x' argument could be used for this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
