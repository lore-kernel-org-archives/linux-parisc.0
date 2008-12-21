From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Sun, 21 Dec 2008 17:48:57 -0500 (EST)
Message-ID: <20081221224858.7DDAB4F19@hiauly1.hia.nrc.ca>
References: <20081221222005.GB30144@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@infradead.org, deller@gmx.de, linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081221222005.GB30144@bombadil.infradead.org> from "Kyle McMartin" at Dec 21, 2008 05:20:05 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> 
> On Sun, Dec 21, 2008 at 10:20:16AM -0500, John David Anglin wrote:
> > > Honestly, I can't decide whether to apply this. It really should never
> > > happen in the kernel, since the kernel can guarantee it won't get the
> > > access rights failure (highest privilege level, and can set %sr and
> > > %protid to whatever it wants.)
> > 
> > I believe this change should be applied because we enable P and the
> > hardware can generate the exception.  Yes, it should never happen, but
> > the coding to prevent this occurring is very subtle.
> > 
> 
> If we're going to paper over a bug like this, we might as well just turn
> the P-bit off...

I just want a segv instead of a panic as I don't think we know whether
the kernel is bad or not.

This bug has been around for for some time.  I believe that it was reported
in 2004, or earlier.

Even HP has problems.  Saw this today:

Release Date: Nov 19 2008
Description :   PHKL_39110: ( QX:QXCR1000827621 ) The system can panic with
 the following panic string and stack trace. Panic string : Data memory
 protection/access rights/alignment fault FUNC panic+0x6c
 report_trap_or_int_and_panic+0x94 interrupt+0x4e4 ihandler+0x940
+-------------  TRAP  ----------------------------
|  Trap type 18 in KERNEL mode at 0x38f50 (lbcopy+0x1f0)
|  p struct save_state 0.0x189cc60
+-------------  TRAP  ----------------

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
