Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7447D484B
	for <parisc-linux@lists.parisc-linux.org>; Thu, 23 Oct 2003 01:17:18 -0600 (MDT)
Date: Thu, 23 Oct 2003 00:21:57 -0700
From: Randolph Chung <randolph@tausq.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20031023072157.GX24406@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] teaching the kernel to do division
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I was investigating why nanosleep() doesn't return the correct remaining
time with a 2.6 kernel... turns out the kernel doesn't seem to know 
how to do division properly :-(

kernel/posix-timers.c has:

                tsave->tv_sec = div_long_long_rem(left,
                                                  NSEC_PER_SEC,
                                                  &tsave->tv_nsec);

which eventually calls __div64_32() in lib/div64.c

if you test that function, you see that it does weird things. For
example, it tells me that:

28999591392 / 1000000000 = 3, remainder = 229787616

<sigh>

does anyone want to look into fixing it, and/or writing an optimized
version of that function for pa? :-) it needs to do basically this (but
be standalone)

uint32_t div64(uint64_t *n, uint32_t base)
{
        uint32_t rem;

        rem = *n % base;
        *n = *n / base;

        return rem;
}

thanks :)
randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
