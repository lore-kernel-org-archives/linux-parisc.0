Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09A4E4829
	for <parisc-linux@lists.parisc-linux.org>; Mon,  6 Jan 2003 14:34:12 -0700 (MST)
Message-Id: <200301062134.h06LY3kO021003@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] B1000 Debian 3.0r1 High-Priority Machine Check
To: varenet@esiee.fr (Thibaut VARENE)
Date: Mon, 6 Jan 2003 16:34:03 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: stevec@bullseye.com, parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030106222258.2eec3889.varenet@esiee.fr> from "Thibaut VARENE" at Jan 6, 2003 10:22:58 pm
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

> > Now I've a different problem and not sure where to turn.  Whenever I
> > compile and run a program that "throw"s an exception, I get "Memory
> > fault".  I can't figure out where to report this problem.  The PARISC
> > Linux people or the GCC people?

You need to build/obtain either the 3.3 or main branch of GCC to obtain
working C++ exception support.  The dwarf2 eh support in debian 3.0.4 and
the GCC 3.2 branch was in development when that code was released and
doesn't work.  I am assuming you mean exception in the C++ sense.

> I'd say PARISC for two reasons:
> - first, this is quite likely to be a kernel problem, and IIRC exception related stuff is worked on currently,
> - secondly, because some of GCC folks are also PARISC m-l readers ;)

The above was not a kernel problem.  It was mainly a problem in creating
the correct eh frame data.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
