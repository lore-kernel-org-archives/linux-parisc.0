From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] parisc: prefer _THIS_IP_ and _RET_IP_ statement expressions
Date: Fri, 3 Aug 2018 11:11:28 -0700
Message-ID: <CAKwvOdmDwO1U1sk=3-6zXFrVw6by1e_9VBx1WWMCx_rMqYSw-A@mail.gmail.com>
References: <20180801182258.17834-1-ndesaulniers@google.com>
 <78c667f9-5c8b-3835-83eb-4b59e27e4f7e@bell.net> <CAKwvOdmdrA+UvAWyqe8sNJt5nxHXHsSwf5Yxih9HYgVL+kovxQ@mail.gmail.com>
 <fe7b57d8-b586-a390-31d2-2274f69db3c0@bell.net> <CAKwvOd=CLBFZRQ4HQb_+VCydDEvsbC2w2gD4hTwvp_jm1zqN9Q@mail.gmail.com>
 <54b2139b-53d2-01c5-f240-93a692cdbc59@bell.net> <CAKwvOdktvrZL8T_5K2VtQtgt_mscS7kzVXYVy0O7CSuGX53Y5A@mail.gmail.com>
 <536ef1b1-cfa2-f66d-4261-fb8405964632@bell.net> <CAKwvOdmwj76aESZNKhzfPmhfzGKvrfDut7oD5KAwA+VR-JukSg@mail.gmail.com>
 <80743c1c-2a8c-7bce-2068-24c63790eba7@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: deller@gmx.de, jejb@parisc-linux.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pravin Shedge <pravin.shedge4linux@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
To: dave.anglin@bell.net
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <80743c1c-2a8c-7bce-2068-24c63790eba7@bell.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Aug 3, 2018 at 10:57 AM John David Anglin <dave.anglin@bell.net> wrote:
>
> On 2018-08-02 4:31 PM, Nick Desaulniers wrote:
> > If I understand your point correctly, is it that you're saying that
> > _THIS_IP_  should be implemented in terms of inline assembly (as in
> > what current_text_addr() is currently)?  If that's what you mean and
> > I'm understanding correctly, my point is that we should be preferring
> > the generic C implementation as that's what's being used in most
> > places currently, so if it was broken you'd likely already know about
> > it.  Unless unwinding is truly broken by the additional label, I don't
> > think we need an inline assembly implementation of current_text_addr()
> > for parisc (or any arch for that matter).  If we do, then it can be
> > localized to the parisc unwinding code, that way it can be
> > consolidated everywhere else for every other arch.
> The label breaks the unwind data, not the unwind code.  So, localizing
> the use of
> current_text_addr() to the parisc unwind code doesn't help.

But the kernel uses the generic _THIS_IP_ *everywhere*, not parisc's
custom current_text_addr().  So if this did actually break unwinding,
you should have noticed by now.  There's only one call site that uses
the custom current_text_addr(), which is what my patch is addressing.

Localizing the custom implementation would literally produce the same
binary as is produced today, but allow us to start removing all the
other custom implementations of current_text_addr() from
arch/*/include/asm/processor.h, which is why I proposed that as an
alternative to this patch.

> Personally, I prefer the implementation of current_text_addr() because:
>
> 1) The generated code is smaller, and

One instruction vs two, for a single call site that I bet is cold and
not inlined in multiple places.

> 2) it doesn't introduce any unnecessary labels into the text.
>
> As noted, these labels can cause issues with unwinding.

Can you confirm that applying this patch actually breaks unwinding?

-- 
Thanks,
~Nick Desaulniers
