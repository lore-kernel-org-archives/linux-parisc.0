From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: prefer _THIS_IP_ and _RET_IP_ statement
 expressions
Date: Sat, 4 Aug 2018 00:34:19 +0200
Message-ID: <1d577675-c337-d433-f235-1e46e5d56d4c@gmx.de>
References: <20180801182258.17834-1-ndesaulniers@google.com>
 <78c667f9-5c8b-3835-83eb-4b59e27e4f7e@bell.net>
 <CAKwvOdmdrA+UvAWyqe8sNJt5nxHXHsSwf5Yxih9HYgVL+kovxQ@mail.gmail.com>
 <fe7b57d8-b586-a390-31d2-2274f69db3c0@bell.net>
 <CAKwvOd=CLBFZRQ4HQb_+VCydDEvsbC2w2gD4hTwvp_jm1zqN9Q@mail.gmail.com>
 <54b2139b-53d2-01c5-f240-93a692cdbc59@bell.net>
 <CAKwvOdktvrZL8T_5K2VtQtgt_mscS7kzVXYVy0O7CSuGX53Y5A@mail.gmail.com>
 <536ef1b1-cfa2-f66d-4261-fb8405964632@bell.net>
 <CAKwvOdmwj76aESZNKhzfPmhfzGKvrfDut7oD5KAwA+VR-JukSg@mail.gmail.com>
 <80743c1c-2a8c-7bce-2068-24c63790eba7@bell.net>
 <CAKwvOdmDwO1U1sk=3-6zXFrVw6by1e_9VBx1WWMCx_rMqYSw-A@mail.gmail.com>
 <81a7e33a-0403-b6d4-fcba-c2168a608ba6@bell.net>
 <CAKwvOdmXi_EY5=sOO9tRqeoFrHjLsF9L988cGC2yjnFYBxac4w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: jejb@parisc-linux.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Pravin Shedge <pravin.shedge4linux@gmail.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Alistair Strachan <astrachan@google.com>
To: Nick Desaulniers <ndesaulniers@google.com>, dave.anglin@bell.net
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKwvOdmXi_EY5=sOO9tRqeoFrHjLsF9L988cGC2yjnFYBxac4w@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 03.08.2018 22:33, Nick Desaulniers wrote:
> On Fri, Aug 3, 2018 at 12:09 PM John David Anglin <dave.anglin@bell.net> wrote:
>>
>> On 2018-08-03 2:11 PM, Nick Desaulniers wrote:
>>> But the kernel uses the generic_THIS_IP_  *everywhere*, not parisc's
>>> custom current_text_addr().  So if this did actually break unwinding,
>>> you should have noticed by now.
>> The unwind problem was noticed.
> 
> So parisc is currently broken (doesn't unwind) due to the pervasive
> use of _THIS_IP_ (generic C) throughout the kernel?

I tested it on the 32bit kernel.
The answer is: No. Unwinding works (with and without your patch).
 
> If no, that implies this patch (generic C) causes no unwinding problems.

correct.

> If yes, that implies that the diff I posted later in this thread
> (inline assembly) is preferable, and that parisc has bigger problems
> (and probably needs to do rewrite the unwinding code to handle these
> extra labels everywhere).
> 
>> Patches were recently applied to gcc and binutils to try and fix it.
>> The gcc patch moved
>> branch tables to rodata so that the label at the head of the table
>> wasn't in text.
>>
>> https://gcc.gnu.org/ml/gcc-patches/2018-07/msg01804.html
>> https://sourceware.org/ml/binutils/2018-07/msg00474.html
>>
>> When I saw your suggested change, I realized there was another source of
>> text labels
>> that need linker relocations.
> 
> Thank you for the links.
> 
> On Fri, Aug 3, 2018 at 10:57 AM John David Anglin <dave.anglin@bell.net> wrote:
>> The label breaks the unwind data, not the unwind code.  So, localizing
>> the use of
>> current_text_addr() to the parisc unwind code doesn't help.
> 
> Have you confirmed that applying my patch breaks *the ability to
> unwind correctly*?

I tested your patch (on 32bit).
Your patch does not break anything.

> It looks like return_address() is used in
> ftrace_return_address(), so I assume you can boot a kernel with my
> patch applied, and CONFIG_FTRACE=y, then run:
> 
> $ sudo trace-cmd record -p function date
> $ trace-cmd report | grep date- | less
> 
> and see if the stacks aren't unwound or look messed up.

I faced issues with trace-cmd, but calling ftracing functions manually worked.

So, your patch is basically OK and doesn't break anything.
But I agree with Dave that Andrew, that THIS_IP is ugly.

Helge
