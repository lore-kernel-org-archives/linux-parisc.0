From: John David Anglin <dave.anglin@bell.net>
Subject: Re: [PATCH] parisc: Fix syscall restarts
Date: Sun, 20 Dec 2015 15:45:15 -0500
Message-ID: <6F2339C5-E5A3-4F2B-9E8B-3252B7BADD6D@bell.net>
References: <20151218233034.GA24910@p100.box> <B201D30D-8677-4D06-B3F9-EA4494972EF5@bell.net> <56770606.9020005@gmx.de> <A804D424-7C3E-4639-9EC4-5A52653EE0DD@bell.net> <56770D01.9010608@gmx.de>
Mime-Version: 1.0 (Apple Message framework v1085)
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org,
	James Bottomley <James.Bottomley@HansenPartnership.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <56770D01.9010608@gmx.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2015-12-20, at 3:18 PM, Helge Deller wrote:

>>> Nevertheless, it may happen anytime if people forget, that we will see a
>>> "copy" there again, so IMHO it's probably safer to include the workaround in 
>>> kernel too.
>> 
>> 
>> The current patch assumes regs->gr[source_reg] is restored. 
> 
> Yes and no.
> 
> The real problem we actually faced is, that the glibc() syscall function
> uses %r28 (aka the return value of the syscall) as "source_reg".
> That's the reason why we failed with "ENOSYS" in the end, because when we returned
> (before my patch) from the first syscall we returned -ERESTARTSYS
> in %r28 (which is basically correct), but then the "copy %r28,%r20" in
> userspace moved "-ERESTARTSYS" back into %r20, jumped into the kernel, and the
> kernel (correctly) reported back "ENOSYS" since there is no such syscall
> number with the value of "-ERESTARTSYS".
> The problem: %r28 is of course not one of the registers which is being restored.
> Quite complicated... I hope I could explain it somewhat...?

So, the patch doesn't work and we need to fix glibc.  The only other solution is to load
%r20 into %r28 and restore %r28 on a syscall restart.

Dave
--
John David Anglin	dave.anglin@bell.net



