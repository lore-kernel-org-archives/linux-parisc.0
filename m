From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH] parisc: Improve LWS-CAS performance
Date: Tue, 13 May 2014 23:31:23 -0400
Message-ID: <CAE2sS1i7gDUwq+bRoSNhw+kCBsA-cDAzHs4O03yHuWUxqJE-wQ@mail.gmail.com>
References: <BLU0-SMTP178D56FBECCDEE0B3D0BE6974A0@phx.gbl>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Cc: linux-parisc List <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	James Bottomley <James.Bottomley@hansenpartnership.com>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <BLU0-SMTP178D56FBECCDEE0B3D0BE6974A0@phx.gbl>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sun, May 11, 2014 at 6:40 PM, John David Anglin <dave.anglin@bell.net> wrote:
> The attached change significantly improves the performance of the LWS-CAS
> code in syscall.S.
> This allows a number of packages to build (e.g., zeromq3, gtest and libxs)
> that previously failed because
> slow LWS-CAS performance under contention.  In particular, interrupts taken
> while the lock was taken
> degraded performance significantly.
>
> The change does the following:
>
> 1) Disables interrupts around the CAS operation,

OK.

> 2) Removes the lock code on UP systems where it is not needed, and

This is wrong. The locking was originally only for SMP, but at one
point it was discovered that you could COW during the CAS operation
and if you didn't take the lock in UP, you could re-enter the CAS via
another task and thus incorrectly carry out the CAS in two different
threads and corrupt the state. While we attempt our best to prevent
the task running the CAS from being scheduled off, the COW operation
trap and subsequent scheduling is not something I could find an easy
way to prevent. Therefore the solution was to use locks for both UP
and SMP.

> 3) Changes the loads and stores to use the ordered completer, "o", on
> PA 2.0.  "o" and "ma" with a zero offset are equivalent.  The latter is
> accepted
> on both PA 1.X and 2.0.
>
> The use of ordered loads and stores probably makes no difference on all
> existing
> hardware, but it seemed pedantically correct.  In particular, the CAS
> operation must
> complete before LDCW lock is released.  As written before, a processor could
> reorder
> the operations.

Agreed.

> I don't believe the period interrupts are disabled is long enough to
> significantly
> increase interrupt latency.  For example, the TLB insert code is longer.
> Worst
> case is a memory fault in the CAS operation.

The worst case is actually a COW during the write of the CAS? The
interrupts would be disabled until the kernel turned them back on in
another code path.


Cheers,
Carlos.
