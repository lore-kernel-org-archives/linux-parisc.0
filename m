Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail-ob03.one.net.au (mail-ob03.one.net.au [61.12.0.163])
	by dsl2.external.hp.com (Postfix) with ESMTP id B54A0482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Apr 2001 01:17:59 -0600 (MDT)
Received: Received: [from peewee (async88-bri-isp-9.nas.one.net.au [61.12.65.89])
	by mail-ob03.one.net.au  with SMTP id f3A7Hk312945
	for <parisc-linux@lists.parisc-linux.org>; Tue, 10 Apr 2001 17:17:56 +1000 (EST)]
Message-ID: <009401c0c18e$fb102530$1401a8c0@peewee>
From: "Matthew van de Werken" <mvdw73@one.net.au>
To: <parisc-linux@lists.parisc-linux.org>
Date: Tue, 10 Apr 2001 17:22:09 +1000
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Subject: [parisc-linux] Status of support for (E)ISA bus
List-ID: <linux-parisc.vger.kernel.org>

Hi folks:

What's the status of the support for the (E)ISA bus on the hppa port of
Linux, specifically to support the 735/99 workstation? I'd like to use an
ISA card which has linux/x86 support, and have noted that (apparently) the
EISA bus has support on my machine, but what does this mean with regards to
specific cards? If someone can give me a definite answer on this I'd really
appreciate it, as I'm sure others reading would also.

Does the fact that the EISA bus is supported mean that *any* (read: most)
card(s) with x86-linux drivers will work (assuming a driver recompile)? Or
is this a naive assumption?

Whether or not I use hppa-linux depends more or less on the answer to this
question.

Regards,
Matt van de Werken.
