From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Wed, 17 Dec 2008 23:04:00 -0500
Message-ID: <20081218040400.GE30438@bombadil.infradead.org>
References: <20081218004329.GB30438@bombadil.infradead.org> <20081218030214.5CABB4E99@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Kyle McMartin <kyle@infradead.org>, deller@gmx.de,
	linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218030214.5CABB4E99@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 17, 2008 at 10:02:13PM -0500, John David Anglin wrote:
> > Eh? r22 is 0020fd0e... although it's easier to spot by looking at IOR
> > > >  IIR: 0ed5d240    ISR: 00000847  IOR: 0020fd0e
> 
> Obviously, I can't count...
> 
> > Although, I don't think we're supposed to ever be taking a P. Id trap on
> > a userspace process as the kernel...
> 
> Ok, should P and/or D be on?
> 

Huh... Possibly the P-bit shouldn't be on for kernel mode... the kernel
after all can scribble on whomevers pages it so chooses...

> Assuming the protection id isn't wrong, then the WD bit must be on.
> A problem with the WD bit might explain Helge's comment.
> 
> As a start, dumping CR 8, 9, 12 and 13 might help debug the problem.
> 

Building a patch to do this now, will attach it here if it builds.

> There might be a problem restoring access IDs after a cache purge or
> TLB insertion.
> 

I honestly have no idea how the protection id registers are loaded... I
thought it had something do with with space registers, but I can't
remember off the top of my head.
