From: John David Anglin <dave.anglin@bell.net>
Subject: Re: Aw: Re: C3600 kernel/64bit 4.* slow IO due to -mlong-calls
Date: Fri, 16 Mar 2018 09:37:57 -0400
Message-ID: <e3b11e2e-490a-5882-2bfa-a199ae4a2634@bell.net>
References: <CA+QBN9C=wHxV5Y=SSt2UB_4b1H_Nx1mZxZu3rvuTY2wRe=GWBw@mail.gmail.com>
 <d637ebd1-db27-585b-c324-0e02baf8c8b2@gmx.de>
 <113ad157-e8c3-81dc-5752-75416c8ce531@bell.net>
 <trinity-f7583046-4aa6-488a-a797-20501118a1c0-1521199558775@3c-app-gmx-bs75>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Cc: debian-hppa@lists.debian.org, linux-parisc <linux-parisc@vger.kernel.org>
To: Helge Deller <deller@gmx.de>
Return-path: <bounce-debian-hppa=debian-hppa=m.gmane.org@lists.debian.org>
In-Reply-To: <trinity-f7583046-4aa6-488a-a797-20501118a1c0-1521199558775@3c-app-gmx-bs75>
Resent-Message-ID: <EvUoL2q21-M.A.AxF.Lj8qaB@bendel>
List-Id: linux-parisc.vger.kernel.org
List-Id: <debian-hppa.lists.debian.org>
List-URL: <https://lists.debian.org/debian-hppa/>
List-Post: <mailto:debian-hppa@lists.debian.org>
List-Help: <mailto:debian-hppa-request@lists.debian.org?subject=help>
List-Subscribe: <mailto:debian-hppa-request@lists.debian.org?subject=subscribe>
List-Unsubscribe: <mailto:debian-hppa-request@lists.debian.org?subject=unsubscribe>
List-Archive: https://lists.debian.org/msgid-search/e3b11e2e-490a-5882-2bfa-a199ae4a2634@bell.net

On 2018-03-16 7:25 AM, Helge Deller wrote:
>>>> kernel  gcc     binutils    with mlong    without mlong
>>>> 4.15.7  4.9.3   2.25.1     13.4 MB/s    27.0 MB/s
>>>> 4.15.7  6.4.0   2.25.1     13.4 MB/s    27.0 MB/s
>>>> 4.15.7  6.4.0   2.29.1     14.4 MB/s    25.0 MB/s
>>> Interesting bad results!
>>>    
>> It's hard to understand why the performance would deteriorate so much
>> but I see essentially the same behavior.
> Speaking of debian kernel, it's nearly impossible to link a kernel without mlong-calls.
>
> Compiling without mlong-calls generates this (R_PARISC_PCREL22F):
>          b,l external_func,%r2
>          nop
On PA 2.0, this is a 22 bit pc-relative call that has a branch distance 
of 8 MB.  We have no stub support
in the gnu 64-bit linker.  If we had stub support, this would be best 
solution.

In addition to the argument registers, the argument pointer needs to be 
loaded for each call.

>
> With -mlong-calls it is much more complex:
> .LC0:
>          .dword  P%external_func
> .globl a
> a:
>          addil LT'.LC0,%r27
>          ldd RT'.LC0(%r1),%r28
>          ldd 0(%r28),%r28
>          ldd 16(%r28),%r2
>          bve,l (%r2),%r2
This is standard 64-bit indirect call.  It calls via a function 
descriptor.  It assumes the PIC register may change
and the callee may be in a different space (i.e., 64-bit hpux runtime).  
The bve instruction is specific to PA 2.0.
b
In the kernel, we probably don't need the load of the new PIC register 
(omitted from the above).

>
>
> Since our kernel is running in the first 4GB of RAM (even on 64bit), couldn't we instead
> introduce a gcc option, e.g. "-mkernel-indirect-calls", which translates to:
>          ldil    L%external_func, %r2        // R_PARISC_DIR21L
>          ldo     R%external_func(%r2), %r2   // R_PARISC_DIR14R
>          bve,l (%r2),%r2
Another option is to use ble (i.e., call sequence generated using 
-mfast-indirect-calls).  It yields the same length
call sequence as your above sequence and it works on both PA 1.x and 2.0.

The above sequence is not PIC.  What about modules?

In the above three sequences, there is a delay slot after the branch 
which might be filled by the compiler with a
useful instruction.
>
> Does -mfast-indirect-calls has any effect at all?
> I haven't seen any difference when using this option.
At the moment, this option only applies to the 32-bit compiler.
>
> Thoughts?

I don't remember any huge increase in gcc build time with -mlong-calls.  
Calls don't usually dominate performance.

Dave
