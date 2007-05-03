From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: Re: [parisc-linux] unaligned access using bash on glibc 2.5
Date: Thu, 3 May 2007 08:52:59 -0400
Message-ID: <5b2e36650705030552l100c7ecayfc848248aac679c9__943.750449414615$1416624348$gmane$org@mail.gmail.com>
References: <119aab440705021021i35132820we4338ae3ca1862cd@mail.gmail.com>
	<200705021815.l42IFqYS018776@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org,
 aurelien@aurel32.net
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200705021815.l42IFqYS018776@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

To work around the gcc pic/tls bug, I'm using this patch:
http://people.ubuntu.com/~jbailey/hppa-caller-save-pic-tls.dpatch

I thought it would be interesting to compare glibc testsuite failures:
No longer fails:
tst-memstream2
tst-wmemstream2
bug-atexit3-lib
tst-timer5
tst-cpuclock2

New failures:
tststatic
tststatic2
tst-conf18
tst-oddstacklimit (segfaults)
tst-mqueue3
tst-time5
tst-tls9-static

Full lists below:

Build with gcc without the patch.
test-float
test-double
test-idouble
tst-memstream2
tst-wmemstream2
bug-atexit3-lib
tst-cond16
tst-cond17
tst-cancel24
tst-cancelx4
tst-cancelx5
tst-cancelx8
tst-cancelx9
tst-cancelx10
tst-cancelx11
tst-cancelx12
tst-cancelx13
tst-cancelx14
tst-cancelx15
tst-cancelx16
tst-cancelx17
tst-cancelx18
tst-cancelx20
tst-cancelx21
tst-cleanupx0
tst-cleanupx1
tst-cleanupx3
tst-cleanupx4
tst-oncex3
tst-oncex4
tst-timer4
tst-timer5
tst-cpuclock2
tst-cputimer1
tst-cputimer2
tst-cputimer3
tst-pie1 (139)
tst-audit2
tst-addr1
check-textrel

Build with the gcc with the patch:
test-float
test-double
test-idouble
tststatic
tststatic2
tst-cond16
tst-cond17
tst-conf18
tst-oddstacklimit (139)
tst-cancelx4
tst-cancelx5
tst-cancelx8
tst-cancelx9
tst-cancelx10
tst-cancelx11
tst-cancelx12
tst-cancelx13
tst-cancelx14
tst-cancelx15
tst-cancelx16
tst-cancelx17
tst-cancelx18
tst-cancelx20
tst-cancelx21
tst-cleanupx0
tst-cleanupx1
tst-cleanupx3
tst-cleanupx4
tst-oncex3
tst-oncex4
tst-mqueue3
tst-timer4
tst-time5
tst-cputimer1
tst-cputimer2
tst-cputimer3
tst-pie1 (139)
tst-tls9-static
tst-audit2
tst-addr1
check-textrel

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
