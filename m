From: John David Anglin <dave.anglin@bell.net>
Subject: Re: A500 boot crash in 4.2.0-rc3-00246-g763e326
Date: Thu, 13 Aug 2015 07:32:25 -0400
Message-ID: <BLU437-SMTP22FDC655D41AF9BCB78508977D0@phx.gbl>
References: <alpine.LRH.2.11.1507260929000.30065@math.ut.ee>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset="us-ascii"
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.11.1507260929000.30065@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-08-12, at 4:35 PM, Meelis Roos wrote:

> Tried 4.2.0-rc3-00246-g763e326 on A500 but it crashes on boot. This is 
> still present in todays 4.2.0-rc6+git. 4.1 was fine, I Will bisect but 
> it takes time.

This is probably a hpmc.  Could you look at SL event log?  It should show address of
the hpmc.  Then, look at kernel image with objdump and search for address.  This should
show where crash occurred and it might give a clue as to the cause.

Dave
--
John David Anglin	dave.anglin@bell.net



