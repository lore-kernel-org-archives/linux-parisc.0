Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from deimos.frii.net (deimos.frii.com [216.17.128.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5A05C482A
	for <parisc-linux@parisc-linux.org>; Mon, 21 May 2001 16:27:16 -0600 (MDT)
Message-Id: <m151y8p-001VltC@bame.riverrock.org>
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@parisc-linux.org, bame@www.riverrock.org
Subject: Re: [parisc-linux] More unaligned references 
In-Reply-To: Message from Matthew Wilcox <matthew@wil.cx>
   of "Mon, 21 May 2001 22:50:06 BST." <20010521225006.I23718@parcelfarce.linux.theplanet.co.uk>
References: <20010521225006.I23718@parcelfarce.linux.theplanet.co.uk> 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 21 May 2001 16:27:07 -0600
From: Paul Bame <bame@riverrock.org>
List-ID: <linux-parisc.vger.kernel.org>

> 0x20220 <Letext+1568>:  addil 4800,dp,%r1
> 0x20224 <Letext+1572>:  ldw fb(sr0,r1),r21
> 0x20228 <Letext+1576>:  bv r0(r21)

FYI in case others run across it, this was discovered to be the ".plt-1" bug.
To find out, use 'objdump -h' to figure out where .plt is loaded.  Then add
0x4800 plus 0xfb plus the dp register (r27).  If that's .plt-1 you've found
the bug which is/should-be squashed in recent bits.

	-P
