From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Nanoseconds times on EXT3 always seem to be zero
Date: Mon, 7 Jan 2008 12:42:56 -0500
Message-ID: <119aab440801070942v2693dfc2y556cc4aa415c5179@mail.gmail.com>
References: <200801062013.m06KDdht008111@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200801062013.m06KDdht008111@hiauly1.hia.nrc.ca>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Jan 6, 2008 3:13 PM, John David Anglin <dave@hiauly1.hia.nrc.ca> wrote:
> On an EXT3 file system, I see the following:
>
> dave@mx3210:~$ touch xyzzy
> dave@mx3210:~$ ls --full-time xyzzy
> -rw-r--r-- 1 dave dave 0 2008-01-06 15:07:01.000000000 -0500 xyzzy
>
> However, on tmpfs, proc, etc., I see the sub-seconds time.  This is
> 2.6.22.14 and 2.6.22.15.
>
> The behavior of 32 and 64-bit kernels seems to be the same.
>
> With an old 2.6 x86 kernel (suse), I see sub-second times on a EXT3
> file system.

Can you distill this into a testcase that uses the kernel fstat* syscalls?

That would definitely rule out glibc getting in the way.

c.
