From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Tue, 26 Apr 2005 15:08:42 -0400 (EDT)
Message-ID: <200504261908.j3QJ8gA5027898@hiauly1.hia.nrc.ca>
References: <4252B02B000092E3@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4252B02B000092E3@mail-1-bnl.tiscali.it> from "Joel Soete" at Apr
	26, 2005 07:36:43 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> btw I don't more understand why the following ifdef (in the same head.S):
> #ifdef __LP64__ /* move to psw.h? */   
> #define         PSW_BITS        PSW_Q+PSW_I+PSW_D+PSW_P+PSW_R
> #else
> #define         PSW_BITS        PSW_SM_Q
> #endif

I also don't understand the difference between the 32 and 64 bit cases.
There's probably a reason to turn off I, D, P and R in these sequences.
For example, a flush instruction cache instruction with the D bit set
affects the relied upon translation.  So, the question would be why the
bits are not turned off in the 32-bit case.  It may be because the PDCs
differ in their handling of these bits.  I'm pretty sure that the 64-bit
define would work in the 32-bit case.  The bits are only off through to
the rfi which then sets new bits.

The bits for the 64-bit case probably should be written using the "PSW_SM"
defines.  There's no difference for the Q, I, D, P and R bits but the SM
defines are for the "sm" instructions.

>         b,n             srdis_done
> [snip]

I believe that you should align srdis_done as follows:

	.align 128

You would then need to add a branch and nop to get there.

> srdis_done:
> 
> 
>         /* Switch back to virtual mode */
> 
>         ssm             0, %r0                  /* relied upon translation!
> */
>         nop
>         nop
>         nop
>         nop
>         nop
>         nop
>         nop
> 
>         rsm             PSW_SM_Q, %r0           /* clear Q bit to load iia
> queue */
>         ldil            L%KERNEL_PSW, %r1
>         ldo             R%KERNEL_PSW(%r1), %r1
>         mtctl           %r1, %cr22
>         mtctl           %r0, %cr17              /* Clear IIASQ tail */
>         mtctl           %r0, %cr17              /* Clear IIASQ head */
> [snip]
> 
> Thanks in advance,
>     Joel
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
