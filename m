From: Kyle McMartin <kyle@infradead.org>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Wed, 17 Dec 2008 22:05:47 -0500
Message-ID: <20081218030547.GD30438@bombadil.infradead.org>
References: <20081218004329.GB30438@bombadil.infradead.org> <20081218030214.5CABB4E99@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218030214.5CABB4E99@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Dec 17, 2008 at 10:02:13PM -0500, John David Anglin wrote:
> > Although, I don't think we're supposed to ever be taking a P. Id trap on
> > a userspace process as the kernel...
> 
> Ok, should P and/or D be on?
> 
> Assuming the protection id isn't wrong, then the WD bit must be on.
> A problem with the WD bit might explain Helge's comment.
> 
> As a start, dumping CR 8, 9, 12 and 13 might help debug the problem.
> 
> There might be a problem restoring access IDs after a cache purge or
> TLB insertion.
> 

I'm starting a build of ruby now, with some debugging gunk added
to dump the pid %crs, we'll see how it goes in a few hours...

re, Kyle
