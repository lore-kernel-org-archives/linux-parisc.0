From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] More testsuite info
Date: Mon, 21 May 2007 12:43:55 -0400 (EDT)
Message-ID: <200705211643.l4LGhtvv008432__2380.68155381388$1416624358$gmane$org@hiauly1.hia.nrc.ca>
References: <5b2e36650705202338wa690426i956e716cebbd593d@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: lamont@mmjgroup.com,
 parisc-linux@lists.parisc-linux.org
To: jbailey@raspberryginger.com (Jeff Bailey)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <5b2e36650705202338wa690426i956e716cebbd593d@mail.gmail.com> from
	"Jeff Bailey" at May 21, 2007 02:38:32 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Rebuilding ubuntu gcc-4.2 with the ubuntu glibc-2.5 that was build
> with ubuntu gcc-4.2, I have three fewer failures in the gcc testsuite:
> 
> FAIL: gcc.c-torture/compile/20001226-1.c  -O3 -fomit-frame-pointer  (test for ex
> cess errors)
> WARNING: program timed out.
> FAIL: gcc.c-torture/compile/20001226-1.c  -O3 -g  (test for excess errors)
> WARNING: program timed out.
> FAIL: gcc.c-torture/compile/20001226-1.c  -Os  (test for excess errors)

This is a known issue and a GCC PR.  Essentially, GCC has gotten
slower over the years and this test fails on slow machines.  One
factor is the checking that's done prior to release.  You can disable
this with the configure option "--disable-checking".

> two fewer failures in libmudflap:
> FAIL: libmudflap.cth/pass39-frag.c (-O2) (rerun 16) execution test
> FAIL: libmudflap.cth/pass39-frag.c (-O2) (rerun 16) output pattern test

These were probably timeouts.  I don't see any libmudflap fails with
gcc-4.2 and linuxthreads.  If you have failures that aren't timeouts,
they need investigation.

> one fewer failure in libstdc++:
> FAIL: thread/pthread5.cc execution test
> 
> but four additional ones:
> WARNING: program timed out.
> FAIL: thread/pthread1.cc execution test
> WARNING: program timed out.
> FAIL: thread/pthread3.cc execution test
> WARNING: program timed out.
> FAIL: tr1/2_general_utilities/memory/shared_ptr/thread/default_weaktoshared.cc e
> xecution test
> FAIL: tr1/2_general_utilities/memory/shared_ptr/thread/mutex_weaktoshared.cc exe
> cution test

These don't fail with linuxthreads.  If mutex_weaktoshared didn't timeout,
then there's an implementation problem with threads (e.g., bug reported
by Aurelien).

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
