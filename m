Return-Path: <willy@www.linux.org.uk>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk
	[195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1EE0D488E
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 29 Mar 2004 09:31:35 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1B7zfi-0006Zb-BB; Mon, 29 Mar 2004 17:31:34 +0100
Date: Mon, 29 Mar 2004 17:31:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] init_idle and local_irq_save
Message-ID: <20040329163134.GE7709@parcelfarce.linux.theplanet.co.uk>
References: <20040329160357.GA31448@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20040329160357.GA31448@colo.lackof.org>
Sender: <willy@www.linux.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Mon, Mar 29, 2004 at 09:03:57AM -0700, Grant Grundler wrote:
> o double_rq_lock() acquires the locks with lowest address first.
>   double_rq_unlock() does not release those in the inverse order.
>   Is that a problem?

No.  You have two possibilities (locks A, B; acquire and release):

1. Aa Ba Ar Br
2. Aa Ba Br Ar

It doesn't matter how you combine them; either you are waiting for A or
you have A and are waiting for B.  You never have B and are waiting for A.
Case 2 is the more common idiom since B is then entirely nested within A,
but lock A ranks lock B in both cases, so you're safe.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
