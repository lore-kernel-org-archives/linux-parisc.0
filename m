Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp8.xs4all.nl (smtp8.xs4all.nl [194.109.127.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id 25428482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Sep 2001 08:42:12 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp8.xs4all.nl (8.9.3/8.9.3) with ESMTP id QAA26295
	for <parisc-linux@lists.parisc-linux.org>; Sat, 1 Sep 2001 16:42:10 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Sat, 1 Sep 2001 15:50:06 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20010901155006.A4594@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] What's a "Trace/breakpoint trap" and why does he crash my system?
List-ID: <linux-parisc.vger.kernel.org>

Well, I can boot 2.4.9-pa13 just fine on my C200, but trying to compile
a kernel under that version never works, typing

make proper

in the source directory doesn't produce any output but

Trace/breakpoint error

after one second or so.

I realize this is a worthless bug-report, but where does that message
come from? The text is nowhere in the kernel-sources, so it must be
something else.

Greetings,
Jurriaan
-- 
HORROR FILM WISDOM:
1. When it seems that you've killed the monster, never check to see if
it's really dead.
GNU/Linux 2.4.9-ac5 SMP/ReiserFS 2x1402 bogomips load av: 0.14 0.12 0.04
