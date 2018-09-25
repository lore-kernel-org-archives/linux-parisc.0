From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC] parisc64: change __kernel_suseconds_t to match glibc
Date: Tue, 25 Sep 2018 12:53:11 +0200
Message-ID: <CAK8P3a1WT87CFyz7457R_cx=ueVjG+xUWXAA6SSw+C4ZnaZHVw@mail.gmail.com>
References: <20180913160010.905798-1-arnd@arndb.de> <de79d285-7cbc-e547-547b-cf3e0627950d@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <de79d285-7cbc-e547-547b-cf3e0627950d@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Sep 17, 2018 at 9:46 PM Helge Deller <deller@gmx.de> wrote:
> On 13.09.2018 17:59, Arnd Bergmann wrote:
> > There are only two 64-bit architecture ports that have a 32-bit
> > suseconds_t: sparc64 and parisc64. I've encountered a number of problems
> > with this, while trying to get a proper 64-bit time_t working on 32-bit
> > architectures. Having a 32-bit suseconds_t combined with a 64-bit time_t
> > means that we get extra padding in data structures that may leak kernel
> > stack data to user space, and it breaks all code that assumes that
> > timespec and timeval have the same layout.
> >
> > While we can't change sparc64, it seems that glibc on parisc64 has always
> > set suseconds_t to 'long', and the current version would give incorrect
> > results for gettimeofday() and many other interfaces: timestamps passed
> > from user space into the kernel result in tv_usec being always zero
> > (the lower bits contain the intended value but are ignored) while data
> > passed from the kernel to user space contains either zeroes or random
> > data in tv_usec.

[back from traveling now, sorry for the delay in replying]

> Should this wrong behavior be visible with 32-bit userspace or
> with 64-bit userspace (or both)?
> I didn't noticed such wrong behavior yet.

Only 64-bit user space.

> Can you suggest some test programs to verify?
> LTP seems to be correct.

A simple 64-bit gettimeofday() should report incorrect
nanoseconds using the upstream glibc implementation.

> > Based on that, it seems best to change the user API in the kernel in
> > an incompatible way to match what glibc expects.
>
> Basically that sounds the right way to go, but as said before,
> I didn't see such issues.
>
> > Note that the distros I could find (gentoo and debian) all just
> > have 32-bit user space, which does not suffer from this problem.
>
> That's correct.
> Kernel can be 32- or 64-bit, but userspace is currentl 32-bit only.
>
> So, breaking any 64-bit userspace is OK, since we don't have it yet.
> Breaking 32-bit userspace needs some thoughts...

Ok.

     Arnd
