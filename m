Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2ABE0483A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Jan 2003 10:44:36 -0700 (MST)
Message-Id: <200301251744.h0PHiWGk001089@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] new gcc-default for hppa
To: joel.soete@tiscali.be (Joel Soete)
Date: Sat, 25 Jan 2003 12:44:32 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
In-Reply-To: <3E32D7C0.9020703@tiscali.be> from "Joel Soete" at Jan 25, 2003 06:30:24 pm
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

> My confusion came from Helge Deller mail:
> <http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/018970.html>
> 
> But he spook about g++ (which I presume is different of gcc)?

No, it also uses ld.  However, its defaults with respect to libgcc linking
and exception support differ (ie, it sets defaults suitable to C++).  You
can link C++ code using gcc if you provide the correct options.  The
libtool package now uses gcc for linking as its options are more standardized
than those for ld.  I should note that it isn't possible to link g++ and
some gcc code directly with ld unless the system doesn't require collect2.
Collect2 is used to determine and link in code needed for the running of
initializers and finalizers.  The gcc/g++ drivers run collect2, and it
runs ld.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
