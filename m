Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id A1401482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Apr 2002 10:08:19 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g38G8GFN020948
	for <parisc-linux@lists.parisc-linux.org>; Mon, 8 Apr 2002 12:08:17 -0400 (EDT)
Message-Id: <200204081608.g38G8FB4020947@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] GCC support for dwarf2
To: joel.soete@freebel.net
Date: Mon, 8 Apr 2002 12:08:15 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1018246520.3cb13578be656@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Apr 8, 2002 08:15:20 am
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

Joel,

Thanks for the offer to help.  The gcc 3.1 release criteria are here:
<http://gcc.gnu.org/gcc-3.1/criteria.html>.  There should be info on
how to build these.  There has been discussion of this on the gcc
list.

It would be useful to collect testresults for the listed applications.
It would be really great to compare the status of debian 3.0.4, gcc
cvs 3.1 (prerelease), and gcc cvs 3.2 (experimental).

I suspect that there will be problems with many of the tests.  There
is a integer*1 g77 bug that may affect lapack.  Qt may not build
because of an issue with long calls.  I think that I now understand
how to fix this but it may just go into 3.2.  3.2 has working dwarf2
exceptions and 3.1 doesn't.

> What could we do to help? Do we have to install snapshot gcc? Which programs
> would be tested?

You would need to install the cvs binutils and cvs gcc versions in some
convenient location for the testing.  I use ~/opt/gnu.  Instructions
on cvs access to gcc is on the gcc site <http://gcc.gnu.org/> and
similarly for binutils.  You probably need to define 

LD_RUN_PATH=/home/dave/opt/gnu/lib
LD_LIBRARY_PATH=/home/dave/opt/gnu/lib
LIBRARY_PATH=/home/dave/opt/gnu/lib

in your environment.

Even just building gcc can provide useful feedback.  I know it is very
easy to make mistakes due to the complexity of the package.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
