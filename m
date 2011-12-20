From: John David Anglin <dave.anglin@bell.net>
Subject: Re: LWS, futex and pthread problems
Date: Tue, 20 Dec 2011 09:54:51 -0500
Message-ID: <4EF0A1BB.1040104@bell.net>
References: <BLU0-SMTP30032FA977F6BD78D6AF2797A60@phx.gbl> <CADZpyixc_6SZF7ehLTV65eNURmUgmQFvN_vwX6wDKO7RUDDBXQ@mail.gmail.com> <BLU0-SMTP27DC0B7C2C7D265788CE2A97A60@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP27DC0B7C2C7D265788CE2A97A60@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/18/2011 5:45 PM, John David Anglin wrote:
> Yes.  R4 is also wrong, so it might be a call has corrupted it and 
> then the restore
> corrupts r19.
>
> This rings a bell.  In the old clone/fork bug, there was a cache issue 
> with the stack
> region created for the thread.  It seemed like it got modified after 
> the thread started.
> It must have something to do with the fact that it is allocated by 
> malloc.
I believe COW is broken.  If you look at set_pte_at, you will see that 
the tlb is not
purged for the address after the need value is stored in the page table, 
so the write
protect doesn't take effect immediately.  Thus, a thread can continue 
writing to a
protected page without generating a fault.  Unfortunately, this doesn't 
fix the problem
by itself (tested this morning).

I'm thinking that copy_user_page needs to be done through the tmp alias 
region,
or the user page needs to be flushed before it is copied.  I'm not sure 
how to do the
latter.

Dave

-- 
John David Anglin    dave.anglin@bell.net

