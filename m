Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3854A4830
	for <parisc-linux@lists.parisc-linux.org>; Wed, 18 Jun 2003 09:12:27 -0600 (MDT)
Message-Id: <200306181512.h5IFCOSE015736@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
To: jsoe0708@tiscali.be (Joel Soete)
Date: Wed, 18 Jun 2003 11:12:24 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3ED4C8B60000747E@ocpmta1.freegates.net> from "Joel Soete" at Jun 18, 2003 01:55:42 pm
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

> Shame on me: I forgot to test with different compression option.
> 
> I just do it and the problem doesn't occure any more without -O2 or with
> -O1?

The optimization level affects inlining and as a result the size of
functions.  There has been a lot of discussion on the gcc lists related
to problems with inlining with the new tree inliner in 3.3, particularly
in C++ code.  So, the problem should be looked at even if there is a
work around.  The first step is to determine whether this is a gcc or
binutils problem (i.e., we need to know if the size of the stub table
has overflowed or if gcc has miscalculated an offset).

It would be a big help if you would generate the preprocessed source
code using the exact command that fails except for changing `-c' to `-E',
and then submit it in a gcc bug report describing the failure.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
