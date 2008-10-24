From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: NTPL transition
Date: Fri, 24 Oct 2008 01:45:05 -0400
Message-ID: <119aab440810232245r4414de7bhc4435905e233d9fd@mail.gmail.com>
References: <Pine.LNX.4.62.0809061002060.19796@sci.felk.cvut.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Petr Salinger" <Petr.Salinger@seznam.cz>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <Pine.LNX.4.62.0809061002060.19796@sci.felk.cvut.cz>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, Sep 6, 2008 at 4:24 AM, Petr Salinger <Petr.Salinger@seznam.cz> wrote:
> Imagine function in a shared library foo which takes as argument
> pthread_mutex_t and does usual:
>
>        pthread_mutex_lock()
>        do some work
>        pthread_mutex_unlock()
>
> And a program bar, which uses foo. Inside bar is a static initialized lock.
> The foo might be (re)compiled against NPTL, while bar would be still
> compiled against LT. Therefore check_and_reset() should be called as long as
> any installed (debian) package have not been recompiled against NPTL. The
> overhead of check_and_reset() looks very small, it should be no problem at
> all. The harder part is to determine each place, where
> check_and_reset() should be called. It have to be in all places,
> where static initialized lock might be passed for the 1st time,
> i.e. it should be in  pthread_mutex_lock(), but not in
> pthread_mutex_unlock().

I reviewed the compatibility provided by glibc for the pthread_cond_t
change in 2.3.2, and I see no such guarantee that an address of a
pthread_cont_t in an old binary can be safely passed to a library
rebuilt against the new libc . When upstream changed pthread_cond_t,
making it larger, they versioned the interface, and the old function
mallocs a pointer to the new structure and call the new function with
the newly malloc'd structure.

I think 99% of all situations are covered by providing an old
function. Guarding the new function against a mixed ABI use seems like
a performance penalty with an unknown benefit. Clearly if upstream
glibc didn't think it was usefull, should we also ignore this
scenario?

I have compat patches in testing on my SMP parisc64 box. I should have
some results by next week.

Cheers,
Carlos.
