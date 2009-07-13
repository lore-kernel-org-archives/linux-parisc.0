From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: Wierd code in Entry.S
Date: Sun, 12 Jul 2009 21:44:37 -0400 (EDT)
Message-ID: <20090713014438.9CAB4505D@hiauly1.hia.nrc.ca>
References: <20090713011549.GE31925@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, grundler@parisc-linux.org,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: kyle@mcmartin.ca (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090713011549.GE31925@bombadil.infradead.org> from "Kyle McMartin" at Jul 12, 2009 09:15:49 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Can someone distill all these mails into a patch? It will directly apply
> to upstream and all the current stable releases, so a single patch
> should suffice.
> 
> I'd do it myself, but I'm too busy writing a paper this week. :/

The most important change is attached.  Bit 12 needs to be set in the
protection register, not bit 44.  The change has had three days testing
on my rp3440 (PA8800) without any unusual segmentation faults.  Also,
tested on a couple of PA8700 machines.  This fixes the problem noticed
by Artem Alimarine.

At the moment, I don't have a change for the macros.  The DEP and DEPI
macros conflict with PA 1.x mneumonics.  So, they should be renamed.
I also think the 32-bit instructions in the macros should use PA 1.x
rather than 2.0 mneumonics.  The 1.x mneumonics should be ok for both
PA 1.x and 2.0.  It is possible that building for a PA 1.x machine might
not work with the current macros.  Maybe James has something for the
macros.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

diff --git a/arch/parisc/kernel/entry.S b/arch/parisc/kernel/entry.S
index ae3e70c..e552e54 100644
--- a/arch/parisc/kernel/entry.S
+++ b/arch/parisc/kernel/entry.S
@@ -553,7 +553,7 @@
 	 * on most of those machines only handles cache transactions.
 	 */
 	extrd,u,*=	\pte,_PAGE_NO_CACHE_BIT+32,1,%r0
-	depi		1,12,1,\prot
+	depdi		1,12,1,\prot
 
 	/* Drop prot bits and convert to page addr for iitlbt and idtlbt */
 	convert_for_tlb_insert20 \pte
