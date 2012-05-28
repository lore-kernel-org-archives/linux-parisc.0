From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: [PATCH v2] update parisc to use generic strncpy_from_user()
Date: Mon, 28 May 2012 13:57:09 -0400
Message-ID: <CADZpyiyZX8QNDzWhpJfQS4YWYh24uG37AZYEP4gW63uqCW+W_A@mail.gmail.com>
References: <1338022099.3087.2.camel@dabdike.int.hansenpartnership.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Parisc List <linux-parisc@vger.kernel.org>,
	linux-arch@vger.kernel.org, David Miller <davem@davemloft.net>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Return-path: <linux-arch-owner@vger.kernel.org>
In-Reply-To: <1338022099.3087.2.camel@dabdike.int.hansenpartnership.com>
List-ID: <linux-arch.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Sat, May 26, 2012 at 4:48 AM, James Bottomley
<James.Bottomley@hansenpartnership.com> wrote:
> I'll queue this patch in our git repo. =A0It seems to work fine for u=
s,
> thanks, Dave!
>
> v2: use test_thread_flag() for max addr determination instead of
> tsk->thread.task_size
>

Doesn't this seems like wasted instructions on the hot path? I fully
agree with you that on PA, where the stack grows up, there isn't
anything to run into up there.

On PA the failure case is still likely going to be one where you copy
all the way through the stack (which would appear valid to the kernel)
and fault on the first unmapped page and return -EFAULT.

I'd rather see a compile-time constant like you originally suggested.

Cheers,
Carlos.
