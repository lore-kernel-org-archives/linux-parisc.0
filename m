From: Meelis Roos <mroos@linux.ee>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid
 context at mm/slab.h:416
Date: Sun, 30 Jul 2017 09:47:50 +0300 (EEST)
Message-ID: <alpine.LRH.2.20.1707300947250.27473@math.ut.ee>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee> <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > [    1.940000]  [<000000004011b4a4>] pdc_stable_init+0x2c4/0x458
> 
> I don't see this symbol in my build.  I see pdc_stable_initialize.
> 
> Do you have a patch installed?

No, pristine v4.13-rc2-110-g0b5477d9dabd git.

-- 
Meelis Roos (mroos@linux.ee)
