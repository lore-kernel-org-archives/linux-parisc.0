From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils breaks hppa kernel build,
Date: Sat, 24 Sep 2005 21:27:22 -0400 (EDT)
Message-ID: <200509250127.j8P1RMGg002900__23306.6597291783$1416623924$gmane$org@hiauly1.hia.nrc.ca>
References: <20050924185439.GC7824@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: 329888@bugs.debian.org,
 parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050924185439.GC7824@colo.lackof.org> from "Grant Grundler" at
	Sep 24, 2005 12:54:39 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> binutils-2.15 has this in include/opcodes/hppa.h:
> { "fdc",        0x04001280, 0xfc003fdf, "cZx(s,b)", pa10, 0},
> { "fdc",        0x04001280, 0xfc003fdf, "cZx(b)", pa10, 0},
> { "fic",        0x04000280, 0xfc001fdf, "cZx(S,b)", pa10, 0},
> { "fic",        0x04000280, 0xfc001fdf, "cZx(b)", pa10, 0},

The last "fic" opcode entry is wrong.  It's using the wrong
instruction format, the mask is wrong, pa10 is wrong, etc.

> And the binutils_2.16.1cvs20050902 version has only:
> { "fdc",        0x04001280, 0xfc00ffdf, "cZx(b)", pa10, 0},
> { "fdc",        0x04001280, 0xfc003fdf, "cZx(s,b)", pa10, 0},
> { "fic",        0x04000280, 0xfc001fdf, "cZx(S,b)", pa10, 0},

Yes, I deleted the entry because there isn't implicit space
register selection for 'S' instructions.

> The order of the with 's' vs without 's' was switched and
> in the process dropped one "fic" line.

Changing the order of with 's' vs without 's' was intentional.
It generates better disassembly.  Give the new objdump a try
and you will see the difference.

> Can binutils maintainer/folks please just add it back
> in the new location?

We need a new pa20 format 24 entry.

> Is the fix obvious enough or is a patch necessary?

A patch is needed.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
