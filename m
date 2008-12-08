From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: 2.6.28-rcX in pretty bad shape on parisc
Date: Mon, 8 Dec 2008 10:02:47 -0500
Message-ID: <119aab440812080702k6ab8c0f4k772f0f0bc9eb2893@mail.gmail.com>
References: <119aab440812080439l12c2feb8u500eeea3ad5bbd20@mail.gmail.com>
	 <20081208145451.2116F4EDA@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	"Helge Deller" <deller@gmx.de>,
	linux-parisc <linux-parisc@vger.kernel.org>,
	"Grant Grundler" <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20081208145451.2116F4EDA@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Mon, Dec 8, 2008 at 9:54 AM, John David Anglin
<dave@hiauly1.hia.nrc.ca> wrote:
>> > So, the code is using the thread register (cr27).  Not sure what syscall
>> > this is.  However, the problem might be TLS releated.
>>
>> The thread register has always been used to track thread specific
>> information, even in linuxthreads.
>>
>> The syscall is __NR_futex.
>>
>> If you can produce a synthetic testcase that calls __NR_futex and
>> crashes the kernel then we'll have something for the kernel hackers to
>> look at?
>
> How long have futex's been used on hppa?  I guess we really need to try
> run the glibc testsuite on a new kernel.

The futex function has been available almost since futex's first appeared

The futex API is exported to userspace and can be used by any application.

e.g. man futex
~~~
NAME
       futex - Fast Userspace Locking system call

SYNOPSIS
       #include <linux/futex.h>
       #include <sys/time.h>

       int futex(int *uaddr, int op, int val, const struct timespec *timeout,
                 int *uaddr2, int val3);
~~~

Yes, the glibc testsuite is one of the best ways to exercise a lot of
kernel syscalls.

Cheers,
Carlos.
