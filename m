From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH, RFC] fix parisc runtime hangs wrt pa_tlb_lock
Date: Sat, 23 May 2009 11:26:56 -0400 (EDT)
Message-ID: <20090523152657.4FCA54FB4@hiauly1.hia.nrc.ca>
References: <4A17074D.30602@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A17074D.30602@gmx.de> from "Helge Deller" at May 22, 2009 10:13:01 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> -#define purge_tlb_start(x) spin_lock(&pa_tlb_lock)
> -#define purge_tlb_end(x) spin_unlock(&pa_tlb_lock)
> +#define purge_tlb_start(x)	do { unsigned long flags; spin_lock_irqsave(&pa_tlb_lock, flags)
> +#define purge_tlb_end(x)	     spin_unlock_irqrestore(&pa_tlb_lock, flags); } while (0)

To my taste, the handling of the "flags" variable is ugly and potentially
error prone.

I think it would be better to add another argument to the macros, and declare
the variable flags in the routines that use the macros (as is done for the
current users of spin_lock_irqsave macro).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
