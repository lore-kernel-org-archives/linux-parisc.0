From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] parisc: prefer _THIS_IP_ and _RET_IP_ statement expressions
Date: Thu, 2 Aug 2018 13:31:19 -0700
Message-ID: <CAKwvOdmwj76aESZNKhzfPmhfzGKvrfDut7oD5KAwA+VR-JukSg@mail.gmail.com>
References: <20180801182258.17834-1-ndesaulniers@google.com>
 <78c667f9-5c8b-3835-83eb-4b59e27e4f7e@bell.net> <CAKwvOdmdrA+UvAWyqe8sNJt5nxHXHsSwf5Yxih9HYgVL+kovxQ@mail.gmail.com>
 <fe7b57d8-b586-a390-31d2-2274f69db3c0@bell.net> <CAKwvOd=CLBFZRQ4HQb_+VCydDEvsbC2w2gD4hTwvp_jm1zqN9Q@mail.gmail.com>
 <54b2139b-53d2-01c5-f240-93a692cdbc59@bell.net> <CAKwvOdktvrZL8T_5K2VtQtgt_mscS7kzVXYVy0O7CSuGX53Y5A@mail.gmail.com>
 <536ef1b1-cfa2-f66d-4261-fb8405964632@bell.net>
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
In-Reply-To: <536ef1b1-cfa2-f66d-4261-fb8405964632@bell.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Aug 1, 2018 at 5:49 PM John David Anglin <dave.anglin@bell.net> wrote:
>
> On 2018-08-01 6:18 PM, Nick Desaulniers wrote:
> >> What about the uses in the fs support, etc?
> > Sorry, I don't see it?
> I mean _THIS_IP_.

I don't understand, I'm referring to current_text_addr().  Maybe this
explains more what I'm trying to do:
https://lkml.org/lkml/2018/8/1/1689

If I understand your point correctly, is it that you're saying that
_THIS_IP_ should be implemented in terms of inline assembly (as in
what current_text_addr() is currently)?  If that's what you mean and
I'm understanding correctly, my point is that we should be preferring
the generic C implementation as that's what's being used in most
places currently, so if it was broken you'd likely already know about
it.  Unless unwinding is truly broken by the additional label, I don't
think we need an inline assembly implementation of current_text_addr()
for parisc (or any arch for that matter).  If we do, then it can be
localized to the parisc unwinding code, that way it can be
consolidated everywhere else for every other arch.

-- 
Thanks,
~Nick Desaulniers
