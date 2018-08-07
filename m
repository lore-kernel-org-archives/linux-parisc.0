From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] parisc: prefer _THIS_IP_ and _RET_IP_ statement expressions
Date: Tue, 7 Aug 2018 14:29:13 -0700
Message-ID: <CAKwvOdmav51ye3Bx=hNuroOtXbZ_w1SbE6CEr47DdCF5TcLESQ@mail.gmail.com>
References: <20180801182258.17834-1-ndesaulniers@google.com>
 <78c667f9-5c8b-3835-83eb-4b59e27e4f7e@bell.net> <CAKwvOdmdrA+UvAWyqe8sNJt5nxHXHsSwf5Yxih9HYgVL+kovxQ@mail.gmail.com>
 <fe7b57d8-b586-a390-31d2-2274f69db3c0@bell.net> <CAKwvOd=CLBFZRQ4HQb_+VCydDEvsbC2w2gD4hTwvp_jm1zqN9Q@mail.gmail.com>
 <54b2139b-53d2-01c5-f240-93a692cdbc59@bell.net> <CAKwvOdktvrZL8T_5K2VtQtgt_mscS7kzVXYVy0O7CSuGX53Y5A@mail.gmail.com>
 <536ef1b1-cfa2-f66d-4261-fb8405964632@bell.net> <CAKwvOdmwj76aESZNKhzfPmhfzGKvrfDut7oD5KAwA+VR-JukSg@mail.gmail.com>
 <80743c1c-2a8c-7bce-2068-24c63790eba7@bell.net> <CAKwvOdmDwO1U1sk=3-6zXFrVw6by1e_9VBx1WWMCx_rMqYSw-A@mail.gmail.com>
 <81a7e33a-0403-b6d4-fcba-c2168a608ba6@bell.net> <CAKwvOdmXi_EY5=sOO9tRqeoFrHjLsF9L988cGC2yjnFYBxac4w@mail.gmail.com>
 <1d577675-c337-d433-f235-1e46e5d56d4c@gmx.de> <CAKwvOdkABF9cxFxrtYo_mMWAunLL_ifM8+=H0On7WWcFmoN0Og@mail.gmail.com>
 <74f19f24-fc6a-748d-3778-26ee0bfb2d40@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: dave.anglin@bell.net, jejb@parisc-linux.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pravin Shedge <pravin.shedge4linux@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Alistair Strachan <astrachan@google.com>
To: deller@gmx.de
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <74f19f24-fc6a-748d-3778-26ee0bfb2d40@gmx.de>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, Aug 7, 2018 at 1:30 PM Helge Deller <deller@gmx.de> wrote:
>
> On 07.08.2018 20:11, Nick Desaulniers wrote:
> > On Fri, Aug 3, 2018 at 3:34 PM Helge Deller <deller@gmx.de> wrote:
> >> So, your patch is basically OK and doesn't break anything.
> >> But I agree with Dave and Andrew, that THIS_IP is ugly.
> >
> > I don't disagree, and other maintainers have remarked on _THIS_IP_
> > being ugly, but renaming it en masse is a tree wide change, which I'm
> > trying to avoid at the moment.
>
> Understandable.
>
> > It sounds like we have a working patch? Are there 64b parisc machines
> > to test on, or can this get merged?
>
> Go ahead and merge it.

Thank you, but I was under the impression this would go up through the
parisc tree?
https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git/
right? Or is there a different tree/maintainer I should ask?

> In addition, somehow I'd prefer if there would be a way to add to include/linux/kernel.h:
> +#if !defined(_THIS_IP_)
> #define _THIS_IP_  ({ __label__ __here; __here: (unsigned long)&&__here; })
> +#endif
>
> That way it would somehow be possible to replace that label calulation by the
> preferable inline assembly of current_text_address()...

I'm asserting that there is no need within the entire kernel at the
moment to have inline assembly to get the instruction pointer.  If
there are no call sites of the inline assembly version, there is no
need to define per arch inline assembly versions when C (with GNU
extensions) will suffice.

And if in the future there are, either those call sites can have a
local implementation (as in the second diff I sent in this thread), or
some other change to _THIS_IP_ (as you propose) can be made.  But
until then...

YAGNI: "You Ain't Gonna Need It"

Once this patch and the other 3 outstanding ones are merged, we'll be
sending patches to delete all arch specific assembly implementations
as they will be dead code (no callers, kernel-wide).
-- 
Thanks,
~Nick Desaulniers
