Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from puffin.external.hp.com (puffin.external.hp.com [192.25.206.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id BF4C8482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 11:22:19 -0700 (MST)
Received: from puffin (IDENT:grundler@localhost [127.0.0.1])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id LAA17663
	for <parisc-linux@lists.parisc-linux.org>; Thu, 15 Nov 2001 11:18:13 -0700
Message-Id: <200111151818.LAA17663@puffin.external.hp.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.14-pa1 seems to works fine on my B180 
In-Reply-To: Message from rbradetich@uswest.net (Ryan Bradetich)
   of "Thu, 15 Nov 2001 00:11:00 MST." <20011115001100.A23883@beavis.ybsoft.com>
Date: Thu, 15 Nov 2001 11:18:13 -0700
From: Grant Grundler <grundler@puffin.external.hp.com>
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

Ryan Bradetich wrote:
...
> Not that this is much help, but hopefully will provide a data
> point ....

I found the bug in sba and it seems that ccio has the
same bug. The basic problem was coalescing of DMA mapping
requests was resulting in DMA requests bigger than DMA_CHUNK_SIZE.

thanks to all who responded.

grant

ps. I found the bug pretty quickly once I enabled ASSERTs
  that I had embedded in the code when I wrote it.
