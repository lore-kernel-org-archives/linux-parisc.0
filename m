Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD9054603.dip.t-dialin.net [217.5.70.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 47A364845
	for <parisc-linux@parisc-linux.org>; Mon, 17 Dec 2001 16:51:43 -0700 (MST)
Date: Tue, 18 Dec 2001 00:49:26 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Helge Deller <deller@gmx.de>
Cc: Matthew Wilcox <willy@debian.org>,
	Andy Walker <squawker@start.no>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Status report - B132L and 725/100
Message-ID: <20011218004926.A5571@solo.franken.de>
References: <1008589643.3c1ddb4b75583@nyepost.start.no> <20011217143513.W10085@parcelfarce.linux.theplanet.co.uk> <20011217222143.4F578482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011217222143.4F578482A@dsl2.external.hp.com>; from deller@gmx.de on Mon, Dec 17, 2001 at 11:21:01PM +0100
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

On Mon, Dec 17, 2001 at 11:21:01PM +0100, Helge Deller wrote:
> I think a better solution would be to sort the found graphic devices by the hpa.
[...]
> In case the user wants to override with the sti= parameter the kernel should now
> select this entry (e.g. sti=1 should select the card at 0xf4000000).

the big problem is, that stifb completly ignores sti= from the commandline
and video=map doesn't seem to work (I need to reconfigure a machine to test
that myself, which I hadn't time yet). The best thing would be to use
the console path from pdc, no idea how hard that is.

It's probably not a big deal to use the default sti (sti=) for stifb, but
I'd prefer either a video="???" solution or the pdc console path. If we 
decide on a solution, I'm going to implement it (if nobody else wants
to do it :-)).

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
