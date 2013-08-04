From: John David Anglin <dave.anglin@bell.net>
Subject: Re: State of the PA-RISC/HPPA port (August 2013)
Date: Sun, 4 Aug 2013 10:57:36 -0400
Message-ID: <BLU0-SMTP72B82A70E34DE847073F0597530@phx.gbl>
References: <20130803204119.GA2392@halden.box> <CAE2sS1j6z+PJbRW5gS+B4C-WKhPZCXPwOs8np07qsPM1fxAe2w@mail.gmail.com>
Mime-Version: 1.0 (Apple Message framework v936)
Content-Type: multipart/mixed; boundary="Apple-Mail-9-36581839"
Cc: Helge Deller <deller@gmx.de>, linux-parisc@vger.kernel.org,
	debian-hppa@lists.debian.org,
	James Bottomley <James.Bottomley@hansenpartnership.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <CAE2sS1j6z+PJbRW5gS+B4C-WKhPZCXPwOs8np07qsPM1fxAe2w@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

--Apple-Mail-9-36581839
Content-Type: text/plain; charset="US-ASCII"; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

On 4-Aug-13, at 8:21 AM, Carlos O'Donell wrote:

> The glibc testsuite results are really bad, but hopefully I'll poke at
> those over the coming year.

Attached results from last Debian 2.17 build.

Have kernel patch installed that fixed tst-mqueue2.  However, I think  
there are
still issues with writev syscall.

We might knock out quite a few if we found the cause of cancel test  
failures.

Dave
--
John David Anglin	dave.anglin@bell.net



--Apple-Mail-9-36581839
Content-Disposition: attachment;
	filename="test-results-hppa-linux-gnu-libc.txt"
Content-Type: text/plain; x-unix-mode=0644;
	name="test-results-hppa-linux-gnu-libc.txt"
Content-Transfer-Encoding: 7bit

#
# Testsuite failures, someone should be working towards
# fixing these! They are listed here for the purpose of
# regression testing during builds.
# Format: <Failed test>, Error <Make error code> [(ignored)]
#
annexc.out, Error 1 (ignored)
check-execstack.out, Error 1
check-localplt.out, Error 1
check-textrel.out, Error 1
run-conformtest.out, Error 1 (ignored)
test-double.out, Error 1
test-float.out, Error 1
test-idouble.out, Error 1
test-ifloat.out, Error 1
tst-addr1.out, Error 1
tst-attr3.out, Error 1
tst-audit2.out, Error 139
tst-backtrace2.out, Error 1
tst-backtrace3.out, Error 1
tst-backtrace4.out, Error 1
tst-backtrace5.out, Error 1
tst-backtrace6.out, Error 1
tst-cancel22.out, Error 1
tst-cancel23.out, Error 1
tst-cancel4.out, Error 1
tst-cancel5.out, Error 1
tst-cancelx20.out, Error 1
tst-cancelx21.out, Error 1
tst-cancelx4.out, Error 1
tst-cancelx5.out, Error 1
tst-cleanupx4.out, Error 1
tst-cond25.out, Error 1
tst-cpuclock2.out, Error 1
tst-getcpu.out, Error 1
tst-makecontext.out, Error 255
tst-mqueue8x.out, Error 1
tst-trim1.out, Error 1

--Apple-Mail-9-36581839--
