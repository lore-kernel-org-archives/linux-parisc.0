From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH] [RFC] fix kernel crash (protection id trap) when
Date: Wed, 17 Dec 2008 22:02:13 -0500 (EST)
Message-ID: <20081218030214.5CABB4E99@hiauly1.hia.nrc.ca>
References: <20081218004329.GB30438@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, linux-parisc@vger.kernel.org
To: kyle@infradead.org (Kyle McMartin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081218004329.GB30438@bombadil.infradead.org> from "Kyle McMartin" at Dec 17, 2008 07:43:29 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Eh? r22 is 0020fd0e... although it's easier to spot by looking at IOR
> > >  IIR: 0ed5d240    ISR: 00000847  IOR: 0020fd0e

Obviously, I can't count...

> Although, I don't think we're supposed to ever be taking a P. Id trap on
> a userspace process as the kernel...

Ok, should P and/or D be on?

Assuming the protection id isn't wrong, then the WD bit must be on.
A problem with the WD bit might explain Helge's comment.

As a start, dumping CR 8, 9, 12 and 13 might help debug the problem.

There might be a problem restoring access IDs after a cache purge or
TLB insertion.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
