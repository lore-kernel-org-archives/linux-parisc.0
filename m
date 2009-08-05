From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [PATCH] parisc-isa-eeprom: Fix loff_t usage
Date: Wed, 5 Aug 2009 14:20:57 -0600
Message-ID: <20090805202056.GN3711@parisc-linux.org>
References: <200907210058.44737.mb@bu3sch.de> <4A79D1BF.5020305@gmx.de> <1249502221.4183.43.camel@mulgrave.site> <20090805201456.GR28572@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James Bottomley <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090805201456.GR28572@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Aug 05, 2009 at 04:14:56PM -0400, Kyle McMartin wrote:
> On Wed, Aug 05, 2009 at 02:57:01PM -0500, James Bottomley wrote:
> > Hang on a minute, this is an untested patch.  True, it will likely cause
> > no harm, but it would be more usual to wait for the actual confirmation
> > before declaring the problem fixed.
> > 
> 
> I'd be shocked if anyone was actually in a position to test this at
> all... I don't remember where I put my last Mongoose and HP VG ethernet
> card... It looked fine to me though.

My 725 is sitting idle in the rack ... I think it's got two EISA cards
in it.  I've also got a Mongoose card for the 715.

There's two problems that would prevent me from testing this.

One is that I don't have any HIL devices, and the current HIL driver
goes insane with printks if you have no HIL deviecs plugged in.

The other is that the EISA code refuses to work until the EISA cards
have been configured, and we don't have a Linux utility to configure
EISA cards.

-- 
Matthew Wilcox				Intel Open Source Technology Centre
"Bill, look, we understand that you're interested in selling us this
operating system, but compare it to ours.  We can't possibly take such
a retrograde step."
