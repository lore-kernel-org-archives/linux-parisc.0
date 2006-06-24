From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [PATCH] flush our cache through tmpalias space
Date: Sat, 24 Jun 2006 20:36:21 +0000
Message-ID: <449DA245.2020705@tiscali.be>
References: <1150925123.8456.56.camel@mulgrave.il.steeleye.com>
	<1151117721.3450.24.camel@mulgrave.il.steeleye.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1151117721.3450.24.camel@mulgrave.il.steeleye.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



James Bottomley wrote:
> On Wed, 2006-06-21 at 16:25 -0500, James Bottomley wrote:
> 
>>One of the current disadvantages parisc has is that we have to walk the
>>inode mapping list to do a flush_dcache_page(), which means we get
>>entangled in locking.  The reason we do this is because a VIPT cache
>>can't be flushed without a mapping, so we have to find one to use
>>
>>The intent of this patch is to instead flush through the tmpalias space
>>on the correct congruence boundary which would dispense with the need
>>for finding a mapping at all.  However, in the current incarnation we
>>still walk the mappings to check that all the usermappings are, indeed,
>>on the correct congruence boundary.  Unfortunately, as you'll see if you
>>try it out, not all are ... which is a bit of a problem.
> 
> 
> This patch is current and tested against 2.6.17-pa4.  It might eat your
> data but I'm reasonably assured it won't kill kittens.
> 
> James
> 
Thanks a lot.

Just met a small compile pb:

gcc -Wp,-MD,arch/parisc/kernel/.entry.o.d  -nostdinc -isystem /usr/lib/gcc/hppa-linux-gnu/4.0.4/include -D__KERNEL__ -Iinclude 
-Iinclude2 -I/usr/src/linux-2.6.17-pa4/include -include include/linux/autoconf.h -D__ASSEMBLY__ -traditional  -c -o 
arch/parisc/kernel/entry.o /usr/src/linux-2.6.17-pa4/arch/parisc/kernel/entry.S
/usr/src/linux-2.6.17-pa4/arch/parisc/kernel/entry.S: Assembler messages:
/usr/src/linux-2.6.17-pa4/arch/parisc/kernel/entry.S:1369: Error: Unknown opcode: `mstp'
/usr/src/linux-2.6.17-pa4/arch/parisc/kernel/entry.S:1630: Error: Unknown opcode: `mstp'
/usr/src/linux-2.6.17-pa4/arch/parisc/kernel/entry.S:1653: Error: symbol `dtlb_check_alias_20' is already defined
make[2]: *** [arch/parisc/kernel/entry.o] Error 1

effectively mstp doesn't exist but well mtsp?

For the second error it cames from this hunck:
@@ -1617,6 +1645,14 @@

  	f_extend	pte,t0	

+	iitlbt          pte,prot
+
+	rfir
+	nop
+	
+dtlb_check_alias_20:
+	do_alias	spc,t0,t1,va,pte,prot,itlb_fault
+	
  	iitlbt          pte,prot

  	rfir

Shouldn't it be here 'itlb_check_alias_20:'?

My 2pence diff looks like:
--- arch/parisc/kernel/entry.S.Orig     2006-06-24 22:35:19.000000000 +0200
+++ arch/parisc/kernel/entry.S  2006-06-24 22:55:49.000000000 +0200
@@ -1366,7 +1366,7 @@
         idtlba          pte,(%sr1,va)
         idtlbp          prot,(%sr1,va)

-       mstp            t0,%sr1         /* Restore sr1 */
+       mtsp            t0,%sr1         /* Restore sr1 */

         rfir
         nop
@@ -1627,7 +1627,7 @@
         iitlba          pte,(%sr1,va)
         iitlbp          prot,(%sr1,va)

-       mstp            t0,%sr1         /* Restore sr1 */
+       mtsp            t0,%sr1         /* Restore sr1 */

         rfir
         nop
@@ -1650,7 +1650,7 @@
         rfir
         nop

-dtlb_check_alias_20:
+itlb_check_alias_20:
         do_alias        spc,t0,t1,va,pte,prot,itlb_fault

         iitlbt          pte,prot

Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
