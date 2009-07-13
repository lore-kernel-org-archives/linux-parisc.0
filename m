From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: Wierd code in Entry.S
Date: Sun, 12 Jul 2009 21:15:49 -0400
Message-ID: <20090713011549.GE31925@bombadil.infradead.org>
References: <20090711010513.38B824FE2@hiauly1.hia.nrc.ca> <20090712194035.DD080500D@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: James.Bottomley@HansenPartnership.com, grundler@parisc-linux.org,
	artem.alimarine@stromasys.com, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090712194035.DD080500D@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, Jul 12, 2009 at 03:40:34PM -0400, John David Anglin wrote:
> > > It looks to me like these macros can be deleted.  For example, the PA 1.x
> > > depi mneumonic is equivalent to the PA 2.0 depwi mneumonic.  See Table
> > > J-2 in PA 2.0 arch.  There's no need for the 64-bit versions.  The PA 1.x
> > > mneumonics are still valid in PA 2.0 assembler.  However, I would suggest
> > > that the PA 2.0 mneumonics be used in PA 2.0 specific code.
> 
> Sorry, the macros can't be removed.  The PA 1.x mneumonics result in undefined
> behavior in the most sign-significant 32 bits.  The should just be renamed.
> 

Can someone distill all these mails into a patch? It will directly apply
to upstream and all the current stable releases, so a single patch
should suffice.

I'd do it myself, but I'm too busy writing a paper this week. :/

regards, Kyle
