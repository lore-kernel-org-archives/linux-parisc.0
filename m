Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.alcatel.at (atusks01.alcatel.at [212.183.9.130])
	by dsl2.external.hp.com (Postfix) with ESMTP id CC9294A19
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Mar 2001 03:38:39 -0700 (MST)
Received: from alcatel.at (atusel33.aut.alcatel.at [146.112.129.215])
	by  mail.alcatel.at (8.9.3/8.9.3/1.21 01/27/01 21:43:09) with ESMTP id LAA20027
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Mar 2001 11:38:35 +0100 (MET)
Sender: christoph.plattner@alcatel.at
Message-ID: <3AB9D629.DA9A14FC@alcatel.at>
Date: Thu, 22 Mar 2001 11:38:33 +0100
From: Christoph Plattner <christoph.plattner@alcatel.at>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Problem with FS of ESIEE on 720 !
List-ID: <linux-parisc.vger.kernel.org>

Hello PA-RISCers !

I have tried the current and the last ESIEE file system,
but I have problems with both. I used my own kernel,
running with the palinux-0.5, but the ESIEE always hangs.
If I do not change the /dev/console, I get the warning...
(of course, I have not compiled in the STI). So tried
to set the `mknod console c 5 1' and I also tried the
"hack" doing a link to `ttyS0'. In both cases `init'
gives no welcome message (version, etc...) and the machine
hangs !

Now I will instrument the kernel with `printk's to see,
if he can start something,.....

What's the topic with the TERM variable ??
Have I set it to a special value ???
Can that be the reason ???

Cheers
	Christoph P.


-----------------------------------------------------------------
private:        christoph.plattner@dot.at
company:        christoph.plattner@alcatel.at
