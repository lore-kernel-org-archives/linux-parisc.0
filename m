Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0DEE2482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 May 2003 07:25:23 -0600 (MDT)
Message-Id: <200305211325.h4LDPLmV015249@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] last binutils-2.14.90.0.2-0.1[was-2.14.90.0.1] failled to build kernel
To: jsoe0708@tiscali.be (Joel Soete)
Date: Wed, 21 May 2003 09:25:20 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3EC7617000001BB5@ocpmta1.freegates.net> from "Joel Soete" at May 21, 2003 02:23:31 pm
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

> >I am now runing a kernel 2.4.20-pa35 + lkcd bruno's patch with gcc-3.2.
> >
> >In the mean time I made a distupgrade which mainly update binutils from
> 2.13.90.0.18-1.7
> >to 2.14.90.0.1-0.1 which make now failed the rebuild of the kernel:
> >[...]
> Still failed with binutils_2.14.90.0.2-0.1 :((
> 
> gcc -D__ASSEMBLY__ -traditional -D__KERNEL__ -I/usr/src/work/linux-2.4.21-rc2-pa35/include
>  -c -o real2.o real2.S
> real2.S: Assembler messages:
> real2.S:126: Error: too many positional arguments
> make[1]: *** [real2.o] Error 1

This probably is due to these changes:

2003-04-23  H.J. Lu <hjl@gnu.org>

        * app.c (do_scrub_chars): More checks for valid labels.

2003-04-22  H.J. Lu <hjl@gnu.org>

	* app.c (do_scrub_chars): Check for valid label.

	I reverted the relevant part of the above on the 2.14 branch.

2003-04-30  Alan Modra  <amodra@bigpond.net.au>

	* config/tc-hppa.c (hppa_symbol_chars): Revert 2003-04-28 change.
	* config/tc-hppa.h (tc_symbol_chars): Likewise.
	* config/tc-ppc.c (ppc_symbol_chars): Revert 2003-04-24 change.
	* config/tc-ppc.h (tc_symbol_chars): Likewise.
	* app.c (do_scrub_chars): Revert 2003-04-23 and 2003-04-22 changes.

These are still on the binutils trunk.  For the moment, I would advise
not using any binutils version which includes these changes.  While
the assembler probably will work ok with GCC, the semantics have
changed sufficiently that there may be problems with hand written
assembler files.

These were done nominally to improve the detection of labels on ia64.
However, the change to tc-hppa.c has affected the removal of extraneous
whitespace.  I think it also has affected the character set allowed to
be used for symbols.  If it has, I am going to ask for reversion of the
above changes.

Joel, could you send me offline a few lines from real2.S around line 126?

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
