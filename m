From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: NTPL transition
Date: Sat, 6 Sep 2008 11:31:50 -0400
Message-ID: <119aab440809060831u790ad62dte057bedf68e0d988@mail.gmail.com>
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
> IMHO, there is no need for versioning. Moreover it wouldn't be sufficient.

You must versioning the affected interfaces, otherwise you will never
be able to remove the compatibility code.

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

Yes, certainly, this is a valid case.

Any function that manipulates a changed structure needs to be versioned.

Eventually, one day, debian hppa will configure glibc with
--enable-oldest-abi at a high enough value that the compat code will
be dropped (because we have proved no package needs it and we have an
upgrade path).

Do you have any other concerns?

Cheers,
Carlos.
