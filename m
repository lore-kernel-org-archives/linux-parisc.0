From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Re: 2.6.14-rc2-pa2 ccio patch
Date: Thu, 29 Sep 2005 18:04:03 +0000
Message-ID: <433C2C93.6060602@tiscali.be>
References: <20050929063554.51BCD494003@palinux.hppa>
	<20050929064709.GA22206@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050929064709.GA22206@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Grant Grundler wrote:
> On Thu, Sep 29, 2005 at 12:35:54AM -0600, Grant Grundler wrote:
> 
[...]

> -	asm volatile("fdc 0(%0)" : : "r" (pdir_ptr));
> +	asm volatile("fdc %%r0(%%sr0,%0)" : : "r" (pdir_ptr));
>  	asm volatile("sync");
did I well undurstand my reading (pa11_acd.pdf):
the mnemonics 'fdc,cmplt x(s,b)' and 'fic,cmplt x(sr,b)' refer well x as 'the index register'.

So may be have a common writing:
--- arch/parisc/kernel/pacache.S.Orig   2005-09-29 16:09:03.000000000 +0200
+++ arch/parisc/kernel/pacache.S        2005-09-29 18:21:56.000000000 +0200
@@ -227,7 +227,7 @@

  fimanyloop:                                    /* Loop if LOOP >= 2 */
         ADDIB>          -1, %r31, fimanyloop    /* Adjusted inner loop decr */
-       fice            0(%sr1, %arg0)
+       fice            %r0(%sr1, %arg0)
         fice,m          %arg1(%sr1, %arg0)      /* Last fice and addr adjust */
         movb,tr         %arg3, %r31, fimanyloop /* Re-init inner loop count */
         ADDIB<=,n       -1, %arg2, fisync       /* Outer loop decr */
@@ -269,7 +269,7 @@

  fdmanyloop:                                    /* Loop if LOOP >= 2 */
         ADDIB>          -1, %r31, fdmanyloop    /* Adjusted inner loop decr */
-       fdce            0(%sr1, %arg0)
+       fdce            %r0(%sr1, %arg0)
         fdce,m          %arg1(%sr1, %arg0)      /* Last fdce and addr adjust */
         movb,tr         %arg3, %r31, fdmanyloop /* Re-init inner loop count */
         ADDIB<=,n       -1, %arg2, fdsync       /* Outer loop decr */
--- arch/parisc/kernel/signal.c.Orig    2005-09-29 16:02:29.000000000 +0200
+++ arch/parisc/kernel/signal.c 2005-09-29 18:34:32.000000000 +0200
@@ -296,7 +296,7 @@
         struct rt_sigframe __user *frame;
         unsigned long rp, usp;
         unsigned long haddr, sigframe_size;
-       struct siginfo si;
+
         int err = 0;
  #ifdef __LP64__
         compat_int_t compat_val;
@@ -627,9 +627,9 @@

                         /* Stack is 64-byte aligned, and we only
                          * need to flush 1 cache line */
-                       asm("fdc 0(%%sr3, %0)\n"
+                       asm("fdc %%r0(%%sr3, %0)\n"
                             "sync\n"
-                           "fic 0(%%sr3, %0)\n"
+                           "fic %%r0(%%sr3, %0)\n"
                             "sync\n"
                             : : "r"(regs->gr[30]));

====<>====

(this hunk:
-       struct siginfo si;
to get rid of a compiler warning)

Hth,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
