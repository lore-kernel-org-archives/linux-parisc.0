Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id JAA11572
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Mar 2000 09:26:28 -0700
From: willy@thepuffingroup.com
Date: Thu, 16 Mar 2000 10:27:48 -0500
To: Philipp Rumpf <prumpf@inwestnet.de>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Merge with Linus 2.3.99pre1
Message-ID: <20000316102748.D27942@thepuffingroup.com>
References: <20000315140309.U27942@thepuffingroup.com> <20000316121525.H673@abacus.local>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000316121525.H673@abacus.local>; from Philipp Rumpf on Thu, Mar 16, 2000 at 12:15:25PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Mar 16, 2000 at 12:15:25PM +0100, Philipp Rumpf wrote:
> On Wed, Mar 15, 2000 at 02:03:09PM -0500, willy@thepuffingroup.com wrote:
> > Linus released 2.3.99pre1 today which marks the start of the 2.4
> > release effort.  We'd like to merge Linus' changes into our tree on
> > Friday, starting around 11am EST (8am PST, 4pm UTC, 5pm CET).
> 
> I don't think merging with 2.3.99pre1 before verifying it works on at least
> one other non-x86 architecture is a good idea.  I'd also prefer it if someone
> tried nfsroot aso with it before.

It works on sparc (Josh Uziel has it running).  Your point about trying
nfs-root is a good one.  I shall test that today.

> Wouldn't it be a good idea to choose a kernel that has been released for more
> than 2 days for merging ?

By Friday it'll have been out for 4 days :-)  If there's anything
catastrophic, I think we would know by now.

> > If you have any local changes which can go back into our tree, now would be a
> > good time to commit them.
> 
> I do, but am still waiting for reactions to the Assembly Language Changes
> thread.

i think that anyone who wants to object has had sufficient time to do so
by now.

> > If you're in the middle of something which
> > will be disrupted by this, now would also be a good time to shout `STOP'.
> 
> My changes can as easily be merged after we moved to 2.3.99pre1 as they can
> now.

I guess it's your call then.
