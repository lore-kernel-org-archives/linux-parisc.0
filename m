From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: copy_user_page_asm suggested 64bit improvment [Was: [parisc-linux]
	clear user page test]
Date: Mon, 27 Dec 2004 18:32:56 +0000
Message-ID: <41D05558.6020600@tiscali.be>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>	<20041227073654.GI29492@colo.lackof.org>
	<41CFE6B1.6010707@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41CFE6B1.6010707@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Joel Soete wrote:
> 
> 
> Grant Grundler wrote:
> 
>> On Tue, Dec 21, 2004 at 02:37:47PM +0100, Joel Soete wrote:
>>
>>> Hello all,
>>
[...]
>> This routine could use more registers in the loop to get more "distance".
> 
> Ok that was another possibility: I trust that we can use r23, r24 as far 
> as:
>     r23-r26: these are arg3-arg0, i.e. you can use them if you
>         don't care about the values that were passed in anymore.
> 
Here is a first writing just to be sure I well understand:
#ifdef __LP64__

         ldi             32, %r1                 /* PAGE_SIZE/128 == 32 */

1:      ldd             0(%r25), %r19
         ldd             8(%r25), %r20
         ldd             16(%r25), %r21
         ldd             24(%r25), %r22
         ldd             32(%r25), %r23
         ldd             40(%r25), %r24
         std             %r19, 0(%r26)
         std             %r20, 8(%r26)
         std             %r21, 16(%r26)
         std             %r22, 24(%r26)
         std             %r23, 32(%r26)
         std             %r24, 40(%r26)
         ldd             48(%r25), %r19
         ldd             56(%r25), %r20
         ldd             64(%r25), %r21
         ldd             72(%r25), %r22
         ldd             80(%r25), %r23
         ldd             88(%r25), %r24
         std             %r19, 48(%r26)
         std             %r20, 56(%r26)
         std             %r21, 64(%r26)
         std             %r22, 72(%r26)
         std             %r23, 80(%r26)
         std             %r24, 88(%r26)
         ldd             96(%r25), %r19
         ldd             104(%r25), %r20
         ldd             112(%r25), %r21
         ldd             120(%r25), %r22
         std             %r19, 96(%r26)
         std             %r20, 104(%r26)
         std             %r21, 112(%r26)
         std             %r22, 120(%r26)
         ldo             128(%r26), %r26
         ADDIB>          -1, %r1, 1b
         ldo             128(%r25), %r25

#else   /* !__LP64__ */

just have to re-arrange with distance between couple std/ldd?

What do you think?

Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
