Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from goliath (cable-207-5-237-24.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id DC170482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jul 2001 21:53:10 -0600 (MDT)
Received: from cable-207-5-237-24.anchorageak.net (cable-207-5-237-24.anchorageak.net [24.237.5.207])
	by goliath (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id TAA01000
	for <parisc-linux@lists.parisc-linux.org>; Sun, 15 Jul 2001 19:50:39 -0800
Date: Sun, 15 Jul 2001 19:50:39 -0800 (AKDT)
From: Tom <tom@alaskatech.org>
To: PA-RISC Linux List <parisc-linux@lists.parisc-linux.org>
Message-ID: <Pine.LNX.4.33.0107151938330.529-100000@goliath>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] 715/100 no longer boots into console?
List-ID: <linux-parisc.vger.kernel.org>

So I upgraded from the 0.9 to the latest 0.91. Exerything worked nicely,
no errors, except now I get no login on the console. Looking over the boot
messages there's no errors, but there is two lines saying the FB is alive
and well and the console is switching to STI FB color console. Last
messages is after "INIT: switching to runlevel 2" and all the
"starting:..." messages (the last one is cron starting).

I *had* all the common pitfalls saved, until I had a drive crash in the
mail server and nuke all the saved mail :-(. So, if someone can tell me
the simple solution to this I'd appreciate it... If needed the output of
dmesg is at http://www.alaskatech.org/stuff/715boot.txt

Thanks!
