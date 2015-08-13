From: Meelis Roos <mroos@linux.ee>
Subject: Re: A500 boot crash in 4.2.0-rc3-00246-g763e326
Date: Thu, 13 Aug 2015 18:42:48 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1508131842320.25000@math.ut.ee>
References: <alpine.LRH.2.11.1507260929000.30065@math.ut.ee> <BLU437-SMTP22FDC655D41AF9BCB78508977D0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU437-SMTP22FDC655D41AF9BCB78508977D0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Tried 4.2.0-rc3-00246-g763e326 on A500 but it crashes on boot. This is 
> > still present in todays 4.2.0-rc6+git. 4.1 was fine, I Will bisect but 
> > it takes time.
> 
> This is probably a hpmc.  Could you look at SL event log?  It should show address of
> the hpmc.  Then, look at kernel image with objdump and search for address.  This should
> show where crash occurred and it might give a clue as to the cause.

How do I set filters for SL?

-- 
Meelis Roos (mroos@linux.ee)
