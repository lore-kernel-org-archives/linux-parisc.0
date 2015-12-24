From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix syscall restarts (v2)
Date: Thu, 24 Dec 2015 11:51:54 -0500
Message-ID: <567C22AA.1000700@bell.net>
References: <20151218233034.GA24910@p100.box>
 <20151221091933.GA22935@p100.box>
 <997901782.279317.1450729643512.JavaMail.zimbra@efficios.com>
 <56786702.6060600@gmx.de>
 <187718964.290846.1450973235666.JavaMail.zimbra@efficios.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	James Bottomley <James.Bottomley@HansenPartnership.com>
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <187718964.290846.1450973235666.JavaMail.zimbra@efficios.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-12-24 11:07 AM, Mathieu Desnoyers wrote:
>>> Is it valid to have unaligned instructions ? Does the architecture
>>> >>allow it, or it's a fumble and we should pr_warn ?
>> >
>> >How can it be unaligned? It's about u32...
> That would be an instruction that is volountarily offset
> from 1, 2, 3 bytes from 4-bytes multiples by the application.
> The only situation where I have seen this is in cases where
> applications are trying to play games with the debugger or
> disassembler and hide what they are doing: they can offset
> the start of a function like this, and therefore all the
> instructions within that function.
>
This is not possible on PA-RISC.  Indeed, user instruction addresses are 
always
offset by three.  There is no way to branch to an instruction that is 
offset.

The least significant two bits of an instruction address contain a 
priority level.
User code on linux and hpux executes at level 3.  The only way a user 
can change
privilege level is with a "gate" instruction (a special branch). Whether 
this is
permitted or not depends on page table permissions that the user can't 
change.
In practice, a level change is only allowed on the gateway page.

Dave

-- 
John David Anglin  dave.anglin@bell.net

