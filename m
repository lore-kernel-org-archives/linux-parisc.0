From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: FUNCTION_TRACER and parisc kernel
Date: Sat, 7 Feb 2009 13:32:01 -0500 (EST)
Message-ID: <20090207183202.17B8B4E9F@hiauly1.hia.nrc.ca>
References: <20090207032523.06F704EF8@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: deller@gmx.de, carlos@systemhalted.org,
	linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090207032523.06F704EF8@hiauly1.hia.nrc.ca> from "John David Anglin" at Feb 6, 2009 10:25:22 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > So it seems that this statement in arch/parisc/Makefile:
> > # Without this, "ld -r" results in .text sections that are too big
> > # (> 0x40000) for branches to reach stubs.

This needs some debugging.  hppaelf_after_parse in ld/emultempl/hppaelf.em
is supposed to stop the 32-bit linker from merging .text sections on a
relocatable link.

GCC does not generate .text before each new function.  Even if it did,
gas currently merges all functions to a single .text section.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
