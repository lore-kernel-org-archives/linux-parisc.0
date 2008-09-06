From: Petr Salinger <Petr.Salinger@seznam.cz>
Subject: Re: NTPL transition
Date: Sat, 6 Sep 2008 10:24:22 +0200 (CEST)
Message-ID: <Pine.LNX.4.62.0809061002060.19796@sci.felk.cvut.cz>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
To: debian-hppa@lists.debian.org,
	linux-parisc <linux-parisc@vger.kernel.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org


> To be technically correct this is a "static initialized lock" using
> something like PTHREAD_MUTEX_INIT. We must version every function that
> could have had a statically initialized lock, and at the start of said
> function, check the lock words and reset as appropriate. This involves
> a) Detect parisc-lt {1,1,1,1} and convert that to {0,0,0,0} b) If the
> last word in the lock[4] is zero then do nothing. Note that with
> parisc-nptl only the first word is used for locking and it doesn't
> have to be more than int aligned.

IMHO, there is no need for versioning. Moreover it wouldn't be sufficient.

Imagine function in a shared library foo which takes as argument 
pthread_mutex_t and does usual:

 	pthread_mutex_lock()
 	do some work
 	pthread_mutex_unlock()

And a program bar, which uses foo. Inside bar is a static initialized 
lock. The foo might be (re)compiled against NPTL, while bar would be 
still compiled against LT. Therefore check_and_reset() should be called as 
long as any installed (debian) package have not been recompiled against 
NPTL. The overhead of check_and_reset() looks very small, it should be no 
problem at all. The harder part is to determine each place, where
check_and_reset() should be called. It have to be in all places,
where static initialized lock might be passed for the 1st time,
i.e. it should be in  pthread_mutex_lock(), but not in
pthread_mutex_unlock().

Petr
