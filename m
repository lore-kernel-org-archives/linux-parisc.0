Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id A5283482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Oct 2001 03:12:13 -0600 (MDT)
Sender: marteaut@esiee.fr
Message-ID: <3BB98467.C112B287@esiee.fr>
Date: Tue, 02 Oct 2001 11:09:59 +0200
From: Thomas Marteau <marteaut@esiee.fr>
MIME-Version: 1.0
To: Jurij Smakov <jurij@lokmail.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Mount segfaults and stuff
References: <200110020813.EAA31275@mail.lokmail.net>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

Jurij Smakov wrote:
> 
> Hi!
> 
> I get segfaults from "mount", when I try to mount a non-existent
> device, like
> 
> ># mount /dev/fd0 /floppy
> Segmentation fault

On my B132L, I have the same behaviour.
> 
> Also, I've tried looking at todo list to find something to work on...
> It seems rather outdated and some tasks in it seem to be already
> completed (like unaligned trap handler, etc.). So, where should
> I direct my efforts? What is the part of parisc-linux project, which
> needs immediate attention? ;-).
> 
I do not know what the developers want but I can say that driver
improvement could be good.
Anyway, if you want to find something to do, the best place to dig is
http://bugs.parisc-linux.org/ :)

Regards, Thomas.
ESIEE Team
