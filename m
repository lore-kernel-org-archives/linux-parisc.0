From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: prefer _THIS_IP_ and _RET_IP_ statement
 expressions
Date: Wed, 1 Aug 2018 17:27:27 -0400
Message-ID: <fe7b57d8-b586-a390-31d2-2274f69db3c0@bell.net>
References: <20180801182258.17834-1-ndesaulniers@google.com>
 <78c667f9-5c8b-3835-83eb-4b59e27e4f7e@bell.net>
 <CAKwvOdmdrA+UvAWyqe8sNJt5nxHXHsSwf5Yxih9HYgVL+kovxQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: deller@gmx.de, jejb@parisc-linux.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        pravin.shedge4linux@gmail.com,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-parisc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKwvOdmdrA+UvAWyqe8sNJt5nxHXHsSwf5Yxih9HYgVL+kovxQ@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2018-08-01 4:52 PM, Nick Desaulniers wrote:
> Dave, thanks for the quick review!
>
> On Wed, Aug 1, 2018 at 1:10 PM John David Anglin <dave.anglin@bell.net> wrote:
>> On 2018-08-01 2:22 PM, Nick Desaulniers wrote:
>>> As part of the effort to reduce the code duplication between _THIS_IP_
>>> and current_text_addr(), let's consolidate callers of
>>> current_text_addr() to use _THIS_IP_.
>> Using the generic _THIS_IP_ results in significantly longer code than
>> the parisc implementation
>> of current_text_addr().
> It might be worthwhile to file a bug with your compiler vendor.  It
> seems like there may be a better way to generate code for this
> construct.
>
> Also, I'm curious how hot this code is? I assume in general that the C
> construct may be larger than the inline assembly, but I'm curious if
> this introduces a performance regression or just makes the code
> larger?  Do you have stats on the size difference and performance
> differences?  What's more important to me is whether the patch is
> correct...
I exaggerated the size difference.  It's two instructions versus one on 
PA 2.0.
>
>> It also results in a local label in the text.
>> This breaks the unwind data
>> for the function with the label in 32-bit kernels.  The implementation
>> of current_text_addr()
>> doesn't add a label.
> ... oh, I guess I'm surprised that the label ends up in the code, vs
> there just being a constant generated.  Can you send me the
> disassembly?  Also, I'm curious how does having the label present in
> the text break the unwinder?  (I'm not familiar with how unwinding
> works beyond following frame pointers).
The generic code results in the following assembly code:

.L2:
         ldil LR'.L2,%r25
         ldo RR'.L2(%r25),%r25

It's the LR and RR relocations that cause the label to end up in the 
final symbol table.
The linker can't throw .L2 away  as its address has been taken.

The comparable PA 2.0 code is:

         mfia %r25

I'm aware of this issue as I just changed gcc to move branch tables to 
read-only data
when generating non-PIC code because of this issue.

Helge knows more about the unwind issues than I do as it's specific to 
the linux kernel.
Userspace uses dwarf unwind info.  I believe what happens is the 
unwinder finds the label
instead of the relevant function and its unwind data.

>
>> _THIS_IP_ should be defined using
>> current_text_addr() on parisc.
> I'm trying to eliminate current_text_addr() in the kernel, as it only
> has 4 call sites (3 are arch specific).  What are your thoughts on
> making the current parisc current_text_addr() just a static function
> (or statement expression that's local to) in
> arch/parisc/kernel/unwind.c?
I understand the desire to eliminate current_text_addr().  However, as 
it stands, using _THIS_IP_
introduces text  labels at many sites in the kernel.  That's why parisc 
needs to be able to provide its
own define for _THIS_IP_.  Currently, we have in asm/processor.h:

/*
  * Default implementation of macro that returns current
  * instruction pointer ("program counter").
  */
#ifdef CONFIG_PA20
#define current_ia(x)   __asm__("mfia %0" : "=r"(x))
#else /* mfia added in pa2.0 */
#define current_ia(x)   __asm__("blr 0,%0\n\tnop" : "=r"(x))
#endif
#define current_text_addr() ({ void *pc; current_ia(pc); pc; })

Dave

-- 
John David Anglin  dave.anglin@bell.net
