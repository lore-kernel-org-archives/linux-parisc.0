Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from brain.fop.ns.ca (u135n18.eastlink.ca [24.224.135.18])
	by dsl2.external.hp.com (Postfix) with ESMTP id 82C0B4840
	for <parisc-linux@parisc-linux.org>; Wed, 19 Nov 2003 06:21:38 -0700 (MST)
Date: Wed, 19 Nov 2003 09:21:31 -0400 (AST)
From: Steve Bromwich <lists@fop.ns.ca>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: RE: [parisc-linux] Processes stuck in D state on 715/100XC with
 2.4.22-pa17
In-Reply-To: <3FB265EC00003DBD@ocpmta3.freegates.net>
Message-ID: <Pine.LNX.4.58.0311190913310.1125@brain.fop.ns.ca>
References: <3FB265EC00003DBD@ocpmta3.freegates.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

> >Just to clarify, this is happening during operation, not bootup. Next time
> >it happens (probably tomorrow morning) I'll break on serial and try
> >piminfo

So much for that idea - I forgot I had magic sysrq on, so break just gave
me the usual sysrq options. I'll recompile without sysrq over the weekend
and see what happens, but in the meantime I've reverted to 2.4.18 to see
if I get the same problem, just to make sure it's not faulty hardware. I
checked ps, and all the processes in D state were ones that touch the
drive (eg, find, exim, apache).

I've got a J class at work that's not in production, so if I get time I'll
try it out with the same config (or at least, the closest I can get) just
to make sure it's not something obviously wonky in my config.

> May be if you can, run hp diag tools?

I don't have a CD in that machine - do you know if there's any netbootable
images I can use? I have an HPUX 11.0 CD set, so if there's something I
can pull off there I'll be good to go.

> (I have no clue about 715 model but well running 2.4.22 (and above) on various
> b180, b2k, c110, N4000 and i have never encounter such pb?)

Well, the frustrating thing is is that there's no debug output anywhere
that I can find that's showing anything obviously wrong. I had a skim
through lasi700.c/.h and couldn't see anything that'd help, do you know if
there's any debug/printks I can scatter anywhere to give me some pointers?

Cheers, Steve
