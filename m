Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id BA1D54840
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 13:01:01 -0600 (MDT)
Received: from hiauly1.hia.nrc.ca (localhost [127.0.0.1])
	by hiauly1.hia.nrc.ca (8.12.0.Beta16/8.12.0.Beta16) with ESMTP id g6EJ0x00021965
	for <parisc-linux@lists.parisc-linux.org>; Sun, 14 Jul 2002 15:01:00 -0400 (EDT)
Message-Id: <200207141900.g6EJ0xtO021964@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] compiling PINE under PARISC
To: stephan@itp.bg (Stephan Trajkoff)
Date: Sun, 14 Jul 2002 15:00:58 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020714162011.58440483E@dsl2.external.hp.com> from "Stephan Trajkoff" at Jul 14, 2002 07:21:42 pm
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

> cc    -g -DDEBUG   -DLNX -DSYSTYPE=\"LNX\" -DMOUSE -o pine addrbook.o 
> adrbkcmd.o adrbklib.o args.o bldaddr.o context.o filter.o folder.o 
> help.o helptext.o imap.o init.o mailcap.o mailcmd.o mailindx.o 
> mailpart.o mailview.o newmail.o other.o pine.o reply.o screen.o 
> send.o signals.o status.o strings.o takeaddr.o os.o 
> date.c ../pico/libpico.a ../c-client/c-client.a  -lncurses `cat ../c-
> client/LDFLAGS`
> /usr/bin/ld: other.o(.text 0x3f730): cannot reach 
> 000000d6_ClearScreen 0, recompile with -ffunction-sections

There are various ways to work around this problem.  You could
try

export CC="gcc -ffunction-sections"

If that doesn't work, you will have to edit BASECFLAGS for the
configuration that is being built in various Makefile's, adding
-ffunction-sections.  You can find the Makefile's with

find . -type f -print|xargs grep BASECFLAGS

Finally, you could use gcc 3.2 for the build.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
