Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] O_DIRECT on devices 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 15 Jul 2002 03:46:32 BST." <20020715034632.E27706@parcelfarce.linux.theplanet.co.uk>
References: <20020711082259.GF822@tykepenguin.com>  <20020715034632.E27706@parcelfarce.linux.theplanet.co.uk> 
Date: Mon, 15 Jul 2002 01:42:19 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020715074219.18CD54861@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Matthew Wilcox wrote:
> What you're seeing sounds like bogus cache behaviour.

Randolph and I think most SMP bugs reported (and we seen ourselves)
suggest a D-cache problem.

My theory is virtual addresses are flushed on one CPU but any data 
accessed through an aliases on another CPU are not flushed. And then
we end up with an inconsistency.

We've been reading Documentation/cachetlb.txt and trying
to understand what it says about virtually indexed caches.

The other thing is we don't hit the problems with PA8500 - only PA8700.
I'm guessing the aliasing or timing is quite different betweem the two.
Maybe someone else knows more?

grant
