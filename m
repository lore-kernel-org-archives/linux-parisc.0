Return-Path: <xam@cs.ucc.ie>
Received: from csmail.ucc.ie (csmail.ucc.ie [143.239.211.231])
	by dsl2.external.hp.com (Postfix) with ESMTP id 59B634844
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 11 Apr 2004 17:12:51 -0600 (MDT)
Received: from sal.ucc.ie (tqpc.ucc.ie [143.239.201.88])
	by csmail.ucc.ie (8.12.10/8.12.10) with ESMTP id i3BNCn0o027704
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 12 Apr 2004 00:12:50 +0100
Date: Mon, 12 Apr 2004 00:12:44 +0100 (IST)
From: "M. Grabert" <xam@cs.ucc.ie>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.58.0404112251130.26022@sal.ucc.ie>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] Voodoo 2
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi,

I'm about to purchase a Voodoo2 PCI graphics card since I saw some
reports on the p-l list that it is working on Linux/PA-RISC.


I want to ask a couple of questions before I'm going to buy the graphics card:

- Helge prepared a patch to make the Voodoo working, and was incorporated
  into the 2.4.19-pa18 kernel. It seems that it's still in 2.4.25-pa1.
  But is the patch integrated into the mainstream 2.4?
  I just took a brief look, and it appears so, is this correct?


- What about 2.6? I don't think that it's been forwarded to 2.6 yet?


- there is also the XFree86 Voodoo 1/2 driver from Alan Cox
(http://lists.parisc-linux.org/pipermail/parisc-linux/2004-February/022382.html)

  I suppose this driver also doesn't require the Voodoo2 card to be initialized,
  and I think the advanage over using sstfb would be that it supports DGA
  and some 2D acceleration.

  Has anybody tested it (I couldn't even compile it)?


Thanks alot,
  Max
