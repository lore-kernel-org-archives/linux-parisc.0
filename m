Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Leif Harcke <lharcke@Stanford.EDU>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Tulip driver fails to advertise 100baseTx media capability 
In-Reply-To: Message from Leif Harcke <lharcke@Stanford.EDU>
   of "Fri, 22 Nov 2002 19:16:23 PST." <Pine.LNX.4.44.0211221747260.29185-100000@chirp.Stanford.EDU>
References: <Pine.LNX.4.44.0211221747260.29185-100000@chirp.Stanford.EDU> 
Date: Sat, 23 Nov 2002 16:53:20 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021123235320.4E4AC482E@dsl2.external.hp.com>
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

Leif Harcke wrote:
> > It's possible this is a problem/interaction with your switch/hub.
> 
> I don't think this is a possibility.  The kernel/Tulip have to decide what
> to advertise on the link long before autonegotiation is attempted, right?

I gather you know more about negotiation that I.

> From reading
> kernel source it appears that the Tulip driver sets some default state if
> it can't build the mtable.  Perhaps this is where the error comes from.

Can you look a bit more and post a patch?
Several people could comment.

thanks,
grant
