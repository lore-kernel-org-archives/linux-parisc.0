From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] head.S: a small typo
Date: Thu, 28 Apr 2005 17:04:09 +0000
Message-ID: <42711789.8040408@tiscali.be>
References: <200504261908.j3QJ8gA5027898@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504261908.j3QJ8gA5027898@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave, Grant,

John David Anglin wrote:
>>btw I don't more understand why the following ifdef (in the same head.S):
>>#ifdef __LP64__ /* move to psw.h? */   
>>#define         PSW_BITS        PSW_Q+PSW_I+PSW_D+PSW_P+PSW_R
>>#else
>>#define         PSW_BITS        PSW_SM_Q
>>#endif
> 
> 
> I also don't understand the difference between the 32 and 64 bit cases.
> There's probably a reason to turn off I, D, P and R in these sequences.
> For example, a flush instruction cache instruction with the D bit set
> affects the relied upon translation.  So, the question would be why the
> bits are not turned off in the 32-bit case.  It may be because the PDCs
> differ in their handling of these bits.  I'm pretty sure that the 64-bit
> define would work in the 32-bit case.  The bits are only off through to
> the rfi which then sets new bits.
> 
> The bits for the 64-bit case probably should be written using the "PSW_SM"
> defines.  There's no difference for the Q, I, D, P and R bits but the SM
> defines are for the "sm" instructions.
> 
Yes, as mentioned elsewhere (ssm/rsm ggg's patch) it works on all of my config (b180, d380 32bit smp)

> 
>>        b,n             srdis_done
>>[snip]
> 
> 
> I believe that you should align srdis_done as follows:
> 
> 	.align 128
> 
mmm is there importance in the order of:
	.align 128
	.text
rfi_virt2real:

later this is the contrary:
	.text
	.align 128
rfi_real2virt:

(from real2.S :-) )

> You would then need to add a branch and nop to get there.
> 
But I mainly come back here with the fact that 64bit kernel works fine while
its 32 bit twin panicing on same hw (b2k e.g.):
(to test ggg patch I run again my stress loop during about 20h on b2k with
the 64bit kernel without any pb ;-)

as far as I remember cffc() is only 32bit stuff so this patch would make
sense imho:
--- arch/parisc/kernel/parisc_ksyms.c.Orig      2005-04-28 14:39:07.000000000 +0200
+++ arch/parisc/kernel/parisc_ksyms.c   2005-04-28 14:18:23.000000000 +0200
@@ -160,8 +160,10 @@
  EXPORT_SYMBOL(__lshrdi3);
  EXPORT_SYMBOL(__muldi3);

+#ifndef CONFIG_64BIT
  asmlinkage void * __canonicalize_funcptr_for_compare(void *);
  EXPORT_SYMBOL(__canonicalize_funcptr_for_compare);
+#endif /* CONFIG_64BIT */

  #ifdef __LP64__
  extern void __divdi3(void);
--- arch/parisc/kernel/real2.S.Orig     2005-04-28 14:39:29.000000000 +0200
+++ arch/parisc/kernel/real2.S  2005-04-28 14:20:31.000000000 +0200
@@ -288,7 +272,7 @@
         bv,n    0(%rp)
         nop

-
+#ifndef CONFIG_64BIT
         .export __canonicalize_funcptr_for_compare
         .text
         /* http://lists.parisc-linux.org/hypermail/parisc-linux/10916.html
@@ -296,9 +280,6 @@
         **      comparing function pointers.
         */
  __canonicalize_funcptr_for_compare:
-#ifdef __LP64__
-       bve (%r2)
-#else
         bv %r0(%r2)
-#endif
         copy %r26,%r28
+#endif /* CONFIG_64BIT */
====<>====
(compile fine)

mmm, could it be the diff I was looking for between 32 and 64bit ?

For the moment, it is the most important diff that could explain me those
so different behaviour?

well iirc this last hunk is not more than:

typedef int (*fptr_t) (void);
unsigned int
__canonicalize_funcptr_for_compare (fptr)
      fptr_t fptr;
{
     return (unsigned int) fptr;
}

this form could help me to add some printk() to check the fptr containt?
(or may be a WARN_ON() to collect stack tree?)

But that would just give me addresses; how would I be able to check if a fcnt_ptr comparison is erronious?

Another thought: could it be some kind of border effect due to an additonal branch in 32bit (not present in 64bit)?

# grep canoni vmlinux-2.6.12-rc3-pa1-050425.dmp
10111b8c <__canonicalize_funcptr_for_compare>:
101265e8: e8 55 0b 3d  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
101265f8: e8 55 0b 1d  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
101327f8: e8 4f 07 1d  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10132804: e8 4f 07 05  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10132e80: e8 4f 1a 09  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10132e8c: e8 4f 19 f1  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10133308: e8 4f 10 f9  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10133314: e8 4f 10 e1  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
1013335c: e8 4f 10 51  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10133368: e8 4f 10 39  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
101340d4: e8 4e 15 65  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
101340e0: e8 4e 15 4d  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10134100: e8 4e 15 0d  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
1013410c: e8 4e 14 f5  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10134268: e8 4e 12 3d  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10134274: e8 4e 12 25  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
1013487c: e8 4e 06 15  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10134888: e8 4e 05 fd  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
1013583c: e8 4e 06 91  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
10135848: e8 4e 06 79  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
1013d7f8: e8 4a 07 19  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
1013d804: e8 4a 07 01  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
1013dab4: e8 4a 01 a1  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
1013dac0: e8 4a 01 89  b,l 10111b8c <__canonicalize_funcptr_for_compare>,rp
103bd7b0 <__ksymtab___canonicalize_funcptr_for_compare>:
103c1f24 <__kstrtab___canonicalize_funcptr_for_compare>:

yet another thought: is there any mean to inline this, to check this other hypothesis?

Thanks again,
     Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
