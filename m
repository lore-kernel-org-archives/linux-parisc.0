From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: BUG 2.6.26-rc2: deadlock with pa_tlb_lock
Date: Tue, 20 May 2008 00:25:04 -0600
Message-ID: <20080520062502.GC11402@colo.lackof.org>
References: <20080520053953.GB11402@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
To: linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080520053953.GB11402@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, May 19, 2008 at 11:39:53PM -0600, Grant Grundler wrote:
...

I've parked the full TOC dump on:
    http://iou.parisc-linux.org/~grundler/console/a500-2.6.26-rc2-deadlock-01

(aka gsyprf11:~grundler/console/...)

> Since I just updated my tree to 2.6.26-rc3, I'll use the asm from that:
> ...
>   20:   2b 60 00 00     addil L%0,dp,r1
>                         20: R_PARISC_DLTIND21L  pa_tlb_lock
...
> So I'm pretty sure, whatever is wrong, it's got something to do
> with pa_tlb_lock.

After staring at the code a bit, I'm wondering if we are guaranteed
to ONLY acquire pa_tlb_lock while interrupts are blocked or is guaranteed
to never be used in the interrupt context. Its not blocking
local interrupts:
#define purge_tlb_start(x) spin_lock(&pa_tlb_lock)

I can't see any other possible cause of deadlock.


And while trying to understand how pdtlb is used (to serialize issueing
pdtlb ops), I think I found one use of "pdtlb" in pacache.S that does
NOT have the pa_tlb_lock protecting it: __clear_user_page_asm()

>From the comments, I gather only N-class is known to need this so
that's not likely to be related to what the deadlock I hit.

> Rebuilding now with gcc-4.2 (instead of gcc-4.3) and retesting
> with 2.6.26-rc3.

This HPMC'd before getting any console output. :(
Stupid "Virtual Front Panel" obscured any following output.

Something must have been still gummed up from the TOC and
idiot booted with NFS root on the first retry.

But running dselect install (update, select both worked) hung with:
Reading package lists... Done

serial console is not responsive either. Well, ^B gets me GSP so
I know the link is working.

hth,
grant

