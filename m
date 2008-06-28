From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: in ccio_io_pdir_entry(),BUG_ON() seems to break gcc-4.2	optimization?
Date: Sat, 28 Jun 2008 22:26:25 +0000
Message-ID: <4866BA91.9040607@scarlet.be>
References: <K324MR$1963B6E59C4D4D716463AB17911CD186@scarlet.be> <20080628202347.GA23898@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Cc: linux-parisc <linux-parisc@vger.kernel.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20080628202347.GA23898@colo.lackof.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hello Grant,

Grant Grundler wrote:
> On Thu, Jun 26, 2008 at 07:28:03AM +0100, Joel Soete wrote:
>> Just for remind:
>>
>> Joel Soete wrote:
>>  >
>>  >
>> [snip]
>>  >>> But this time, it seems not consider assembly:
>>  >>>         asm volatile ("lci %%r0(%%sr1, %1), %0" : "=r" (ci) : "r"
>>  >>> (vba));
>>  >>>         asm volatile ("extru %1,19,12,%0" : "+r" (ci) : "r" (ci));
>>  >>>         asm volatile ("depw  %1,15,12,%0" : "+r" (pa) : "r" (ci));
>>  >>>
>>  >>> as a 'volatile' block and insert line 1c:
>>
>> This seems to make better what I want:
>>         __asm__ __volatile__ (
>>         "lci    %%r0(%%sr1, %2), %0\n"
>>         "\textru        %0,19,12,%0\n"
>>         "\tdepw         %0,15,12,%1\n"
>>         : "+r" (ci), "+r" (pa)
>>         : "r" (vba)
>>         : "memory"
> 
> Why the "memory"? This asm code isn't modifying memory at all.
> 
well I certainly still have wrongly understand what "memory" clobber means but for me "pa" is a memory location modified 
(the plus sign in '"+r" (pa)' and that either after 64bit computation or 32bit initialization pa=0).
But your comment make me fill I am again wrong (well definitively C is not my language ;-) .)

>>         );
>>
>>
>> in <ccio_map_sg>
>>   200:	06 80 53 13 	lci r0(sr1,r20),r19		      |	 200:	08 1a 02 54 	copy r26,r20
>>   204:	d2 73 1a 74 	extrw,u r19,19,12,r19		      |	 204:	06 a0 53 14 	lci
>> r0(sr1,r21),r20
>>   208:	08 1a 02 5c 	copy r26,ret0			      |	 208:	d2 94 1a 74 	extrw,u
>> r20,19,12,r20
>>   20c:	d7 93 0e 14 	depw r19,15,12,ret0		      |	 20c:	d7 94 0e 14 	depw
>> r20,15,12,ret0
>>   210:	0e dc 12 80 	stw ret0,0(r22)				 210:	0e dc 12 80 	stw ret0,0(r22)
>>   214:	06 c0 12 80 	fdc r0(r22)				 214:	06 c0 12 80 	fdc r0(r22)
>>   218:	00 00 04 00 	sync					 218:	00 00 04 00 	sync
>>
>> J.
>>
>> PS: I don't yet understand why kernel panicing when I try to get rid to
>> reserve 'ci' variable and use in place a gr as r19 (even if clobbered), the
>> produced object seems ok but resulting kernel panicing (even after a full
>> rebuild after a make distclean???)
> 
> What's wrong with "ci" variable? It's just another register.
well the idea is that "ci" variable is just there as a tmp variable just used in this asm code, right.
so why not simply get rid of its declaration (btw save a line of code ;-)) and just use a common temporay reg as r19?

but what I show above is just a 'diff -y' between a objdump's hunk of ccio-dma.o:
on the left side what gcc produce with the original code (3 different asm lines) (this kernel was well booting fine)
on the right side what same compile produce with new code (1 asm line).

Otoh, based on my few knowldge on parisc asm, it seems to me that something like:
          __asm__ __volatile__ (
          "lci    %%r0(%%sr1, %1), %%r19\n"
          "\textru        %%r19,19,12,%%r19\n"
          "\tdepw         %%r19,15,12,%0\n"
          : "+r" (pa)
          : "r" (vba)
          : "r19")

would do the same job, but all my test results was a panicing kernel???
(even thought if I am diffing 2 objdump of the only ccio-dma.o, it looks like gr are just used differently. but may be did I 
missed another wrong stuff).

That said, nothing of that help to fixe ccio-dma driver issue ;-(

My latest hope is relayfs to grab more debug info (I just need a bit more free time).

> C compiler will allocate it and then we pass it to the asm().
> 
> And are you sure it's ok to use r19?
> 
yes that was the only lines, I was working on.

Tx,
	J.

> hth,
> grant
> 
> 
> 
