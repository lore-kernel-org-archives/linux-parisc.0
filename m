From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Tue, 23 Dec 2008 08:13:08 -0500 (EST)
Message-ID: <20081223131309.75E944EDD@hiauly1.hia.nrc.ca>
References: <20081223025421.GF30144@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: James.Bottomley@HansenPartnership.com, deller@gmx.de,
	kyle@infradead.org, linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081223025421.GF30144@bombadil.infradead.org> from "Kyle McMartin" at Dec 22, 2008 09:54:21 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> just fyi, jejb sleuthed out that it was flush_tlb_mm's non-SMP path
> (which "flushes" the tlb by allocating a new spaceid) that was causing
> the problem, and helge verified that it fixes the bug.

It seems this code can be called from drivers.  Maybe the context
update needs to be surrounded by task_lock(current)...task_unlock(current).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
