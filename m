Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp1.xs4all.nl (smtp1.xs4all.nl [194.109.127.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09E49482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 22:34:04 -0600 (MDT)
Received: from rivierenland.xs4all.nl (rivierenland.xs4all.nl [194.109.14.47])
	by smtp1.xs4all.nl (8.9.3/8.9.3) with ESMTP id GAA02750
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Sep 2001 06:34:01 +0200 (CEST)
From: thunder7@xs4all.nl
Date: Tue, 18 Sep 2001 21:06:28 +0200
To: Albert Strasheim <fullung@ilink.nis.za>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nmap -O -> kernel panic on 712
Message-ID: <20010918210628.A10837@middle.of.nowhere>
Reply-To: thunder7@xs4all.nl
References: <20010917165501.B17483@gollum.intranet.nimag.net> <20010917203312.A6109@middle.of.nowhere> <20010918002427.C17483@gollum.intranet.nimag.net> <20010918073855.A11627@middle.of.nowhere> <20010918123829.A3082@dogbert.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010918123829.A3082@dogbert.localdomain>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 18, 2001 at 12:38:29PM +0200, Albert Strasheim wrote:
> Hello,
> 
> I'm pretty new to the whole PA-RISC Linux effort, so I would appreciate
> it if someone could explain to me (and perhaps to other newbies), what
> these unaligned access traps are, and what needs to be added to traps.c
> (or possibly elsewhere) to get things working properly?
> 
AFAIK, an unaligned trap is a process (or the kernel) that tries to
access memory on a location that is not 32-bit aligned. 

Supposedly, there should be code that determines what the process was
trying to do, gets the information on a 32-bit aligned address, modifies
the information to the form the process wanted it in, then returns to
the process.

All of this requires assembly and some tricks with interrupts etc, which
doesn't make it a project for beginners (well, not beginners with my
level of knowledge and determination :-) ).

there is something called arch/parisc/kernel/unaligned.c, but that
doesn't seem to be the whole story.

Good luck,
Jurriaan
-- 
You have no feelings for me, but you do have feelings against me.
	Neelix - Startrek Voyager
GNU/Linux 2.4.9-ac10 SMP/ReiserFS 2x1402 bogomips load av: 0.08 0.04 0.01
