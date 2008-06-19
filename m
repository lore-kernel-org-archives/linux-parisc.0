From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: Yet another inline asm worry: mtsp() macro (and may be other)?
Date: Thu, 19 Jun 2008 10:11:51 -0600
Message-ID: <20080619161151.GB6049@colo.lackof.org>
References: <K2PKFI$6B7F5B0E10C229208B934B9E4E289468@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc <linux-parisc@vger.kernel.org>,
	Helge Deller <deller@gmx.de>,
	grundler <grundler@parisc-linux.org>, kyle <kyle@mcmartin.ca>
To: Joel Soete <soete.joel@scarlet.be>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <K2PKFI$6B7F5B0E10C229208B934B9E4E289468@scarlet.be>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, Jun 19, 2008 at 12:40:30PM +0100, Joel Soete wrote:
> Hello all,
> 
> Grant, in a first approach I would like to address this post to you because
> all start from ccio-dma (again yes) when I figure out that in fact gcc-4.2 rob
> a part this driver code???
..
> 
> My first worry was about the form takes the resulting code of <ccio_io_pdir_entry>
> for remind:
>     0:   cb 39 a0 60     movb,<> r25,r25,38 <ccio_io_pdir_entry+0x38>
>     4:   34 1c 00 00     ldi 0,ret0
...
> The question was why sr1 is always set to 0 when it's actualy a function
> parameter (iirc 2d arg i.e. r25?)
> 
> Fwiw removing BUG_ON() seems to fix this issue?

Yes. I just replied to your previous mail.

> btw as far as it must be KERNEL_SPACE, couldn't we simplify stuff: removing
> sid parameter and replace mtsp macro call with a simple asm volatile("mtsp
> %%r0,%%sr1":::"memory")?

We could. But I thought there are cases were we might want to DMA to/from
user space directly and that's why Space ID is a parameter. My guess is
we are creating a kernel alias for user space and using the alias instead.
If that's correct and is the long term plan, we could remove the "sid"
parameter.

hth,
grant

> Then I look for all the call to function (ccio_io_pdir_entry) even thought
> it's inligned with those mtsp and lci it would be easy to find it.
> The C code learn me that it would call in ccio_map_single() and thanks with
> iommu_helper.h in ccio_map_sg(). But objdump -D ccio-dma.o shows me only one
> place where this code is used
> 00000000 <ccio_map_single>:
> [snip]
>   84:   34 14 00 00     ldi 0,r20
>   88:   00 14 58 20     mtsp r20,sr1
>   8c:   0a a3 0a 13     add,l r3,r21,r19
>   90:   d6 65 0c 14     depw r5,31,12,r19
>   94:   0f 53 12 88     stw r19,4(r26)
>   98:   04 60 53 1c     lci r0(sr1,r3),ret0
>   9c:   d3 9c 1a 74     extrw,u ret0,19,12,ret0
>   a0:   d6 9c 0e 14     depw ret0,15,12,r20
>   a4:   0f 54 12 80     stw r20,0(r26)
>   a8:   07 40 12 80     fdc r0(r26)
>   ac:   00 00 04 00     sync
> [snip]
> 
> and not in ccio_map_sg() (even not a call to ccio_io_pdir_entry() in case he
> didn't reach to inline it).
> 
> And the wonder is that my system d380 is even booting and running despite this
> lake???
> 
> That said with gcc-4.3, I find well this code iin the 2 functions.
> And here commes my worry about mtsp() macro: here is the resulting code with
> gcc-4.3:
> 00000000 <ccio_map_sg>:
> [snip]
> __ 1a0:   34 1a 00 00     ldi 0,r26__
>  1a4:   20 a0 02 00     ldil L%10000000,r5
>  1a8:   8e 80 61 28     cmpib,> 0,r20,244 <ccio_map_sg+0x244>
>  1ac:   20 40 0e 01     ldil L%-10000000,rp
>  1b0:   86 c0 21 88     cmpib,= 0,r22,27c <ccio_map_sg+0x27c>
>  1b4:   34 19 00 00     ldi 0,r25
>  1b8:   0f e0 10 9c     ldw 0(r31),ret0
>  1bc:   0d 80 10 94     ldw 0(r12),r20
>  1c0:   d7 80 1c 1e     depwi 0,31,2,ret0
>  1c4:   4b b3 00 20     ldw 10(ret1),r19
>  1c8:   0a 9c 04 1c     sub ret0,r20,ret0
>  1cc:   0f f0 10 95     ldw 8(r31),r21
>  1d0:   d3 9c 1f 45     extrw,s ret0,26,27,ret0
>  1d4:   0a b3 0a 13     add,l r19,r21,r19
>  1d8:   d7 9c 09 8c     depw,z ret0,19,20,ret0
>  1dc:   0f e8 10 94     ldw 4(r31),r20
>  1e0:   08 bc 0a 1c     add,l ret0,r5,ret0
>  1e4:   6b b3 00 20     stw r19,10(ret1)
>  1e8:   0a b9 0a 15     add,l r25,r21,r21
>  1ec:   0a 9c 0a 14     add,l ret0,r20,r20
> __ 1f0:   00 1a 58 20     mtsp r26,sr1  __
>  1f4:   08 54 0a 1c     add,l r20,rp,ret0
>  1f8:   d7 8e 0c 14     depw r14,31,12,ret0
>  1fc:   0e dc 12 88     stw ret0,4(r22)
>  200:   06 80 53 13     lci r0(sr1,r20),r19
>  204:   d2 73 1a 74     extrw,u r19,19,12,r19
>  208:   08 1a 02 5c     copy r26,ret0
>  20c:   d7 93 0e 14     depw r19,15,12,ret0
>  210:   0e dc 12 80     stw ret0,0(r22)
>  214:   06 c0 12 80     fdc r0(r22)
>  218:   00 00 04 00     sync
> [snip]
> 
> My worry is the number of insn between the ldi 0,r26 and the mtsp r26,sr1.
> 
> Here, I supposed it's harmless but may be different in other critical path?
> 
> Wouldn't it be interesting (if possible) to insure that the load of the reg
> and mtsp stay close together? (or may be simply detect the case of a const == 0?)
> 
> What your opinion?
> 
> Tx again,
>     J.
> 
> PS: I didn't find back gcc-4.0 to check if my previous perf test could failed
> for this reason?
> 
> 
