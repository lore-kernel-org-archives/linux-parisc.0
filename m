Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id AAA10051
	for <parisc-linux@puffin.external.hp.com>; Mon, 18 Dec 2000 00:04:57 -0700
Sender: phi@hpfrcu03.france.hp.com
Message-ID: <3A3DB858.A56A4FE4@hpfrcu03.france.hp.com>
Date: Mon, 18 Dec 2000 08:10:16 +0100
From: Philippe Benard <phi@hpfrcu03.france.hp.com>
MIME-Version: 1.0
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Stan Sieler <sieler@allegro.com>, Matthew Wilcox <matthew@wil.cx>,
        Jes Sorensen <jes@linuxcare.com>, Alan Modra <alan@linuxcare.com.au>,
        John Marvin <jsm@udlkern.fc.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] ldcw in __pthread_acquire
References: <E147oHg-0004n8-00@the-village.bc.nu>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>


> The cost of a syscall against a rarely contended lock is huge. So you
> test in user space, you spin enough times to cover SMP contentions then
> you leap into the kernel since its a context switch away while the
> other guy held the lock, which at maybe a 30 clock window is unlikely
> 

I am not sure I understand this thread very well. I would say that going
syscall() for a mutex lock (ldcw, testset, spinlock, whatever you name it) is
not a question of cost it is just simply impossible to avoid. 

Atomically load/clear (or test/set) a word, indeed can be done (should be
done) in user space, but whence one thread got it (for a very short period of
time claim the getter), the getter can be pre-empted anytime owning the lock
word, because and as far as I know, interuption are not disabled when getting
the lock word. The other wanters will then spinlock for a very long period of
time then, what apeared a fast non-syscall get, become a CPU hog, there is one
spinlock running. So I agry with what you said, the wanters want to spin lock
a little on the lock word, because the taker may be rigth sometime and release
it quick, and after a little number of loop count, the wanter goes to sleep on
the lockword, just to get a chance to be awaken, and who take car of
sleep/wakeup, I think it is the OS. Then how to communicate the lock word to
the OS, because the OS must do the atomic load/clear (test/set) on the same
lock word, I think it is with an API, then a libcall/syscall, or
macro/syscall, I think libcall is better since the tiny user space function
can be inlined... I think the pthread API is perfect for this, and this thread
started from pthread. For people who need 'fast' mutual exclusion without the
need to make their prog pthreaded, I think they can implement their own
mutex_lock() syscall, i.e the one to call if you didn't succeeded to get the
lock in user land for a little while.

Phi
