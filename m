From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] More testsuite info
Date: Mon, 21 May 2007 02:38:32 -0400
Message-ID: <5b2e36650705202338wa690426i956e716cebbd593d__45753.5695437857$1416624357$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>,
 "Carlos O'Donell" <carlos@systemhalted.org>,
 "LaMont Jones" <lamont@mmjgroup.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Heya Carlos, thought you might be interested in some stats:

Rebuilding ubuntu gcc-4.2 with the ubuntu glibc-2.5 that was build
with ubuntu gcc-4.2, I have three fewer failures in the gcc testsuite:

FAIL: gcc.c-torture/compile/20001226-1.c  -O3 -fomit-frame-pointer  (test for ex
cess errors)
WARNING: program timed out.
FAIL: gcc.c-torture/compile/20001226-1.c  -O3 -g  (test for excess errors)
WARNING: program timed out.
FAIL: gcc.c-torture/compile/20001226-1.c  -Os  (test for excess errors)

two fewer failures in libmudflap:
FAIL: libmudflap.cth/pass39-frag.c (-O2) (rerun 16) execution test
FAIL: libmudflap.cth/pass39-frag.c (-O2) (rerun 16) output pattern test

one fewer failure in libstdc++:
FAIL: thread/pthread5.cc execution test

but four additional ones:
WARNING: program timed out.
FAIL: thread/pthread1.cc execution test
WARNING: program timed out.
FAIL: thread/pthread3.cc execution test
WARNING: program timed out.
FAIL: tr1/2_general_utilities/memory/shared_ptr/thread/default_weaktoshared.cc e
xecution test
FAIL: tr1/2_general_utilities/memory/shared_ptr/thread/mutex_weaktoshared.cc exe
cution test

Still crawling towards the horizon ;)

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
