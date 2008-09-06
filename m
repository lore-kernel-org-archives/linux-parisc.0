From: Petr Salinger <Petr.Salinger@seznam.cz>
Subject: Re: NTPL transition
Date: Sat, 6 Sep 2008 22:16:20 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0809062158160.20902@sci.felk.cvut.cz>
References: <Pine.LNX.4.62.0809061002060.19796@sci.felk.cvut.cz>
 <119aab440809060831u790ad62dte057bedf68e0d988@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
To: "Carlos O'Donell" <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440809060831u790ad62dte057bedf68e0d988@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

>> IMHO, there is no need for versioning. Moreover it wouldn't be sufficient.
>
> You must versioning the affected interfaces, otherwise you will never
> be able to remove the compatibility code.
>
>> Imagine function in a shared library foo which takes as argument
>> pthread_mutex_t and does usual:
>>
>>        pthread_mutex_lock()
>>        do some work
>>        pthread_mutex_unlock()
>>
>> And a program bar, which uses foo. Inside bar is a static initialized lock.
>> The foo might be (re)compiled against NPTL, while bar would be still
>> compiled against LT. Therefore check_and_reset() should be called as long as
>> any installed (debian) package have not been recompiled against NPTL. The
>> overhead of check_and_reset() looks very small, it should be no problem at
>> all. The harder part is to determine each place, where
>> check_and_reset() should be called. It have to be in all places,
>> where static initialized lock might be passed for the 1st time,
>> i.e. it should be in  pthread_mutex_lock(), but not in
>> pthread_mutex_unlock().
>
> Yes, certainly, this is a valid case.
>
> Any function that manipulates a changed structure needs to be versioned.
>
> Eventually, one day, debian hppa will configure glibc with
> --enable-oldest-abi at a high enough value that the compat code will
> be dropped (because we have proved no package needs it and we have an
> upgrade path).
>
> Do you have any other concerns?

The versioning does not help here, i.e. in the above case
bar will not reference any old (linuxthread variant) function,
therefore it would look like there is no need for compat code, even though 
it will be still needed.

For dropping compat code, you have to be sure any package is not compiled 
against old glibc - it can be determined in debian from Depends: line
in binary package control file. The strategy for upgrade might be easy;
For lenny+1 include compat code, but make sure all of lenny+1 released
packages are build against NPTL variant. The compact code can be dropped
just after lenny+1 release.

It looks like one compare will say it is not LT initialized lock,
this path might be really fast.
IMHO, even including such compat code forever will be easier compared to 
transition all libraries ...

The check_and_reset() should be reasonably "atomic" - two threads might 
call pthread_mutex_lock() on static LT initialized lock in the same time.

What are the difference between LT and NPTL definition of pthread_mutex_t.
Only 3 unused ints in pthread_mutex_t ?

Petr
