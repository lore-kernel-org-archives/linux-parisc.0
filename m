Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm3.tiscalinet.be [212.35.2.72])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4B1394829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 Jan 2003 16:11:50 -0700 (MST)
Date: Fri, 24 Jan 2003 12:02:25 +0100
Message-ID: <3E30242300000111@ocpmta8.freegates.net>
In-Reply-To: <20030121235716.GA2193@dsl2.external.hp.com>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] new gcc-default for hppa
Reply-To: "Joel Soete" <joel.soete@tiscali.be>
To: grundler@dsl2.external.hp.com
Cc: "Randolph Chung" <tausq@debian.org>,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

Hi Grant,
...
>  And since all of the
>TCP code and mid-level pty mgt is arch independent, I'm starting
>to believe this is a toolchain bug.
>
>Stephan Eranian had a good idea - replace .o's in the gcc 3.2
>built kernel tree with .o's built using gcc-3.0. Then maybe we
>can narrow down where the issue is.
>
Following this idea I do the following test:

on a b2k unstable debian install with toolchain pkg:

ii  gcc            3.2.2-0        The GNU C compiler.
ii  gcc-3.0        3.0.4-14       The GNU C compiler
ii  gcc-3.0-base   3.0.4-14       The GNU Compiler Collection (base package)
ii  gcc-3.2        3.2.2-0pre5    The GNU C compiler
ii  gcc-3.2-base   3.2.2-0pre5    The GNU Compiler Collection (base package)
ii  gcc-snapshot   20030118-1     A SNAPSHOT of the The GNU Compiler Collectio
ii  libc6          2.3.1-10       GNU C Library: Shared libraries and Timezone
ii  libc6-dev      2.3.1-10       GNU C Library: Development Libraries and
Hea
ii  binutils       2.13.90.0.16-1 The GNU assembler, linker and binary utiliti
ii  binutils-dev   2.13.90.0.16-1 The GNU binary utilities (BFD development
fi

I build first kernel-2.4.20-pa22 with default gcc (ie gcc-3.2); without surprise
it crashed on the first incomming ip connection.

I then 'make distclean', replaced gcc by gcc-3.0 into Makefile and rebuild
so the same sources with the same .config. The result is an operational kernel.

Trust me, in this test the only variable is gcc release. Does it help?

That said, always in the continuity of this idea, I also notice that ld is
used to build some kernel parts. Is it  possible (even manually just for
test) to use gcc in place of ld? (if yes, howto?)

hth,
    Joel


*********************************************
Vous surfez toujours avec une ligne classique ?
Faites des economies avec Tiscali Complete...
Plus d'info sur ... http://complete.tiscali.be
