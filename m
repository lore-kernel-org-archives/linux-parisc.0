Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.lokmail.net (MAIL.LOKMAIL.NET [209.48.2.38])
	by dsl2.external.hp.com (Postfix) with ESMTP id A661F482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  2 Oct 2001 02:13:28 -0600 (MDT)
Received: from mail.lokmail.net (localhost [127.0.0.1])
	by mail.lokmail.net (8.9.3/8.9.3) with ESMTP id EAA31275
	for <parisc-linux@lists.parisc-linux.org>; Tue, 2 Oct 2001 04:13:23 -0400
Message-Id: <200110020813.EAA31275@mail.lokmail.net>
From: Jurij Smakov <jurij@lokmail.net>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Date: Tue, 02 Oct 2001 04:13:23 -0400
Sender: jurij@mail.lokmail.net
Subject: [parisc-linux] Mount segfaults and stuff
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I get segfaults from "mount", when I try to mount a non-existent
device, like

># mount /dev/fd0 /floppy
Segmentation fault

The failure is reported to be in strncmp in glibc, but it looks
like it is just trying to dereference a null pointer, passed
from somewhere else (trap 15 with zero IOR). If someone is 
experiencing similar behaviour, I can look further into it.

Also, I've tried looking at todo list to find something to work on...
It seems rather outdated and some tasks in it seem to be already
completed (like unaligned trap handler, etc.). So, where should
I direct my efforts? What is the part of parisc-linux project, which
needs immediate attention? ;-).

Cheers,

Jurij.
