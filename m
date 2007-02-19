From: Guy Martin <gmsoft@gentoo.org>
Subject: [parisc-linux] Re: Glib testsuite under NPTL.
Date: Mon, 19 Feb 2007 20:15:29 +0100
Message-ID: <20070219201529.4862ab70.gmsoft__34546.6173057959$1416624306$gmane$org@gentoo.org>
References: <119aab440702181557v18e47baya3e582298f7282ae@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440702181557v18e47baya3e582298f7282ae@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Hi Carlos,

For the NPTL thing, I only built glibc after upgrading glibc so there is no chance I tested the wrong one.

I tested with glib-2.12.7 with the same setup as usual.

The tests that fail here are the following :

PASS: queue-test
GThread-ERROR **: file gthread-posix.c: line 356 (): error 'Cannot allocate memory' during 'pthread_create'
aborting...
/bin/sh: line 4:  5771 Aborted                 srcdir=. LIBCHARSET_ALIAS_DIR=../glib/libcharset MALLOC_CHECK_=2 MALLOC_PERTURB_=$((${RANDOM:-256} % 256)) ${dir}$tst


PASS: thread-test
GThread-ERROR **: file gthread-posix.c: line 356 (): error 'Cannot allocate memory' during 'pthread_create'
aborting...
/bin/sh: line 4:  6173 Aborted                 srcdir=. LIBCHARSET_ALIAS_DIR=../glib/libcharset MALLOC_CHECK_=2 MALLOC_PERTURB_=$((${RANDOM:-256} % 256)) ${dir}$tst



Let me know if you need more info.

  Guy




On Sun, 18 Feb 2007 18:57:15 -0500
"Carlos O'Donell" <carlos@systemhalted.org> wrote:

> Guy,
> 
> I think you may have mentioned that Glib under NPTL was showing more
> failures than with Linuxthreads. I ran the tests myself with the
> following results.
> 
> Linuxthreads:
> check-lt.log:FAIL: closures
> check-lt.log:FAIL: keyfile-test
> check-lt.log:FAIL: run-collate-tests.sh
> 
> NPTL:
> check-nptl.log:FAIL: keyfile-test
> check-nptl.log:FAIL: run-collate-tests.sh
> 
> NPTL fixes the closures failure.
> 
> The Glib testsuite tests the installed libglib, so beware that you
> have rebuild the library, install the library, and *then* run the
> tests.
> 
> Cheers,
> Carlos.


-- 
Guy Martin
Gentoo Linux - HPPA port lead

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
