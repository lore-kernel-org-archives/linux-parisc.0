From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: eglibc_2.13-5 on hppa
Date: Wed, 8 Jun 2011 12:20:29 -0400
Message-ID: <20110608162029.GB12658@hiauly1.hia.nrc.ca>
References: <20110608013308.GA15282@hiauly1.hia.nrc.ca> <BANLkTi=iXdMa2Vmv6-S2TPZCTp-S-G5z7Q@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="E39vaYmALEf/7YXx"
Cc: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>,
	linux-parisc@vger.kernel.org
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BANLkTi=iXdMa2Vmv6-S2TPZCTp-S-G5z7Q@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, 08 Jun 2011, Carlos O'Donell wrote:

> On Tue, Jun 7, 2011 at 9:33 PM, John David Anglin
> <dave@hiauly1.hia.nrc.ca> wrote:
> > What's the status of glibc?  In the testsuite, I seeing various
> > tests hang.  For example,
> 
> AFAIK glibc 2.14 is stable and just released, but has some testsuite failures.

Debian is somewhat behind.

> glibc 2.15 is in development and I'll be looking at it next week.
> 
> > dave      8667  100  0.0  34836   588 ?        Sl   20:49   2:09                      |                       \_ /home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc/elf/ld.so.1 --library-path /

> I never see any testsuite hangs on my a500 (vanilla 2.6.33).

No timeouts?  The testsuite doesn't hang as it eventually kills the
tasks.  My run was on rp3440 with 2.6.39.1 with James' last two
cache fixes. 

I have the sense that there might be a cross-chip clock sync issue.
I have always seen occassional timeouts in GCC testsuite in cases that
shouldn't timeout.  I've wondered if these would go away if I disabled
processors 2 and 3.

Note in the ps output, process 8667 is sleeping at 100% CPU.

> I have a pile of free time next week and I hope to dedicate some time
> to cleaning up the glibc testsuite.

It would be great if you could look at the debian package as it
no longer builds (at least on my machine) because of unexpected errors
in the testsuite.

> > Thoughts?
> 
> Yes, the "warning: Unable to find libthread_db matching inferior's
> thread library, thread debugging will not be available." means you
> can't debug threads until you preload the new libc's
> libthread_db.so.1.
> 
> You must always use the libthread_db.so.1 that matches your threading library.

I'll try to debug test tonight.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)

--E39vaYmALEf/7YXx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="errors.log"

make[1]: *** [check] Error 2
make[1]: Leaving directory `/home/dave/debian/glibc/eglibc-2.13/build-tree/hppa-libc'
#
# Testsuite failures, someone should be working towards
# fixing these! They are listed here for the purpose of
# regression testing during builds.
# Format: <Failed test>, Error <Make error code> [(ignored)]
#
annexc.out, Error 1 (ignored)
bug-ftell, Error 1
check-execstack.out, Error 1
check-localplt.out, Error 1
check-textrel.out, Error 1
tst-addr1.out, Error 1
tst-audit2.out, Error 139
tst-backtrace2.out, Error 1
tst-cancelx20.out, Error 1
tst-cancelx21.out, Error 1
tst-cancelx4.out, Error 1
tst-cancelx5.out, Error 1
tst-cleanupx4.out, Error 1
tst-cond20.out, Error 127
tst-cputimer1.out, Error 1
tst-cputimer2.out, Error 1
tst-cputimer3.out, Error 1
tst-getcpu.out, Error 1
tst-gettext6.out, Error 1
tst-longjmp_chk.out, Error 1
tst-mqueue3.out, Error 1
tst-mutexpi7a.out, Error 1
tst-mutexpi7.out, Error 1
tst-timer4.out, Error 1
tst-timer5.out, Error 1
tst-tls11.out, Error 139
tst-tls3.out, Error 1
***************
Encountered regressions that don't match expected failures:
bug-ftell, Error 1
tst-cond20.out, Error 127
tst-gettext6.out, Error 1
tst-mutexpi7a.out, Error 1
tst-mutexpi7.out, Error 1
tst-tls11.out, Error 139
tst-tls3.out, Error 1
make: *** [/home/dave/debian/glibc/eglibc-2.13/stamp-dir/check_libc] Error 1
dpkg-buildpackage: error: debian/rules build gave error exit status 2
Build command 'cd eglibc-2.13 && dpkg-buildpackage -b -uc' failed.
Fetched 23.9 MB in 12s (1,952 kB/s)
E: Child process failed

--E39vaYmALEf/7YXx--
