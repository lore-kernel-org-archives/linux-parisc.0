Return-Path: <ajwalker@broadpark.no>
Received: from mail.broadpark.no (mail.broadpark.no [217.13.4.2])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D89C487E
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Mar 2004 14:43:28 -0700 (MST)
Received: from tolstoy.puszczka.com (47.80-202-73.nextgentel.com
	[80.202.73.47])
	by mail.broadpark.no (Postfix) with ESMTP id 363A78D79
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 13 Mar 2004 22:43:27 +0100 (MET)
Message-ID: <45740.127.0.0.1.1079214694.squirrel@www.puszczka.com>
Date: Sat, 13 Mar 2004 22:51:34 +0100 (CET)
From: "Andy Walker" <ajwalker@broadpark.no>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-1
Subject: [parisc-linux] (no subject)
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

My B132L has its console on an HCRX24 GSC card (A4071B_LZ). In 2.4.25-pa1
it defaults to 32bpp and works fine. In 2.6.4-rc1-pa2 (and 2.6.3-pa0)
it now defaults to 8bpp which also works fine. I want to run the card in
32bpp though, but if I try stifb=bpp:32, or hardcoding the equivalent
in stifb.c then the machine locks hard immediately after switching to
the sti console. The screen is full of corrupted junk from the previous
shutdown and I have to hit the power button to boot again.

The HCRX24 is correctly identified in stifb.c as S9000_ID_HCRX and
IS_24_DEVICE(fb) is true. Is anybody using one of these cards in 32bpp?
I see that the code has been shuffled around a fair bit between 2.4.25
and 2.6.x and I'm not exactly sure where to start looking for problems.
Tips?

cheers,
-Andy
