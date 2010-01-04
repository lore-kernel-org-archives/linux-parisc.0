From: Helge Deller <deller@gmx.de>
Subject: Re: futex wait failure
Date: Mon, 04 Jan 2010 22:24:53 +0100
Message-ID: <4B425CA5.1030506@gmx.de>
References: <20100101034858.80D264EA9@hiauly1.hia.nrc.ca> <20100104162732.10090@gmx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org, dave.anglin@nrc-cnrc.gc.ca,
	carlos@systemhalted.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100104162732.10090@gmx.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 01/04/2010 05:27 PM, Helge Deller wrote:
> If my assumptions are correct, then we either could
>
> a) use the gcc atomic builtins instead of own atomic code in libc6:
> E.g: add to ports/sysdeps/unix/sysv/linux/hppa/bits/atomic.h:
> ...
> #if __GNUC_PREREQ (4, 1)
> # define atomic_compare_and_exchange_val_acq(mem, newval, oldval) \
>    __sync_val_compare_and_swap (mem, oldval, newval)
> #  define atomic_compare_and_exchange_bool_acq(mem, newval, oldval) \
>    (! __sync_bool_compare_and_swap (mem, oldval, newval))
>
> #elif __ASSUME_LWS_CAS
> ....


Even with this change, minifail sadly still segfaults :-(

Helge
