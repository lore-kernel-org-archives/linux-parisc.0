From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc: fix kernel crash when unwinding a userspace process
Date: Fri, 21 Nov 2008 15:02:22 +0100
Message-ID: <4926BF6E.3050907@gmx.de>
References: <200811202258.56561.deller@gmx.de> <49268965.7010401@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc@vger.kernel.org,
	Kyle Mc Martin <kyle@hera.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
To: Randolph Chung <randolph@tausq.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <49268965.7010401@tausq.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Randolph Chung wrote:
> Helge Deller wrote:
>> Any user on existing parisc 32- and 64bit-kernels can easily crash
>> the kernel and as such enforce a DSO.
>> A simple testcase is available here: 
>>     http://gsyprf10.external.hp.com/~deller/crash.tgz
>>
>> The problem is introduced by the fact, that the handle_interruption()
>> crash handler calls the show_regs() function, which in turn tries
>> to unwind the stack by calling parisc_show_stack().
>> Since the stack contains userspace addresses, a try to unwind the 
>> stack is dangerous and useless and leads to the crash.
> 
> Helge,
> 
> I think this is ok, but can you preserve the printing of IAOQ/RP even 
> for user processes?

Thanks Randolph,

You are probably right. It's better to stay consistent for debugging and 
you'll see the important registers at once.
I'll respin a new patch.

Helge
