Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp8.xs4all.nl (smtp8.xs4all.nl [194.109.127.134])
	by dsl2.external.hp.com (Postfix) with ESMTP id D877D482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 05:09:12 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp8.xs4all.nl (8.9.3/8.9.3) with ESMTP id NAA01625
	for <parisc-linux@lists.parisc-linux.org>; Thu, 30 Aug 2001 13:09:10 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Thu, 30 Aug 2001 13:07:22 +0200
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [newbie] gcc/glibc problems
Message-ID: <20010830130722.A20475@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010830073255.A9044@middle.of.nowhere> <20010830065907.H13438@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010830065907.H13438@parcelfarce.linux.theplanet.co.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Aug 30, 2001 at 06:59:07AM +0100, Matthew Wilcox wrote:
> On Thu, Aug 30, 2001 at 07:32:55AM +0200, thunder7@xs4all.nl wrote:
> > In file included from test.c:1:
> > /usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:37:23: features.h: No such file or directory
> > In file included from /usr/lib/gcc-lib/hppa-linux/3.0.2/include/stdio.h:43,
> 
> do you have libc6-dev installed?
> 
I do now, and I can compile (Whoohoo!) but it seems to have some
side-effects:

pa8200:/usr/bin# find
Inconsistency detected by ld.so: dynamic-link.h: 62: elf_get_dynamic_info: Assertion `! "bad dynamic tag"' failed!
pa8200:/usr/bin# ldd find
Inconsistency detected by ld.so: dynamic-link.h: 62: elf_get_dynamic_info: Assertion `! "bad dynamic tag"' failed!
Inconsistency detected by ld.so: dynamic-link.h: 62: elf_get_dynamic_info: Assertion `! "bad dynamic tag"' failed!
ldd: /lib/ld.so.1 exited with unknown exit code (127)
pa8200:/usr/bin# ls -l /lib/ld.so*
lrwxrwxrwx    1 root     root           11 Mar 26  2024 /lib/ld.so.1 -> ld-2.2.3.so
pa8200:/usr/bin# ls -l /lib/ld-2.2.3.so
-rwxr-xr-x    1 root     root       117924 Jul 30 16:45 /lib/ld-2.2.3.so

I am sure find was working before. I'll start reading up on apt-get/dpkg
(what package does this file belong to? Forceful upgrading? etc.)

Jurriaan
-- 
I never think, sir. Didn't get a degree.
Chief Inspector Morse
GNU/Linux 2.4.9-ac2 SMP/ReiserFS 2x1402 bogomips load av: 0.08 0.02 0.03
