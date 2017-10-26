From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Testing the lws_compare_and_swap_2 syscall
Date: Thu, 26 Oct 2017 10:06:25 -0400
Message-ID: <1ff4bcc7-2e9c-a76c-197c-e19983554818@bell.net>
References: <1508874207@msgid.manchmal.in-ulm.de>
 <F232B09A-5367-4A4C-B731-00C63AAB489A@bell.net>
 <1508973952@msgid.manchmal.in-ulm.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
To: Christoph Biedl <linux-kernel.bfrz@manchmal.in-ulm.de>,
        linux-parisc@vger.kernel.org
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1508973952@msgid.manchmal.in-ulm.de>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 2017-10-25 8:22 PM, Christoph Biedl wrote:
> After staring at lws_compare_and_swap_2 a long time it seems there are
> two issues: First, there is more usage of ",ma" so an update of mem/r26
> hits the wrong place.
The other uses of ",ma" are not a problem as the increment value is 0.  
So, the pointer
is unchanged.  The double word case had an increment of 4 messing up the 
pointer.

Technically, ",ma" with a zero increment provides an ordered load. 
However, the completer
probably isn't necessary as I believe all loads and stores are ordered 
on real hardware.

The "=" completer in the "sub" instructions looks correct to me. When 
*mem and old are
equal, the "b,n     cas2_end" instruction is nullified and new is stored 
in mem.  See comment
from code:

         /*
                 prev = *addr;
                 if ( prev == old )
                   *addr = new;
                 return prev;
         */

In your first test example, old and new should be exchanged in mem. Pass 
should be
mem == new.  Second case should be mem == old.

Dave

-- 
John David Anglin  dave.anglin@bell.net

