From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: futex wait failure
Date: Fri, 8 Jan 2010 16:44:15 -0500
Message-ID: <119aab441001081344j38000314p1931df34149eabd3@mail.gmail.com>
References: <20100108163756.48BDE5183@hiauly1.hia.nrc.ca>
	 <4B47A130.8060603@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	dave.anglin@nrc-cnrc.gc.ca, linux-parisc@vger.kernel.org
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4B47A130.8060603@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jan 8, 2010 at 4:18 PM, Helge Deller <deller@gmx.de> wrote:
>> I now think this probably is a glibc bug. =A0The kernel uses this va=
lue
>> when the CLONE_PARENT_SETTID flag is passed.
>
>
> Maybe we have a futex problem in glibc on hppa?
> In glibc nptl/pthread_mutex_trylock.c we check the return value of a =
futex
> syscall against EWOULDBLOCK.
> Since on parisc - in contrast to all other architectures - we have
> EWOULDBLOCK!=3DEAGAIN, we maybe missed a check?

That's a bug. There are several kernel paths that could return EAGAIN
*or* EWOULDBLOCK via the FUTEX_TRYLOCK_PI futex operation.

However, I think Dave is on to something with the

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
