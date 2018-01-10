From: Helge Deller <deller@gmx.de>
Subject: Re: [GIT PULL] parisc architecture fixes for 4.15-rc7
Date: Wed, 10 Jan 2018 14:44:23 +0100
Message-ID: <6ed747e2-d037-b37d-51fb-39e0e2c3f2f4@gmx.de>
References: <20180107162123.GA9715@ls3530.fritz.box>
 <CAGXu5jJ=s8NBBpd9fxr37T+HV8SNunq71AgGwu+Cy7WogPH=xA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Cc: LKML <linux-kernel@vger.kernel.org>,
        linux-parisc <linux-parisc@vger.kernel.org>,
        James Bottomley <James.Bottomley@hansenpartnership.com>,
        John David Anglin <dave.anglin@bell.net>,
        Richard Henderson <rth@twiddle.net>,
        Laura Abbott <labbott@redhat.com>
To: Kees Cook <keescook@chromium.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAGXu5jJ=s8NBBpd9fxr37T+HV8SNunq71AgGwu+Cy7WogPH=xA@mail.gmail.com>
List-ID: <linux-kernel.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 10.01.2018 00:03, Kees Cook wrote:
> On Sun, Jan 7, 2018 at 8:21 AM, Helge Deller <deller@gmx.de> wrote:
>> Hi Linus,
>>
>> please pull a few fixes for the parisc architecture from:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git parisc-4.15-3
>>
>> The fixes are:
>> - Many small fixes to show the real physical addresses of devices instead of
>>   hashed addresses.
>>
>> - One important fix to unbreak 32-bit SMP support: We forgot to 16-byte align
>>   the spinlocks in the assembler code.
>>
>> - Qemu support: The host will get a chance to sleep when the parisc guest is
>>   idle. We use the same mechanism as the power architecture by overlaying the
>>   "or %r10,%r10,%r10" instruction which is simply a nop on real hardware.
>>
>> Thanks,
>> Helge
>>
>> ----------------------------------------------------------------
>> Helge Deller (6):
>>       parisc: Show unhashed hardware inventory
>>       parisc: Show unhashed EISA EEPROM address
> 
> These looks like a physical addresses, yes.
> 
>>       parisc: Show initial kernel memory layout unhashed
>>       parisc: Show unhashed HPA of Dino chip
> 
> But these are virtual addresses and should be just removed, not
> switched to %px. They're not physical addresses that I can see, e.g.
> "dino_dev" is clearly being used as an in-memory structure, and the
> kernel layout literally says "virtual kernel memory layout".

Agreed, some of those should go.
I'll clean that up in upcoming patches.

Thanks!
Helge
