Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id B887B4837
	for <parisc-linux@lists.parisc-linux.org>; Wed, 26 Sep 2001 08:59:12 -0600 (MDT)
Date: Wed, 26 Sep 2001 16:59:02 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Jurij Smakov <jurij@lokmail.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] The 720/50 saga continues... 
In-Reply-To: <200109261447.KAA04593@mail.lokmail.net>
Message-ID: <Pine.NEB.4.33.0109261656110.14785-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Jurij,

> I am probably very naive :-), but shouldn't it be possible to figure out,
> whether or not this is an unaligned access trap by just looking at the
> offending instruction and the address it is referencing?

Maybe i'm naive, but wouldn't it be easier to check if the page being
addressed is in memory and if yes assume an assignment fault and if no
assume a pgae fault? IMHO, this would even fix the problem of having a
non-aligned access to a non-mapped address as the trap would first load
the address into memory than repeat the access, cause a second trap which
will be interpreted as a alignment trap the second time.

Cheers,
Jochen
