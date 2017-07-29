From: John David Anglin <dave.anglin@bell.net>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid context at mm/slab.h:416
Date: Sat, 29 Jul 2017 15:53:44 -0400
Message-ID: <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org
To: Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-07-29, at 3:09 PM, Meelis Roos wrote:

> [    1.940000]  [<000000004011b4a4>] pdc_stable_init+0x2c4/0x458

I don't see this symbol in my build.  I see pdc_stable_initialize.

Do you have a patch installed?

Dave
--
John David Anglin	dave.anglin@bell.net



