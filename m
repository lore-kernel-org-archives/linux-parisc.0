Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 14E644829
	for <parisc-linux@parisc-linux.org>; Sat,  1 Feb 2003 21:56:43 -0700 (MST)
Message-Id: <200302020456.h124ueYd025040@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Compiler switches
To: willy@debian.org (Matthew Wilcox)
Date: Sat, 1 Feb 2003 23:56:40 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20030202035920.F21040@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at Feb 2, 2003 03:59:20 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> -D__linux__ looks like it can go away.

Agreed.  This is defined for sure in 3.1/3.2 and later.

> -fno-strength-reduce has been there since before we moved to ELF -- over 3
> years.  Any bug this was working around has hopefully been long-squashed.
> I think we should eliminate this and submit PRs if it finds new holes.

I always wondered why this option was used.

> -mno-space-regs & -mfast-indirect-calls can also go away, I think.
> I can't imagine that we ever didn't have them as default on a gcc
> 3.0-based compiler.

These are still not the default but possibly they should be.

Actually, I can see that we can save a couple of instructions when
generating long indirect calls to a symbol reference when no space
registers is defined.

> Do we still need -ffunction-sections?  I'm inclined to leave it anyway
> to enable compilation with older toolchains.

Cross my fingers, but I believe that the distance problem for calls
is fixed 3.2.2.  However, if there really are objects with .text larger
than 240000 bytes, then you should probably still define -ffunction-sections.
When the total code bytes exceeds the above limit (PA 1.X), gcc switches
to long indirect calls.  These are horribly inefficient.  There are
better sequences but we need some new support in gas and ld to handle
the relocations and generate appropriate stubs.

For example, the following non-pic sequence works under hpux with the HP
assembler, but not linux or hpux with gas:

	ldil L'dest,%r1
	be R'dest(%sr4,%r1)

Long pic pc-relative and symbol difference sequences also don't work.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
