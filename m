Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id E3BA64837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 05:11:43 -0600 (MDT)
Date: Thu, 27 Sep 2001 13:11:37 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Jurij Smakov <jurij@lokmail.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 720 - some progress 
In-Reply-To: <200109270909.FAA26514@mail.lokmail.net>
Message-ID: <Pine.NEB.4.33.0109271231210.18542-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Jurij,

> Do I understand correctly, that you started seeng trap 11 only
> after applying your patch?

Nope, that was the same trap i got with the case 26 fallthrough, as well.
Apparently, ls etc doesn't have a problem with unaligned access, but it
must be something different. The PA7100LC documentation documents some
changes to the read access privileges to CR26 and CR27. Might that be the
cause for the trap 11?

The patch helps for the test case i provided, which really is an unaligned
access. The unpatched kernel doesn't trap at all with this program, but
the program will just hang.

Cheers,
Jochen
