From: Petr Salinger <Petr.Salinger@seznam.cz>
Subject: Re: hppa nptl switch
Date: Mon, 31 Aug 2009 10:16:44 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0908310926590.9856@sci.felk.cvut.cz>
References: <Pine.LNX.4.62.0908181940440.7856@sci.felk.cvut.cz>
 <119aab440908181851i174315c6lebacea921046bbb0@mail.gmail.com>
 <20090819124816.GC2517@hall.aurel32.net> <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: debian-hppa@lists.debian.org, debian-glibc@lists.debian.org,
        linux-parisc <linux-parisc@vger.kernel.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <119aab440908302201s35719b5fh3f7d7b1e870c445f@mail.gmail.com>
Resent-Message-ID: <gHmLP6o1C9H.A.emF.8O4mKB@liszt>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>

Hi.

> I spent the last two days rewriting the pthread structure layouts for
> hppa's nptl implementation.

It looks very nice and promising now, thanks.

> I was able to restructure both pthread_mutex_t, and pthread_rwlock_t to 
> be 100% ABI compatible with Linuxthreads.

Strictly speaking, currently they are not,
they are only 100% backward compatible.
But only step away, they could be 100% compatible.
Just the new NPTL initializers should initilize
the four ones as previously in LT.
In practice it shouldn't be problem at all.
Debian should make sure that binary/library compiled
against NPTL-hppa-glibc will require NPTL-hppa-glibc
by proper Depends: line like "libc6 (>= 2.10)".

> The prototype patch in testing is here:
> http://www.parisc-linux.org/~carlos/2009-08-31-glibc-ports-hppa-nptl.diff

It is not possible to use "#include_next <pthread.h>" in
sysdeps/unix/sysv/linux/hppa/nptl/pthread.h, as this file
is installed in libc6-dev for general use.
The proper way would be to convince Mr. Drepper to split
<pthread.h> into <pthread.h> and <bits/pthreadinit.h>.
Good luck with it.

The pthread_cond_init.c should call cond_compat_clear()
instead of cond_compat_check_and_clear() or may be just
"cond->__data.__initializer = 0"

Thanks for all your work.

Petr
