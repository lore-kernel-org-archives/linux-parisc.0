Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 00F4C4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 24 Jan 2003 21:23:55 -0700 (MST)
Message-Id: <200301250423.h0P4Noxq000220@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] new gcc-default for hppa
To: joel.soete@tiscali.be
Date: Fri, 24 Jan 2003 23:23:50 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
In-Reply-To: <3E30242300000111@ocpmta8.freegates.net> from "Joel Soete" at Jan 24, 2003 12:02:25 pm
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

> That said, always in the continuity of this idea, I also notice that ld is
> used to build some kernel parts. Is it  possible (even manually just for
> test) to use gcc in place of ld? (if yes, howto?)

When linking, gcc is just a front end for ld.  You can see what happens
with "-v", "-Wl,-v", "-Wl,-debug", etc.  You can pass any option that
you want to ld using the gcc "-Wl" option.  Gcc doesn't doing any linking
itself.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
