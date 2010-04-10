From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Sat, 10 Apr 2010 17:56:54 -0400 (EDT)
Message-ID: <20100410215655.7B5CF513F@hiauly1.hia.nrc.ca>
References: <4BC0E3AD.4050802@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, carlos@systemhalted.org,
	gniibe@fsij.org, linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4BC0E3AD.4050802@gmx.de> from "Helge Deller" at Apr 10, 2010 10:46:37 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> On 04/09/2010 05:13 PM, John David Anglin wrote:
> > On Fri, 09 Apr 2010, Carlos O'Donell wrote:
> >> For example, are the futex fixes anywhere for Kyle to pickup?
> > 
> > The futex fixes are Helge's and were posted to the list on Wed,
> > 03 Feb 2010 23:03:49 +0100 along with Helge's minifail3.c.
> 
> Yes, but there is still a bug in the patch I sent, and it's still in Dave's big
> patchset. See below...
> 
> --- a/arch/parisc/include/asm/atomic.h
> +++ b/arch/parisc/include/asm/atomic.h
>  #else
>  #  define _atomic_spin_lock_irqsave(l,f) do { local_irq_save(f); } while (0)
>  #  define _atomic_spin_unlock_irqrestore(l,f) do { local_irq_restore(f); } while (0)
> +#  define _atomic_spin_lock_irqsave_user(l,f) _atomic_spin_lock_irqsave(l,f)
> +#  define _atomic_spin_unlock_irqrestore_user(l,f) _atomic_spin_lock_irqsave_user(l,f)
> 
> atomic_spin_lock_irqsave_user() is wrong.
> It needs to be:
> ->  atomic_spin_lock_irqsave_user(l,f) _atomic_spin_lock_irqsave_user(l,f)

Huh?  I see the following line is wrong...

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
