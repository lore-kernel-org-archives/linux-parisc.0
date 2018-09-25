From: Helge Deller <deller@gmx.de>
Subject: Re: [RFC] parisc64: change __kernel_suseconds_t to match glibc
Date: Tue, 25 Sep 2018 19:53:13 +0200
Message-ID: <7fdae639-6871-df29-ffbb-1096822ebb34@gmx.de>
References: <20180913160010.905798-1-arnd@arndb.de>
 <de79d285-7cbc-e547-547b-cf3e0627950d@gmx.de>
 <CAK8P3a1WT87CFyz7457R_cx=ueVjG+xUWXAA6SSw+C4ZnaZHVw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: "James E.J. Bottomley" <jejb@parisc-linux.org>,
        y2038 Mailman List <y2038@lists.linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Parisc List <linux-parisc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAK8P3a1WT87CFyz7457R_cx=ueVjG+xUWXAA6SSw+C4ZnaZHVw@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 25.09.2018 12:53, Arnd Bergmann wrote:
> On Mon, Sep 17, 2018 at 9:46 PM Helge Deller <deller@gmx.de> wrote:
>> On 13.09.2018 17:59, Arnd Bergmann wrote:
>>> There are only two 64-bit architecture ports that have a 32-bit
>>> suseconds_t: sparc64 and parisc64. I've encountered a number of problems
>>> with this, while trying to get a proper 64-bit time_t working on 32-bit
>>> architectures. Having a 32-bit suseconds_t combined with a 64-bit time_t
>>> means that we get extra padding in data structures that may leak kernel
>>> stack data to user space, and it breaks all code that assumes that
>>> timespec and timeval have the same layout.
>>>
>>> While we can't change sparc64, it seems that glibc on parisc64 has always
>>> set suseconds_t to 'long', and the current version would give incorrect
>>> results for gettimeofday() and many other interfaces: timestamps passed
>>> from user space into the kernel result in tv_usec being always zero
>>> (the lower bits contain the intended value but are ignored) while data
>>> passed from the kernel to user space contains either zeroes or random
>>> data in tv_usec.
> 
> [back from traveling now, sorry for the delay in replying]
> 
>> Should this wrong behavior be visible with 32-bit userspace or
>> with 64-bit userspace (or both)?
>> I didn't noticed such wrong behavior yet.
> 
> Only 64-bit user space.
> 
...
> A simple 64-bit gettimeofday() should report incorrect
> nanoseconds using the upstream glibc implementation.

Yes, you are right.
Since we don't have any 64-bit userspace yet, it's safe to fix it now as you suggested.
I've added your patch as is to my for-next tree and tagged it for stable-tree.

Thanks for catching this!

Helge
