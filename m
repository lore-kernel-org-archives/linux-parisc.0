From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sun, 21 Dec 2008 10:20:16 -0500 (EST)
Message-ID: <20081221152017.102C84F19@hiauly1.hia.nrc.ca>
References: <20081219212906.GG8945@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081219212906.GG8945@bombadil.infradead.org> from "Kyle McMartin" at Dec 19, 2008 04:29:06 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Honestly, I can't decide whether to apply this. It really should never
> happen in the kernel, since the kernel can guarantee it won't get the
> access rights failure (highest privilege level, and can set %sr and
> %protid to whatever it wants.)

I believe this change should be applied because we enable P and the
hardware can generate the exception.  Yes, it should never happen, but
the coding to prevent this occurring is very subtle.

> It really genuinely is a bug that probably should panic the kernel. The
> only precedent I can easily see is x86 fixing up a bad iret with a
> general protection fault, which is more or less analogous to code 27
> here.

I don't think we have enough information here.  A panic doesn't tell
us what we need to know...

> On the other hand, taking the exception on a userspace access really
> isn't all that critical, and there's fundamentally little reason for the
> kernel not to SIGSEGV the process, and continue...

Agreed, especially in a __put_user operation.

> (btw, I've instrumented my do_sys_poll with a pile of assertions that
>  %cr8 << 1 == %sr3 == current->mm.context... let's see if where we're
>  getting corrupted is deterministic, though, I would guess that it won't
>  be.)

Having looked at the code a bit, I have come to the conclusion that the
problem is not with the sr3 value.  We have a one-to-one mapping between
space register values and protection IDs.  TLB entries get inserted using
the space register value for the protection ID (see entry.S).  So, I think
we have to have inconsistent values in cr8 and sr3.

I think the bug may be in flush_user_cache_page_non_current.  It hijacks
sr3 temporarily and I don't think cr8 is updated when this is done.  The
switch may need to be atomic.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
