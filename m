From: Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] parisc: prefer _THIS_IP_ and _RET_IP_ statement expressions
Date: Wed, 1 Aug 2018 15:18:19 -0700
Message-ID: <CAKwvOdktvrZL8T_5K2VtQtgt_mscS7kzVXYVy0O7CSuGX53Y5A@mail.gmail.com>
References: <20180801182258.17834-1-ndesaulniers@google.com>
 <78c667f9-5c8b-3835-83eb-4b59e27e4f7e@bell.net> <CAKwvOdmdrA+UvAWyqe8sNJt5nxHXHsSwf5Yxih9HYgVL+kovxQ@mail.gmail.com>
 <fe7b57d8-b586-a390-31d2-2274f69db3c0@bell.net> <CAKwvOd=CLBFZRQ4HQb_+VCydDEvsbC2w2gD4hTwvp_jm1zqN9Q@mail.gmail.com>
 <54b2139b-53d2-01c5-f240-93a692cdbc59@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: deller@gmx.de, jejb@parisc-linux.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        pravin.shedge4linux@gmail.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
To: dave.anglin@bell.net
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <54b2139b-53d2-01c5-f240-93a692cdbc59@bell.net>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Aug 1, 2018 at 3:12 PM John David Anglin <dave.anglin@bell.net> wrote:
>
> On 2018-08-01 5:49 PM, Nick Desaulniers wrote:
> > Thoughts?  Idea being there's only one call site in your tree that has
> > this requirement (and the other one in
> > include/net/inet_connection_sock.h I don't think is correct, and will
> > send a patch out imminently).

Turns out it is correct (I assumed by caller, they meant _RET_IP_, but
they're in an inline function). https://lkml.org/lkml/2018/8/1/1687 is
the patch.

> What about the uses in the fs support, etc?

Sorry, I don't see it?

$ ag current_text_addr
and
$ grep -R current_text_addr

turn up nothing in fs/.  Is this torvals/linux with no out of tree patches?
-- 
Thanks,
~Nick Desaulniers
