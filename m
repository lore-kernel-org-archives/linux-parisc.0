Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id FAA10107
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Mar 2000 05:14:58 -0700
Date: Thu, 16 Mar 2000 12:15:25 +0100
From: Philipp Rumpf <prumpf@inwestnet.de>
To: willy@thepuffingroup.com
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Merge with Linus 2.3.99pre1
Message-ID: <20000316121525.H673@abacus.local>
References: <20000315140309.U27942@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000315140309.U27942@thepuffingroup.com>; from willy@thepuffingroup.com on Wed, Mar 15, 2000 at 02:03:09PM -0500
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 15, 2000 at 02:03:09PM -0500, willy@thepuffingroup.com wrote:
> Linus released 2.3.99pre1 today which marks the start of the 2.4
> release effort.  We'd like to merge Linus' changes into our tree on
> Friday, starting around 11am EST (8am PST, 4pm UTC, 5pm CET).

I don't think merging with 2.3.99pre1 before verifying it works on at least
one other non-x86 architecture is a good idea.  I'd also prefer it if someone
tried nfsroot aso with it before.

Wouldn't it be a good idea to choose a kernel that has been released for more
than 2 days for merging ?

> If you have any local changes which can go back into our tree, now would be a
> good time to commit them.

I do, but am still waiting for reactions to the Assembly Language Changes
thread.

> If you're in the middle of something which
> will be disrupted by this, now would also be a good time to shout `STOP'.

My changes can as easily be merged after we moved to 2.3.99pre1 as they can
now.

	Philipp
