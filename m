Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from megatonmonkey.net (cr821974-a.lndn1.on.wave.home.com [24.112.53.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8CEDD482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Sep 2001 09:35:58 -0600 (MDT)
Date: Fri, 21 Sep 2001 11:37:00 -0400
From: "Carlos O'Donell Jr." <carlos@megatonmonkey.net>
To: parisc-linux@lists.parisc-linux.org
Cc: baldric-exec@baldric.uwo.ca
Message-ID: <20010921113700.A25803@megatonmonkey.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] testandset
List-ID: <linux-parisc.vger.kernel.org>

I remember Wilcox saying:

"
Because we can't implement testandset atomically & efficiently on hppa.
The places which use testandset actually just need trylock.
"

Was the old testandset changed to try_lock in pt-machine.h for
hppa?

I see that they are the same asm statement (i.e. just an ldcw).

pt-machine.h:old:
testandset (int *spinlock)
{
  int ret;

  __asm__ __volatile__(
       "ldcw 0(%2),%0"
       : "=r"(ret), "=m"(*spinlock)
       : "r"(spinlock));

  return ret == 0;
}

pt-machine.h:new:
try_lock(__atomic_lock_t *spinlock)
{
  int ret;

  __asm__ __volatile__(
       "ldcw 0(%2),%0"
       : "=r"(ret), "=m"(*spinlock)
       : "r"(spinlock));

  return ret == 0;
}

Same...

I'm sitting scratching my head becaues the ./sysdeps/hppa/dl-fptr.c
is peppered with testandset, which used to be in pt-machine.h,
but is now called try_lock within pt-machine.h

Which is my current reason that glibc-2.2.4 failes to build
Because dl-fptr.c makes use of testandset, which is no longer 
in pt-machine.h.

Do I have something backwards?
I'm starting to think that I should take a look at dpkg-buildpackage,
and if I'm using it all properly.

---

Matthew,

Since I can't quite get to the point where zic barfs while 
walking the timezones... I'm not much help ;)


c.
