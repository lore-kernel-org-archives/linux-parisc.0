From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Wed, 6 Jul 2005 13:00:00 -0400 (EDT)
Message-ID: <200507061700.j66H01NH006241@hiauly1.hia.nrc.ca>
References: <42BAB5E10000403E@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42BAB5E10000403E@mail-2-bnl.tiscali.it> from "Joel Soete" at Jul
	6, 2005 06:40:32 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Ok I boot the same and grab recent gcc-4.1 src (about 6h gmt) and build it
> with build-tls-tools with following options:
> --enable-shared --with-system-zlib --disable-nls --enable-debug --host=hppa-linux
> --tar
> get=hppa-linux --disable-libmudflap --enable-languages=c,c++

Don't use 4.1 unless you want to help with fixing GCC bugs!

> My very bad error was to forget to save the System.map, so it's hard to say
> if the pim analyse is relevant:

objdump -d will tell you everything you need to know.

According to the grapevine, most of the current stability problems
are probably caused by not properly saving fpregs in all context switches.
The 32-bit port used to be built with -mdisable-fpregs but this was removed
when memcpy was made more efficient.  Note that disabling fpregs when
building the kernel isn't a complete solution as libgcc uses various
floating-point instructions which may or may not get linked into the
kernel (e.g., for integer multiplication).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
