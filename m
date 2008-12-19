From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Fri, 19 Dec 2008 11:13:29 -0500 (EST)
Message-ID: <20081219161330.04BE04EF8@hiauly1.hia.nrc.ca>
References: <119aab440812190725r4e222233r7e3115b1db9ed919@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, deller@gmx.de, linux-parisc@vger.kernel.org
To: carlos@systemhalted.org (Carlos O'Donell)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440812190725r4e222233r7e3115b1db9ed919@mail.gmail.com> from "Carlos O'Donell" at Dec 19, 2008 10:25:48 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > For future reference, in mmu_context.h. Bloody tricky mtctl() macro
> > doesn't take a prefix, just the numeric cr #.
> 
> Evil.

If this is a problem with the WD bit, the problem is likely here:

        mtctl(context >> (SPACEID_SHIFT - 1),8);

It's possible this might set the WD bit depending on the alignment
of context and the value of SPACEID_SHIFT on your machine.  If you
can duplicate, maybe add a BUG_ON.  On hppa64, all structs are passed
by value, so the alignment of context  may only be BIGGEST_ALIGNMENT.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
