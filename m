Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from localhost.localdomain (the-village.bc.nu [81.2.110.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5B35C4840
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 12 Apr 2004 14:57:16 -0600 (MDT)
Subject: Re: [parisc-linux] Voodoo 2
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "M. Grabert" <xam@cs.ucc.ie>
In-Reply-To: <Pine.LNX.4.58.0404112251130.26022@sal.ucc.ie>
References: <Pine.LNX.4.58.0404112251130.26022@sal.ucc.ie>
Content-Type: text/plain
Message-Id: <1081790136.2279.22.camel@localhost.localdomain>
Mime-Version: 1.0
Date: Mon, 12 Apr 2004 18:15:38 +0100
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Llu, 2004-04-12 at 00:12, M. Grabert wrote:
>   I suppose this driver also doesn't require the Voodoo2 card to be initialized,
>   and I think the advanage over using sstfb would be that it supports DGA
>   and some 2D acceleration.

Mostly the 2D acceleration is useful

>   Has anybody tested it (I couldn't even compile it)?

You need to drop it into a full XFree 4.3/X.org 6.7 tree to build
which makes it umm fun. When you get to that point I can give you
instructions and we can debug it 8)
