Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25E5C4837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 06:23:14 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id IAA32108
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 08:23:09 -0400
Message-Id: <200109271223.IAA32108@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720 - some progress 
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Thu, 27 Sep 2001 08:23:09 -0400
Sender: jurij@mail.lokmail.net
List-ID: <linux-parisc.vger.kernel.org>

> The CPU in the 720 will treat this as a priviledged instruction. The
> changes "signal 18 -> signal 26, signal 27, signal 28" and "allow read
> access to CR26 and CR27 for non-priviledged access" are documented as new
> for the PA7100LC processor, so they are not available in the 720.
> 
> Another thing to emulate on the old 720/50 platform...
> 
> Cheers,
> Jochen

It does not seem so complicated... Even with my rudimentary C programming
skills :-). I'll try to put something together. Is there a way to check
if we are running on a 720?

Jurij.
