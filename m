Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id D61134829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 25 Jun 2003 15:52:56 -0600 (MDT)
Message-Id: <200306252152.h5PLqhWs008763@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] binutils ICE while building todays gcc HEAD on hppa-linux
To: doko@cs.tu-berlin.de (Matthias Klose)
Date: Wed, 25 Jun 2003 17:52:42 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, binutils@sources.redhat.com
In-Reply-To: <16122.5027.155918.686357@gargle.gargle.HOWL> from "Matthias Klose" at Jun 25, 2003 11:26:59 pm
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

Hi,

> ICE in binutils-2.14.90.0.4 building gcc HEAD 20030625, while linking
> the shared libstdc++ library:
> 
> [...]
> -Wl,-soname -Wl,libstdc++.so.6 -o .libs/libstdc++.so.6.0.0
> /usr/bin/ld: BFD 2.14.90.0.4 20030523 Debian GNU/Linux internal error, aborting at ../../bfd/elf32-hppa.c line 3864 in elf32_hppa_relocate_section

The error was introduced by this patch:

2003-06-23  Jakub Jelinek  <jakub@redhat.com>

        * method.c (thunk_labelno): New variable.
	(make_alias_for_thunk): New function.
	(use_thunk): Use it if defined ASM_OUTPUT_DEF.  Put the thunk
	into the same section as the function it is calling.
	Include gt-cp-method.h.
	* Make-lang.in (gt-cp-method.h): Depend on s-gtype.
	(cp/method.o): Depend on gt-cp-method.h.
	* config-lang.in (gtfiles): Add $(srcdir)/cp/method.c.

This patch changes the symbol used for the jump from a thunk from
a global symbol to a local symbol.  We have been using a function
descriptor for the jump on hppa-linux and hppa-hpux.  The GNU linker
dies when it hits a function descriptor with a relocation to a local
symbol in a linkonce section that is not output (i.e., we are trying
to generate a relocation for a symbol that no longer exists).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
