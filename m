From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH 2.6.39-rc3] parsic: Fix futex support
Date: Sat, 6 Aug 2011 11:33:44 -0400
Message-ID: <BLU0-SMTP45D898F67A78AB9E546B37973F0@phx.gbl>
References: <4E177624.1030500@systemhalted.org> <201107081742.48874.vapier@gentoo.org> <4E1780EE.1010405@systemhalted.org> <BLU0-SMTP8777233F78FA13F6037090974E0@phx.gbl> <CADZpyixCFm7YUfihEJs+eR+gyUcw+S_ty+v4w2bK2s0jMFwUQg@mail.gmail.com> <2F6A03B7-0729-4774-AD1F-5D3C571DE51D@bell.net> <BLU0-SMTP8613717861B7E5D22BB762973C0@phx.gbl>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Cc: "Carlos O'Donell" <carlos@systemhalted.org>,
	Mike Frysinger <vapier@gentoo.org>,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP8613717861B7E5D22BB762973C0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 5-Aug-11, at 5:44 PM, John David Anglin wrote:

> I am currently building 2.13 and will see what needs fixing.


This is what I see:

# Testsuite failures, someone should be working towards
# fixing these! They are listed here for the purpose of
# regression testing during builds.
# Format: <Failed test>, Error <Make error code> [(ignored)]
#
annexc.out, Error 1 (ignored)
check-execstack.out, Error 1
check-localplt.out, Error 1
check-textrel.out, Error 1
test-double.out, Error 1
test-float.out, Error 1
test-idouble.out, Error 1
test-ifloat.out, Error 1
tst-addr1.out, Error 1
tst-audit2.out, Error 139
tst-backtrace2.out, Error 1
tst-cancelx20.out, Error 1
tst-cancelx21.out, Error 1
tst-cancelx4.out, Error 1
tst-cancelx5.out, Error 1
tst-cleanupx4.out, Error 1
tst-cond10.out, Error 1
tst-cond18.out, Error 1
tst-cond20.out, Error 1
tst-cond21.out, Error 1
tst-cpuclock2.out, Error 1
tst-cputimer1.out, Error 1
tst-cputimer2.out, Error 1
tst-cputimer3.out, Error 1
tst-getcpu.out, Error 1
tst-longjmp_chk.out, Error 1
tst-mqueue3.out, Error 1
tst-sprofil.out, Error 137
tst-timer4.out, Error 1
tst-timer5.out, Error 1
tst-tls11.out, Error 139
tst-tls3.out, Error 1
***************
Encountered regressions that don't match expected failures:
test-double.out, Error 1
test-float.out, Error 1
test-idouble.out, Error 1
test-ifloat.out, Error 1
tst-cond10.out, Error 1
tst-cond18.out, Error 1
tst-cond20.out, Error 1
tst-cond21.out, Error 1
tst-sprofil.out, Error 137
tst-tls11.out, Error 139
tst-tls3.out, Error 1
make: *** [/home/dave/debian/multiarch-support/eglibc-2.13/stamp-dir/ 
check_libc] Error 1
dpkg-buildpackage: error: debian/rules build gave error exit status 2

Dave
--
John David Anglin	dave.anglin@bell.net



