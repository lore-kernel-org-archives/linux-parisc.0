From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] Re: Reproducing glibc testsuite failures on
	hppa-linux.
Date: Sat, 19 May 2007 23:36:37 -0400
Message-ID: <5b2e36650705192036o45d1a939u7e49bc56d8d25ddf__43350.9351140403$1416624363$gmane$org@mail.gmail.com>
References: <119aab440705171918n15051b70y2eef1a59229510b8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
Cc: libc-ports@sourceware.org,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <119aab440705171918n15051b70y2eef1a59229510b8@mail.gmail.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On 17/05/07, Carlos O'Donell <carlos@systemhalted.org> wrote:
> Thanks for trying to reproduce the set of glibc failures I am seeing
> on hppa-linux. Attached are two patches which represent the entire set
> of local hacks I have applied to glibc and ports.
>
> I've CC'd libc-ports for posterity. Perhaps someone will have pity and
> tell me why I need the as-needed changes in the nptl makefiles (I have
> yet to deduce if this is gcc or glibc's fault).

Heya Carlos!  Thanks for this.  This is a quick heads up for the
experiment.  Using the Ubuntu glibc package, compiling with gcc-4.2
instead of gcc-4.1 removes the following failures:

test-float
tst-cond17
tst-cond18
tst-robustpi8
tst-fork1

Some tests that use C99 initialisers no longer compiler, but that's
expected with glibc-2.5

I'll keep you posted as I converge. =)

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
