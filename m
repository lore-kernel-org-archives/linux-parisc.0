From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: fix out-of-register compiler error in ldcw inline
 assembler function
Date: Mon, 15 Dec 2014 16:45:18 -0500
Message-ID: <BLU436-SMTP65B94A3C7BF6B84ED90B87976F0@phx.gbl>
References: <20141021194614.GA14418@ls3530.box> <A73C80F5-1200-437F-9199-2B916E3457B4@bell.net> <548F4B7C.8060508@gmx.de> <BLU436-SMTP141439F4C676F97CF7D44EB976F0@phx.gbl> <548F5251.4070708@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <548F5251.4070708@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 12/15/2014 4:27 PM, Helge Deller wrote:
> Hi Dave,
>
> On 12/15/2014 10:25 PM, John David Anglin wrote:
>> On 12/15/2014 3:58 PM, Helge Deller wrote:
>>> Do you mind sending a full patch to the list ?
>> Thought I did.  Was something missing?
>
> A nice changelog and title for the patch...
> I could copy over your comments from that patch, but maybe you want to 
> rephrase it, so that it actually comes from you.
> You can send me the wording here in mail as well, then I'll put it 
> together.
I think the email subject is fine for the title.

For the comment:

The __ldcw macro has a problem when its argument needs to be reloaded from
memory.  The output memory operand and the input register operand both need
to be reloaded using a register in class R1_REGS when generating 64-bit 
code.
This fails because there's only a single register in the class. Instead, 
use a memory
clobber.  This also makes the __ldcw macro a compiler memory barrier.

Dave

-- 
John David Anglin    dave.anglin@bell.net

