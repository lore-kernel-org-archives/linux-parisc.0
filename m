Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7F265482C
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 02:22:14 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id EAA25756
	for <parisc-linux@lists.parisc-linux.org>; Mon, 8 Oct 2001 04:22:09 -0400
Message-Id: <200110080822.EAA25756@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Mon, 08 Oct 2001 04:22:09 -0400
Sender: jurij@mail.lokmail.net
Subject: [parisc-linux] Catching interrupt from power switch
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I am obsessed with idea of catching interrupt from power switch
(it should be possible, according to Lasi docs) and making a
clean shutdown. I thought, that when power button is set to "off", 
trap 2 (power failure interruption) will be generated. Strangely
enough, it didn't. What's wrong? The I-bit in the PSW, controlling
the masking/unmasking of this (and some other interruptions) seems
to be set, so the interruption is unmasked. Anyone has any ideas?

Cheers,

Jurij
