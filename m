Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 36B1648A2
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Mar 2004 03:13:19 -0700 (MST)
Received: from tolstoy.puszczka.com (47.80-202-73.nextgentel.com
	[80.202.73.47])
	by mail.broadpark.no (Postfix) with ESMTP id 3FB715D75
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 15 Mar 2004 11:13:12 +0100 (MET)
Message-ID: <58996.193.161.152.244.1079346085.squirrel@www.puszczka.com>
Date: Mon, 15 Mar 2004 11:21:25 +0100 (CET)
From: "Andy Walker" <ajwalker@broadpark.no>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Subject: [parisc-linux] STI crash on B132L with HCRX-24
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Re-post as I forgot the subject first time round :-(

My B132L has its console on an HCRX-24Z GSC card (A4071B_LZ). In
2.4.25-pa1 it defaults to 32bpp and works fine. In 2.6.4-rc1-pa2 (and
2.6.3-pa0) it
defaults to 8bpp which also works fine. The problem occurs if I try to run
2.6.x in 32bpp (either via stifb=bpp:32, or by hacking stifb.c). The machine
locks hard immediately after switching to the FB. The screen is full of
corrupted junk in psychedelic colours from the previous shutdown and I
have to hit the power button to boot again.

The HCRX24 is correctly identified in stifb.c as S9000_ID_HCRX and
IS_24_DEVICE(fb) is true. Is anybody using one of these cards in 32bpp?
Should I try an HCRX-24 without the the Z board? I see that the code has
been  shuffled around a bit between 2.4.25 and 2.6.x and I'm not exactly
sure where to start looking for problems. Studying the listings side by
side I'm suspicious of the colormap stuff, but only because I don't yet
understand a) how it works, and b) the changes between 2.4 and 2.6.

cheers,
-Andy
