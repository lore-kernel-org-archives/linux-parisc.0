Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from davisson.uni2.net (davisson.uni2.net [195.82.195.104])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA840483E
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Sep 2001 19:55:57 -0600 (MDT)
Received: from psy.bronderslev.dk (IDENT:postfix@p303-177.ppp.get2net.dk [195.82.210.177])
	by davisson.uni2.net (8.11.0/8.11.0) with ESMTP id f8D1ttJ10028
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Sep 2001 03:55:55 +0200
Received: from localhost (localhost [127.0.0.1])
	by psy.bronderslev.dk (Postfix) with ESMTP id 8CC4DA590
	for <parisc-linux@lists.parisc-linux.org>; Thu, 13 Sep 2001 00:14:48 +0200 (CEST)
Date: Thu, 13 Sep 2001 00:14:48 +0200 (CEST)
From: Bent Wagner <psy@get2net.dk>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <Pine.LNX.4.21.0109130004150.1019-100000@psy.bronderslev.dk>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Subject: [parisc-linux] keyboard patch ok on 725-100
List-ID: <linux-parisc.vger.kernel.org>

>To: marteaut@esiee.fr, rhirst@linuxcare.com, willy@debian.org
>Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
>From: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
>Date: Wed, 5 Sep 2001 15:01:08 +0200
>Subject: [parisc-linux] Thomas Marteau kbd patch adapted.
>
>--0__=C1256ABE0044855E8f9e8a93df938690918cC1256ABE0044855E
>Content-type: text/plain; charset=us-ascii
>
>Dear all,
>
>I just adapt the patch keyboard of Thomas taking account of kernel
>update, reports of experiences of Richard.
>I can only test it against 2.4.9-pa14 (cvs update) and seems to work as
>well as with 712 as with b180 model
>(unplug, replug: ok with hp kbd; Caps lock do not hang the "system")
>
>In the hope to be helpful,
>     Joel


I have tested the patch on a 725-100 using a 2.4.9 -pa17 kernel, and
it really made my day.

First time i have used the keyboard since i installed linux on it
0.5, i think, was the first.

Glad i got that terminal with my MicroVax :-)

Now i just need to get that EISA 100VG  netcard running.

Greetings

Bent Wagner
psy@get2net.dk
