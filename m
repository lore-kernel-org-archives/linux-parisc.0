Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62874484C
	for <parisc-linux@parisc-linux.org>; Tue, 26 Feb 2002 09:20:15 -0700 (MST)
Message-Id: <200202261620.g1QGK5Nu002375@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc (g++) problem
To: randolph@tausq.org
Date: Tue, 26 Feb 2002 11:20:05 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: jeremyd@apptechsys.com, parisc-linux@parisc-linux.org
In-Reply-To: <20020226043804.GA5069@tausq.org> from "Randolph Chung" at Feb 25, 2002 08:38:04 pm
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

> > Suggest trying the debian 3.1 prerelease build.  Search the list to find
> > how to get it.
> 
> something is broken in the debian 3.1 snapshot package,
> unfortunately....

No, the problem is 3.1 was built with a recent version of binutils
which supports --eh-frame-hdr.  This change also involved changing
the way libgcc and the shared version of libgcc were linked with
shared libraries.  Do you recall your report of a build failure of
3.1 linking libstdc++?  My trying to fix this problem lead to a
heated discussion on gcc-patches.  My fix was reverted, then further
problems arose, and a new patch affecting the linkage of libgcc
was installed yesterday.

> legolas[20:35] ~% /usr/lib/gcc-snapshot/bin/g++ -o foo foo.cc 
> /usr/bin/ld: unrecognized option '--eh-frame-hdr'
> /usr/bin/ld: use the --help option for usage information
> collect2: ld returned 1 exit status

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
