From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: futex: Use same lock set as lws calls
Date: Mon, 17 Oct 2011 16:55:31 -0400
Message-ID: <4E9C9643.6030309@systemhalted.org>
References: <20111009204010.GA22374@hiauly1.hia.nrc.ca> <20111017152358.GA3518@glitch> <CADZpyixDV_OD+YM+u2EMWqY91u_WtGGMM0J3fAofp99q+OWYnA@mail.gmail.com> <4E9C6F9E.5000605@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4E9C6F9E.5000605@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10/17/2011 2:10 PM, John David Anglin wrote:
> On 10/17/2011 11:47 AM, Carlos O'Donell wrote:
>> The test-fork1 failure is still unexplained and happens intermittently.
> 
> I have built a lot of unstable on my rp3440.  I think this one causes failures in the thread
> testsuites of perl, python2.7 and glib2.0.  These are characterized by tests hanging.
> 
> There is another class of failures.  They typically cause my rp3440 to crash due
> to cache corruption.  The GCC libgomp and libatomic-ops testsuite seem to trigger
> this one.  As I have mentioned, it's the libgomp "for" tests that
>>
>> The cancellation issues happen in tst-cancel*.
>>
>> I believe the cancellation issues are toolchain issues and I need to
>> look into them.
> Possibly, this is related to the following bug that I found last week building mpfr-3.1.0:
> http://gcc.gnu.org/bugzilla/show_bug.cgi?id=50691
> A call to __tls_get_addr clobbers first argument of call to mpfr_cache.  Don't have a
> fix at the moment, but there is a simple testcase.
> 
> On a different subject, I tried to get udev-172-1 working.  However, this breaks bootstrap
> due to an invalid argument in a call to inotify_init.  It's somewhat timing dependent since
> some kernels will boot if they build enough of /dev before udev messes up.  In any case,
> I believe that Guy Martin posted a patch a year or so ago to correct an inconsistency
> between the glibc and the kernel for some bit definitions.  I'm thinking this may fix the
> udev problem.

What patch is this? I don't remember it. URL?

> It appears that this change got lost and didn't make it into the debian glibc patch set.
> Was a consensus reached on how to fix this inconsistency?
> 
> I plan on seeing if I can resolve the GCC mpfr bug, then I want to rebuild glibc with
> the flag bits fixed.
> 
> I also found a GCC ICE compiling udev-172-1 with gcc-4.4.  Gcc-4.5 and gcc-4.6 seem
> ok.


Cheers,
Carlos.

