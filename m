Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2BEB04830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jun 2003 11:12:39 -0600 (MDT)
Message-Id: <200306181712.h5IHCa4Z016566@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
To: jsoe0708@tiscali.be (Joel Soete)
Date: Wed, 18 Jun 2003 13:12:35 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3ED4C8B6000076B3@ocpmta1.freegates.net> from "Joel Soete" at Jun 18, 2003 06:38:55 pm
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

> It is well a stub table pb?

No, this is a gcc pb.  Please proceed with a PR.  I can see the
problem.  There isn't support for long floating-point branches
in the machine definition :(

I would suggest that the code being generated for this
function isn't going to be very good.  Whenever at function
exceeds 240KB in size, then GCC needs to generate long branches
for function calls and some internal branches.  These sequences
are much longer and less efficient.  You can tweak the parameters
of the GCC's inlining model and probably reduce the size of
the generated code.  The parameters are settable from the
command line and are documented in the manual, etc.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
