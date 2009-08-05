From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: [PATCH] parisc-isa-eeprom: Fix loff_t usage
Date: Wed, 5 Aug 2009 16:14:56 -0400
Message-ID: <20090805201456.GR28572@bombadil.infradead.org>
References: <200907210058.44737.mb@bu3sch.de> <4A79D1BF.5020305@gmx.de> <1249502221.4183.43.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Helge Deller <deller@gmx.de>, kyle@mcmartin.ca,
	linux-parisc@vger.kernel.org
To: James Bottomley <James.Bottomley@HansenPartnership.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1249502221.4183.43.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Aug 05, 2009 at 02:57:01PM -0500, James Bottomley wrote:
> Hang on a minute, this is an untested patch.  True, it will likely cause
> no harm, but it would be more usual to wait for the actual confirmation
> before declaring the problem fixed.
> 

I'd be shocked if anyone was actually in a position to test this at
all... I don't remember where I put my last Mongoose and HP VG ethernet
card... It looked fine to me though.

> I'm also very concerned about this:
> 
> http://lkml.org/lkml/2009/8/2/107
> 
> That's a breach of standard maintainer protocol since you failed to copy
> the architecture list on the pull request.
> 
> Parisc is in a precarious position as a marginal architecture that isn't
> being produced any more.  Having duelling trees and maintainers is
> definitely very unhelpful because it could cause Linus to lose
> confidence in our ability as a community.
> 
> First things first, you need to agree on a single tree ... although it's
> perfectly possible to have multiple maintainers commit to it (x86 works
> this way), can we do this at least before the schizophrenia gets
> noticed?
> 

I think Helge was just upset that I wasn't merging things fast enough,
and, fair enough, I guess. I promise to rectify that, and if I don't, I
plan to step aside.

regards, Kyle
