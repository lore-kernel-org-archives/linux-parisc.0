Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 282E24842
	for <parisc-linux@lists.parisc-linux.org>; Sat,  1 Mar 2003 22:40:44 -0700 (MST)
Message-Id: <200303020540.h225eeif006180@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: gcc-3.2 -> gcc-3.3 transition on hppa
To: tausq@debian.org
Date: Sun, 2 Mar 2003 00:40:40 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: doko@cs.tu-berlin.de, debian-hppa@lists.debian.org,
	debian-gcc@lists.debian.org, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030302045936.GS11363@tausq.org> from "Randolph Chung" at Mar 1, 2003 08:59:36 pm
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

> In reference to a message from Matthias Klose, dated Mar 01:
> > Matthias Klose writes:
> > > AFAIK the transition from 3.2 to 3.3 requires recompilation of C++
> > > code due to the changed exception handling (now DWARF2 based). As
> > > libstdc++ in 3.2 and 3.2 have the same soname, how to handle it?

Possibly, this issue should be broached with the libstdc++ maintainers.
In my testing, I have moved to installing each gcc version in its own
directory.

I should note again that 3.3 has a ABI change in the passing of small
structures.  It also contains a fix for function pointer comparison.
As glibc does function comparison in a number of routines, it needs
recompilation with 3.3 to work correctly.  Then, I believe gcc needs
to be rebuilt as libstdc++ depends on the thread implementation.  The
last glibc linuxthread code that I downloaded was still broken.  I know
Carlos has a patch in the works.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
