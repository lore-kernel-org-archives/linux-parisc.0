Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] atomic_t 
In-Reply-To: Message from Matthew Wilcox <willy@debian.org>
   of "Mon, 14 Jan 2002 04:43:37 GMT." <20020114044337.B9193@parcelfarce.linux.theplanet.co.uk>
References: <20020113211508.V9193@parcelfarce.linux.theplanet.co.uk> <willy@debian.org> <20020114040909.87321482A@dsl2.external.hp.com>  <20020114044337.B9193@parcelfarce.linux.theplanet.co.uk> 
Date: Mon, 14 Jan 2002 00:12:32 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020114071232.07537482A@dsl2.external.hp.com>
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
> Not on PA... look at <asm/atomic.h>.  There's only 3 primitives, all
> other atomic ops are defined in terms of those.

Ah ok - you are right. atomic_read() doesn't use the lock and
that only leaves the other two.

> > But someone thought it was time to reset the counter. And if
> > it "never happened", then whoever is looking for 'v == 1' will
> > never see it.
> 
> It's a race though; they can't guarantee to see it anyway.

hmmm...Most people write code with the intent of seeing *some*
event (eg v < 0).  Ie, if it didn't matter, then we don't need
the code.  I'd like to believe folks are usually more careful
than that.  I need to think about this some more though.

grant
