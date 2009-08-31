From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: hppa nptl switch
Date: Mon, 31 Aug 2009 11:10:44 -0400
Message-ID: <119aab440908310810g6fa7e3d8s71f1f4bea0041f1@mail.gmail.com>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz>
	 <119aab440908181851i174315c6lebacea921046bbb0@mail.gmail.com>
	 <20090819124816.GC2517@hall.aurel32.net>
	 <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com>
	 <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org, debian-glibc@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: Petr Salinger <Petr.Salinger@seznam.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Aug 31, 2009 at 4:16 AM, Petr Salinger<Petr.Salinger@seznam.cz> wrote:
> Hi.
>
>> I spent the last two days rewriting the pthread structure layouts for
>> hppa's nptl implementation.
>
> It looks very nice and promising now, thanks.
>
>> I was able to restructure both pthread_mutex_t, and pthread_rwlock_t to be
>> 100% ABI compatible with Linuxthreads.
>
> Strictly speaking, currently they are not,
> they are only 100% backward compatible.
> But only step away, they could be 100% compatible.
> Just the new NPTL initializers should initilize
> the four ones as previously in LT.

Yes, my intent was to do exactly that, I had not yet fixed pthread.h
to set the old lock words to all one. I have done exactly this in the
most recent version of my patch. The pthread_mutex_t and
pthread_rwlock_t are now 100% ABI compatible with Linuxthreads.

> In practice it shouldn't be problem at all.
> Debian should make sure that binary/library compiled
> against NPTL-hppa-glibc will require NPTL-hppa-glibc
> by proper Depends: line like "libc6 (>= 2.10)".

Does every package have to do this? I'm not very familiar with all the
packaging requirements.

>> The prototype patch in testing is here:
>> http://www.parisc-linux.org/~carlos/2009-08-31-glibc-ports-hppa-nptl.diff

Second version here:
http://www.parisc-linux.org/~carlos/2009-08-31-glibc-ports-hppa-nptl-v2.diff

The next version is currently testing. It still does not include code
to remove cond_*_clear calls when the ABI level is raised to 2.10.

> It is not possible to use "#include_next <pthread.h>" in
> sysdeps/unix/sysv/linux/hppa/nptl/pthread.h, as this file
> is installed in libc6-dev for general use.

Fixed.

> The pthread_cond_init.c should call cond_compat_clear()
> instead of cond_compat_check_and_clear() or may be just
> "cond->__data.__initializer = 0"

Fixed.

Thanks for the review.

Cheers,
Carlos.
