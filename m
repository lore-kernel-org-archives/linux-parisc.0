Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.cs.tu-berlin.de (mail.cs.tu-berlin.de [130.149.17.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2F2EB482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Jan 2002 15:52:42 -0700 (MST)
From: Matthias Klose <doko@cs.tu-berlin.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-ID: <15445.54753.489018.115701@gargle.gargle.HOWL>
Date: Mon, 28 Jan 2002 23:51:13 +0100
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, chet@po.cwru.edu,
	"John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] FYI - gcc 3.1 news
In-Reply-To: <20020128200820.61546482A@dsl2.external.hp.com>
References: <20020128200820.61546482A@dsl2.external.hp.com>
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

Grant Grundler writes:
> 
> Hi all,
> Some good news from gcc-hppa maintainer.
> 
> If anyone has a clue about the malloc issues...it would be
> interesting to get fixed.

this is bash. see http://bugs.debian.org/130051, however I am unable
to trigger this myself. One thing that could be tried: configure bash
--without-bash-malloc

	Matthias

> 
> enjoy!
> grant
> 
> ------- Forwarded Message
> 
> Subject: Re: gcc-3.1 bootstrap (keys)
> Date: Mon, 28 Jan 2002 12:45:09 -0500 (EST)
> From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
> 
> The keys work.  I did quite a bit of work on the weekend and managed
> to gcc-3.1 to boot on the machine.  I posted the testresults here:
> 
> <http://gcc.gnu.org/ml/gcc-testresults/2002-01/msg00545.html>.  The
> g77 and objc results are excellent.  The gcc results are not too bad.
> I think many of the failures there are due to the linker not providing
> the correct stub for indirect calls involving doubles.  There is clearly
> a problem involving unwinding/exception handling affecting the g++
> results.  I had to rewrite the frame note code that Alan Modra added
> to get a successful build.
> 
> I have observed one problem affecting the system that seems to occur
> in g++ compilations which typically need a lot of memory allocated:
> 
> /home/dave/gcc-3.1/objdir/gcc/xgcc -B/home/dave/gcc-3.1/objdir/gcc/ -nostdinc++
> - -L/home/dave/gcc-3.1/objdir/hppa-linux/libstdc++-v3/src -L/home/dave/gcc-3.1/obj
> dir/hppa-linux/libstdc++-v3/src/.libs -B/home/dave/opt/gnu/hppa-linux/bin/ -B/ho
> me/dave/opt/gnu/hppa-linux/lib/ -isystem /home/dave/opt/gnu/hppa-linux/include -
> I../../../../gcc/libstdc++-v3/../gcc -I../../../../gcc/libstdc++-v3/../include -
> I/home/dave/gcc-3.1/objdir/hppa-linux/libstdc++-v3/include/hppa-linux -I/home/da
> ve/gcc-3.1/objdir/hppa-linux/libstdc++-v3/include -I../../../../gcc/libstdc++-v3
> /libsupc++ -g -O2 -D_GNU_SOURCE -fno-implicit-templates -Wall -Wno-format -W -Ww
> rite-strings -Winline -fdiagnostics-show-location=once -ffunction-sections -fdat
> a-sections -g -c ../../../../gcc/libstdc++-v3/libsupc++/pure.cc  -fPIC -DPIC -o
> pure.o
> 
> malloc: /build/buildd/bash-2.05a/dispose_cmd.c:224: assertion botched
> free: called with unallocated block argument
> Stopping myself...make[4]: *** [pure.lo] Aborted
> 
> I don't know if this is a problem with bash, malloc or sbrk.  Usually,
> the compilation will succeed if I just restart it.
> 
> Dave
> - -- 
> J. David Anglin                                  dave.anglin@nrc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
> 
> ------- End of Forwarded Message
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
