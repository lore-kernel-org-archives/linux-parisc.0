Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 02296482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Oct 2001 02:07:04 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id EAA30339
	for <parisc-linux@lists.parisc-linux.org>; Tue, 2 Oct 2001 04:06:44 -0400
Message-Id: <200110020806.EAA30339@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] woody install on 720/50 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Tue, 02 Oct 2001 04:06:44 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

> After applying Jurij's latest patch, and creating a new Debian bootdisk
> lifimage with it, I booted it up and tried the Debian install again.
> 
> I tried a CD-ROM install first, but the installer refused to mount my
> CD-ROM for some reason, even though it was detected as a possible device
> to boot from.
> 
> Next I tried a network install using my i386 box (with co-ax network
> card to connect to the 720) as a web server. According to the
> access.log, the drivers.tgz and rescue.bin very retrieved without
> problems. When it tried to extract the rescue.bin, it croaked with a 
> message saying "Bad address." When I tried to retrieve the images a
> second time, the installer croaked.
> 
> The box still responds to pings, but not much else.
> 
> Any ideas on the "Bad address" problem?
> 
> Regards,
> 
> Albert

Hi!

Would You consider first installing with some kernel, that works for sure
and then trying the one with the proposed patch? Otherwise, there are
too many unknowns in the equation :-). I know, the patched kernel compiles,
but since I don't have access to a 720 machine, I could not test it.

Cheers,

Jurij.










---------------------------------------------------------
Get Free Private Encrypted Email https://mail.lokmail.net
        Switch to Name.Space: http://namespace.org/switch
