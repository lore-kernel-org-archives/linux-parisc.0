Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4A5D483B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Apr 2002 11:24:23 -0600 (MDT)
Message-Id: <200204231724.g3NHOEN7029591@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] gcc-3.2 experimental debs
To: joel.soete@freebel.net
Date: Tue, 23 Apr 2002 13:24:13 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, willy@debian.org, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <1019582168.3cc596d87ba8a@webmail.tiscalinet.be> from "joel.soete@freebel.net" at Apr 23, 2002 07:16:08 pm
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

> I would also to do so. But I had the bad idea to co the last gcc release
> (yesterday and today) to rebuild the toolchain.
> But gcc build seems to be broken (step 4.2 of your procedure):
> 
> gcc -c -DIN_GCC    -g -O2 -W -Wall -Wwrite-strings -Wstrict-prototypes
> -Wmissing-prototypes   -DHAVE_CONFIG_H    -I. -Ijava
> -I/GNU-Dev/parisc-linux/src/gcc/gcc -I/GNU-Dev/parisc-linux/src/gcc/gcc/java
> -I/GNU-Dev/parisc-linux/src/gcc/gcc/config
> -I/GNU-Dev/parisc-linux/src/gcc/gcc/../include
> /GNU-Dev/parisc-linux/src/gcc/gcc/java/parse.c -o java/parse.o
> /tmp/ccj2Nlrs.s: Assembler messages:
> /tmp/ccj2Nlrs.s:148746: Error: Field out of range [-262144..262143] (-263392).
> make[1]: *** [java/parse.o] Error 1
> make[1]: Leaving directory `/GNU-Dev/parisc-linux/build/gcc/gcc'
> make: *** [all-gcc] Error 2
> 
> Last week co did not try to build any java.
> Any idea or work-around?

"make bootstrap".

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
