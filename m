From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sun, 21 Dec 2008 23:59:07 +0100
Message-ID: <494ECA3B.1030309@gmx.de>
References: <20081221152017.102C84F19@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Kyle McMartin <kyle@infradead.org>, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081221152017.102C84F19@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

John David Anglin wrote:
> Having looked at the code a bit, I have come to the conclusion that the
> problem is not with the sr3 value.  

In all debugging I added I could _always_ see that sr3 had the wrong
values. cr8 and mm->context were always correct.
Interestingly it was often just a few numbers off in the lower 4 bits,
e.g. sr3 should have been 0x1a8 but was 0x1a2 (just an example).

> We have a one-to-one mapping between
> space register values and protection IDs.  TLB entries get inserted using
> the space register value for the protection ID (see entry.S).  So, I think
> we have to have inconsistent values in cr8 and sr3.

Again, only sr3 is wrong. cr8 is correct.

> I think the bug may be in flush_user_cache_page_non_current.  It hijacks
> sr3 temporarily and I don't think cr8 is updated when this is done.  The
> switch may need to be atomic.

I tried that as well, e.g. adding local_irq_[en|dis]able didn't worked
(it crashed IIRC).

Helge
