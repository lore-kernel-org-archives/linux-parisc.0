Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from ns.zrt.nl (ns.zrt.nl [212.153.94.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2209A482B
	for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 01:19:01 -0600 (MDT)
Received: (from fwmaster@localhost) by ns.zrt.nl (8.9.1a/8.6.12) id JAA02453 for <parisc-linux@parisc-linux.org>; Wed, 26 Sep 2001 09:18:59 +0200 (MET DST)
Message-Id: <sbb19d1e.060@ms-zrt1>
Date: Wed, 26 Sep 2001 08:56:08 +0200
From: "Jurriaan Kalkman" <Jurriaan.Kalkman@zrt.nl>
To: <parisc-linux@parisc-linux.org>, <nick@snowman.net>
Subject: Betr.: [parisc-linux] HP C180
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

>My c180 is now happily booting (current CVS kernel), however whenever I
>try to ls some dirs (no all, this example is from /usr/bin) I get errors
>along these lines
>ls: memory exhausted
>init-2.04# ls ap*
>Swap cache: add 0, delete 0, find 0/0
>Free swap:            0kB

The 2.4.9 kernel really needs swap, or so I've read on the linux-kernel =
mailing list.
You should add some swap. 2* [size of main memory] is a safe amount.
It's considered a bug, but it needs swap even if there is free memory.....

Good luck,
Jurriaan
