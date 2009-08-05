From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: [PATCH] parisc-isa-eeprom: Fix loff_t usage
Date: Wed, 05 Aug 2009 14:57:01 -0500
Message-ID: <1249502221.4183.43.camel@mulgrave.site>
References: <200907210058.44737.mb@bu3sch.de>  <4A79D1BF.5020305@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A79D1BF.5020305@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, 2009-08-05 at 20:38 +0200, Helge Deller wrote:
> On 07/21/2009 12:58 AM, Michael Buesch wrote:
> > loff_t is a signed type. If userspace passes a negative ppos, the "count"
> > range check is weakened. "count"s bigger than HPEE_MAX_LENGTH will pass the check.
> > Also, if ppos is negative, the readb(eisa_eeprom_addr + *ppos) will poke in random
> > memory.
> >
> > Signed-off-by: Michael Buesch<mb@bu3sch.de>
> > Cc: stable@kernel.org
> 
> Thanks!
> 
> Applied and pushed upstream.

Hang on a minute, this is an untested patch.  True, it will likely cause
no harm, but it would be more usual to wait for the actual confirmation
before declaring the problem fixed.

I'm also very concerned about this:

http://lkml.org/lkml/2009/8/2/107

That's a breach of standard maintainer protocol since you failed to copy
the architecture list on the pull request.

Parisc is in a precarious position as a marginal architecture that isn't
being produced any more.  Having duelling trees and maintainers is
definitely very unhelpful because it could cause Linus to lose
confidence in our ability as a community.

First things first, you need to agree on a single tree ... although it's
perfectly possible to have multiple maintainers commit to it (x86 works
this way), can we do this at least before the schizophrenia gets
noticed?

Thanks,

James


