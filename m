Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.scram.de (mail.scram.de [195.226.127.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 97E3C4837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 05:15:24 -0600 (MDT)
Date: Thu, 27 Sep 2001 13:15:19 +0200 (CEST)
From: Jochen Friedrich <jochen@scram.de>
To: Jurij Smakov <jurij@lokmail.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] 720 - some progress 
In-Reply-To: <200109271003.GAA02353@mail.lokmail.net>
Message-ID: <Pine.NEB.4.33.0109271312510.18542-100000@www2.scram.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

Hi Jurij,

> And another (very weird) thing... I've manually decoded the instruction
> (036008A4), which produces the trap 11 (hopefully, correctly :-).
> It turns out to be an MFCTL instruction to load contents of control
> register 27 into a general register 4.

The CPU in the 720 will treat this as a priviledged instruction. The
changes "signal 18 -> signal 26, signal 27, signal 28" and "allow read
access to CR26 and CR27 for non-priviledged access" are documented as new
for the PA7100LC processor, so they are not available in the 720.

Another thing to emulate on the old 720/50 platform...

Cheers,
Jochen
