From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: parisc 4.13-git, BUG: sleeping function called from invalid
 context at mm/slab.h:416
Date: Sat, 29 Jul 2017 13:27:52 -0700
Message-ID: <1501360072.2834.4.camel@HansenPartnership.com>
References: <alpine.LRH.2.20.1707292206210.12687@math.ut.ee>
         <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: linux-parisc@vger.kernel.org
To: John David Anglin <dave.anglin@bell.net>,
        Meelis Roos <mroos@linux.ee>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CEB1A532-3AAD-4A4D-9A34-12A2477BE87F@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, 2017-07-29 at 15:53 -0400, John David Anglin wrote:
> On 2017-07-29, at 3:09 PM, Meelis Roos wrote:
> 
> > 
> > [    1.940000]  [<000000004011b4a4>] pdc_stable_init+0x2c4/0x458
> 
> I don't see this symbol in my build.  I see pdc_stable_initialize.
> 
> Do you have a patch installed?

pdc_stable_init() is in drivers/parisc/pdc_stable.c (it's the module
initialization function).  It would be called as part of the boot
sequence if the module were built in.

James

