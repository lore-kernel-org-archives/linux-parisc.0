Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from leo.uni-sw.gwdg.de (leo.uni-sw.gwdg.de [134.76.205.152])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72BF7482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 11 Jun 2001 08:05:50 -0600 (MDT)
Received: from weilbach (helo=localhost)
	by leo.uni-sw.gwdg.de with local-esmtp (Exim 3.16)
	id 159SKE-0002qV-00
	for parisc-linux@lists.parisc-linux.org; Mon, 11 Jun 2001 16:05:50 +0200
Date: Mon, 11 Jun 2001 16:05:50 +0200 (CEST)
From: Peter Weilbacher <weilbach@uni-sw.gwdg.de>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: [parisc-linux] Re: Kernel faults on boot
In-Reply-To: <3B24CE2E.77B5F5F6@esiee.fr>
Message-ID: <Pine.LNX.4.33.0106111559090.9668-100000@leo.uni-sw.gwdg.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 11 Jun 2001, Matthieu Delahaye wrote:

> Hum, could you check your Hardware clock before booting.
> I got this problem on a 742 box and when I set the hwclock
> to the right date and time (The clock was unset due to lack
> of battery), cron worked.

No, I have set it to approximately the right time, when I installed,
and it is only off by a few minutes. Didn't find a netdate or
ntpdate on the CD to do it better, and with all the boot problems I
didn't have time to compile it myself...

Peter.
