From: Carlos O'Donell <carlos@systemhalted.org>
Subject: Re: Thread stack allocation
Date: Mon, 10 Sep 2012 15:02:01 -0400
Message-ID: <504E3929.1010605@systemhalted.org>
References: <BLU0-SMTP405E1823EA93DF4FBFC1797AD0@phx.gbl> <BLU0-SMTP91500D9B875298D4CD828597AD0@phx.gbl> <BLU0-SMTP297D308BBF8A72A121C16397AD0@phx.gbl> <504E03AF.2070204@systemhalted.org> <504E0B28.6010406@bell.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: Parisc List <linux-parisc@vger.kernel.org>
To: John David Anglin <dave.anglin@bell.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <504E0B28.6010406@bell.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 9/10/2012 11:45 AM, John David Anglin wrote:
> On 9/10/2012 11:13 AM, Carlos O'Donell wrote:
>> On 9/9/2012 6:24 PM, John David Anglin wrote:
>>> >On 9-Sep-12, at 4:23 PM, John David Anglin wrote:
>>> >
>>>> >>It seems to me this must be a kernel bug:
>>> >
>>> >Nope, it's a problem with guard page allocation in openjdk.
>>> >It assumes stack grows down.
>> Yes, that's wrong:-)
>>
>> If you allocate your own stacks then glibc can't setup guard
>> pages for you since it violates some POSIX constraints.
> I need to study the situation in more detail but what I found is openjdk
> initially allocates a fairly large stack with pthread_attr_setstacksize,
> then it mucks with this region setting up guard pages, etc.  This goes
> seriously wrong on parisc and the initial thread is only left with a stack
> which is 4096 bytes.
> 
> I disabled guard pages and the build went a lot further, but died again
> due to what appears to be another stack related issue.  If this package
> is to work again, it's going to need significant porting to fix the stack
> handling.  I think there was a parisc patch at one time but I think it
> has been removed...
> 
> If I understand correctly, we have on parisc a guard region followed
> by TLS stuff at the top of stack.  I assume that the stack size allocated
> with pthread_attr_setstacksize is fully available to the user.

No. This is what the glibc bug is about and it's what I'm fixing right now.

No matter what you do glibc allocates static tls, guard pages, and several
other things *from* the stack size you set.

This is wrong for many reasons, and we're fixing stack size accounting
upstream. Until the fix is in, which would be ~2.17 timeframe this isn't
going to get better.

If you have a small-ish stack, with lots of static tls variables, then you
loose and need to manually allocate your own stack of the appropriate size
to hold everything you need (not that there is any API to figure that out)
and do it all manually.

After the fix goes in the size you request via pthread_attr_setstacksize
will be the real size you have access to use and proper stack analysis
tools will be useful again :-)

Cheers,
Carlos.

