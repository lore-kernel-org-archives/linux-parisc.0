Received: from mailserv2.iuinc.com (qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.8.7/8.8.7) with SMTP id PAA17308
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Nov 1999 15:37:06 -0700
Received: from xsvr4.cup.hp.com (xsvr4.cup.hp.com [15.0.68.169])
	by atlrel1.hp.com (Postfix) with ESMTP id D4D372DF4
	for <parisc-linux@thepuffingroup.com>; Wed, 24 Nov 1999 17:38:50 -0500 (EST)
Received: from hp.com (localhost [127.0.0.1]) by xsvr4.cup.hp.com with ESMTP (8.7.6/8.7.3) id OAA24357 for <parisc-linux@thepuffingroup.com>; Wed, 24 Nov 1999 14:38:50 -0800 (PST)
Sender: frowand@cup.hp.com
Message-ID: <383C68F9.C8C6792A@hp.com>
Date: Wed, 24 Nov 1999 14:38:49 -0800
From: Frank Rowand <frank_rowand@hp.com>
Reply-To: frowand@cup.hp.com
MIME-Version: 1.0
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Progress - Update
References: <19991124220528.L1009@mathe.stud.uni-erlangen.de> <199911242127.NAA27314@chrome.rose.hp.com> <19991124223730.N1009@mathe.stud.uni-erlangen.de>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Philipp Rumpf wrote:
> 
> >| are you up-to-date with the cvs tree (I have no idea which caches the 735
> >| has, but cache flushes won't harm (well, they do harm performance)) ?
> >
> > The cache flush instructions are architected to cause a processor to memory
> > transfer iff the cache line is dirty, while an instruction is executed,
> > unless a dirty cache line is referenced, memory bandwidth is not consumed.
> 
> At the current rate of cache flushes (way way too high), the main factor wrt
> performance is indeed the execution of the instructions.
> 
> As soon as we've implemented page colouring (which turns out to be really very
> close to large page support), I expect us to get along with very very few
> cache flushes - basically I hope we can avoid them completely.
> 
>         Philipp Rumpf

No such luck.  You'll need cache flushing in drivers for non-coherent IO.

-Frank
