Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id UAA04422
	for <parisc-linux@puffin.external.hp.com>; Sat, 2 Sep 2000 20:04:51 -0600
Date: Sat, 2 Sep 2000 21:07:13 -0500
From: Bob Pflederer <krp@rsn.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Boot error on C200+
Message-ID: <20000902210713.C987@localhost.localdomain>
References: <39B1822A.4E8F20AB@uswest.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="dc+cDN39EJAMEtIO"
In-Reply-To: <39B1822A.4E8F20AB@uswest.net>; from rbradetich@uswest.net on Sat, Sep 02, 2000 at 04:41:46PM -0600
List-ID: <linux-parisc.vger.kernel.org>


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I see this on C180.  It goes away if you modify entry.S to use
PA2.0-style tlb inserts instead of the PA1.1-style tlb inserts.
Try the attached patch.  It modifies the tlb miss handlers at startup to
use PA2.0 tlb inserts if you have a PA2.0 cpu.  PA-8000 docs claim
that PA1.1 tlb inserts are not supported, so I suspect we're hitting
a case that doesn't work.

Would someone who has CVS write access be willing to commit this
patch?  It's the last thing I need to make C180 work.

-Bob

On Sat, Sep 02, 2000 at 04:41:46PM -0600, Ryan Bradetich wrote:
> Hello,
> 
> I am getting the following error when I attempt to boot parisc-linux on
> the
> C200+.
> 
> VFS: Mounted root (nfs filesystem) readonly.
> execve /sbin/init c0270008 c0270030
> 
> Kernel Fault: Code=7 regs=c7f98248 (Addr=00000110)
> 
> PSW  : 0004000b  GR 1 : 00002000  GR 2 : 00013403  GR 3 : 00000000
> GR 4 : 2001ff74  GR 5 : 00000000  GR 6 : 000777f4  GR 7 : 000010c4
> GR 8 : 000011bc  GR 9 : c7f98000  GR10 : c022fa78  GR11 : c0270030
> GR12 : c0270008  GR13 : c022fe14  GR14 : c0270000  GR15 : 617bfdfb
> GR16 : c027c60c  GR17 : 00000000  GR18 : c02b0000  GR19 : 00000001
> GR20 : 00000037  GR21 : 00089b9c  GR22 : 00089bd8  GR23 : 000010c4
> GR24 : 2001ff74  GR25 : 00000001  GR26 : 00000000  GR27 : 00088f00
> GR28 : b64d8e60  GR29 : b44302d0  GR30 : 20020140  GR31 : 00022d63
> SR0  : 00002000  SR1  : fffd2dff  SR2  : 00000000  SR3  : 00002000
> SR4  : 00000000  SR5  : 00002000  SR6  : 00002000  SR7  : 00002000
> 
> IASQ : 00000000 00000000 IAOQ : 00000110 00000114 ORIG_R28 : ffdf7fff
>  IIR : 43ffff40 ISR : 00000000 IOR : 00000000
> 
> 
> 
> Paul Bame helped me start tracking this error down.  I wanted to post
> his
> analysis along with the boot message to this list for further comment.
> (Hopefully his analysis will help other how to start debugging these
> errors
> as Paul helped me.)
> 
> - Kernel Fault Code 7 is an Instruction Memory Protection Trap.
> 
> - Stack Pointer (GR30) is in user space.   Most of the time if the
> kernel
> is in kernel space GR30 will look like this: 0xcxxxxxxx.
> 
> - GR2 is often the address where a subroutine will return, so it tells
> where
> it was called from.  In this case: 00013403.
> 
> - The last two bits of GR2 are non-zero, which is consistent with a
> userspace program.
> 
> - Perform an objdump -d on sash and look for address 133f8.
>         (GR2 & 0xfffffffc) - 0x8 (two instructions).
> 
>    133f8:       e8 47 12 b4     b,l 22d58 <__libc_fcntl>,rp
>    133fc:       34 19 00 02     ldi 1,r25
>    13400:       8f 9f 20 50     cmpib,<> -1,ret0,13430
> <check_one_fd+0x44>
>    13404:       4b c2 3f 59     ldw -54(sr0,sp),rp
> 
> - Find out who/what called your kernel, by looking up the sysmbols in
> sash (Note the sasy binary must contain symbols):
> 
>     hppa-linux-nm -n sash | grep 22d58
> 
> 00022d58 W __fcntl
> 00022d58 T __libc_fcntl
> 00022d58 W fcntl
> 
> 
> I am going to start digging around in sash and glibc to see if I can
> figure out
> anymore information on this problem.  Any help/advice is appreciated.
> 
> Thanks,
> 
> Ryan
> 
> 
> 
> ---------------------------------------------------------------------------
> To unsubscribe: send e-mail to parisc-linux-request@thepuffingroup.com with
> `unsubscribe' as the subject.

--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="tlb.patch"

Index: arch/parisc/kernel/entry.S
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/arch/parisc/kernel/entry.S,v
retrieving revision 1.32
diff -u -p -r1.32 entry.S
--- entry.S	2000/08/30 22:28:35	1.32
+++ entry.S	2000/09/02 04:20:06
@@ -655,12 +655,18 @@ dtlb_miss:
 	depi		1,12,1,prot
 	extru,=         pte,_PAGE_USER_BIT,1,r0
 	depi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
+	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
+	depi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
 
 	/* Get rid of prot bits and convert to page addr for idtlba */
 
 	depi		0,31,12,pte
 	extru		pte,24,25,pte
 
+
+	/* The following may get patched with idtlb_insert_pa20 */
+	.export		idtlb_insert0,code
+idtlb_insert0:
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
 
@@ -671,6 +677,8 @@ dtlb_miss:
 
 	rfir
 	nop
+	.export		idtlb_insert0_end,code
+idtlb_insert0_end:
 
 itlb_miss:
 
@@ -712,6 +720,8 @@ itlb_miss_common:
 	copy            spc,prot        /* init prot with faulting space */
 	dep		pte,8,7,prot
 
+	extru,=		pte,_PAGE_NO_CACHE_BIT,1,r0
+	depi		1,12,1,prot
 	extru,=         pte,_PAGE_USER_BIT,1,r0
 	depi		7,11,3,prot   /* Set for user space (1 rsvd for read) */
 	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
@@ -722,6 +732,9 @@ itlb_miss_common:
 	depi		0,31,12,pte
 	extru		pte,24,25,pte
 
+	/* The following may get patched with idtlb_insert_pa20 */
+	.export		iitlb_insert,code
+iitlb_insert:
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
 
@@ -732,6 +745,8 @@ itlb_miss_common:
 
 	rfir
 	nop
+	.export		iitlb_insert_end,code
+iitlb_insert_end:
 
 itlb_miss_kernel:
 	b               itlb_miss_common
@@ -773,12 +788,18 @@ dbit_trap:
 	depi		1,12,1,prot
 	extru,=         pte,_PAGE_USER_BIT,1,r0
 	depi		7,11,3,prot /* Set for user space (1 rsvd for read) */
+	extru,= 	pte,_PAGE_GATEWAY_BIT,1,r0
+	depi		0,11,2,prot	/* If Gateway, Set PL2 to 0 */
 
 	/* Get rid of prot bits and convert to page addr for idtlba */
 
 	depi		0,31,12,pte
 	extru		pte,24,25,pte
 
+
+	/* The following may get patched with idtlb_insert_pa20 */
+	.export		idtlb_insert1,code
+idtlb_insert1:
 	mfsp		%sr1,t0  /* Save sr1 so we can use it in tlb inserts */
 	mtsp		spc,%sr1
 
@@ -789,7 +810,37 @@ dbit_trap:
 
 	rfir
 	nop
+	.export		idtlb_insert1_end,code
+idtlb_insert1_end:
+
+	.level		2.0
+	.text
+	.export		idtlb_insert_pa20,code
+idtlb_insert_pa20:
+        depd    	%r17,31,32,%r17
+        depdi   	0,46,15,%r17
+	idtlbt		%r16,%r17
+	rfir
+	nop
+	nop
+	nop
+	.export		idtlb_insert_pa20_end,code
+idtlb_insert_pa20_end:
+
+	.export		iitlb_insert_pa20,code
+iitlb_insert_pa20:
+        depd    	%r17,31,32,%r17
+        depdi   	0,46,15,%r17
+	iitlbt		%r16,%r17
+	rfir
+	nop
+	nop
+	nop
+	.export		iitlb_insert_pa20_end,code
+iitlb_insert_pa20_end:
 
+	.level		1.1
+	.text
 	.import handle_interruption,code
 
 kernel_bad_space:
Index: arch/parisc/kernel/traps.c
===================================================================
RCS file: /home/cvs/parisc/linux-2.3/arch/parisc/kernel/traps.c,v
retrieving revision 1.18
diff -u -p -r1.18 traps.c
--- traps.c	2000/08/28 20:16:11	1.18
+++ traps.c	2000/09/02 04:20:06
@@ -29,6 +29,7 @@
 #include <asm/atomic.h>
 
 #include <asm/smp.h>
+#include <asm/pgalloc.h>
 
 static inline void console_verbose(void)
 {
@@ -350,8 +351,7 @@ extern void fault_vector(void);
 
 int __init check_ivt(char * iva)
 {
-	int i;
-	u32 check = 0, *p;
+	u32 *p;
 
 	if(strcmp(iva, "cows can fly"))
 		return -1;
@@ -375,7 +375,55 @@ int __init check_ivt(char * iva)
 
 	return 0;
 }
+
+extern void iitlb_insert(), idtlb_insert0(), idtlb_insert1();
+extern void iitlb_insert_end(), idtlb_insert0_end(), idtlb_insert1_end();
+extern void iitlb_insert_pa20(), idtlb_insert_pa20();
+extern void iitlb_insert_pa20_end(), idtlb_insert_pa20_end();
+
+static inline void
+flush_kernel_icache_range(unsigned long start, unsigned long size)
+{
+	register unsigned long end = start + size;
+	register unsigned long i;
+
+	for (i = start; i <= end; i += L1_CACHE_BYTES) {
+		asm volatile("fic 0(%%sr0, %0)" : : "r" (i));
+	}
+}
+
+void
+trap_patch_tlb_inserts()
+{
+	int ilen = iitlb_insert_pa20_end-iitlb_insert_pa20;
+	int dlen = idtlb_insert_pa20_end-idtlb_insert_pa20;
 	
+	if(ilen != (iitlb_insert_end-iitlb_insert)) {
+		panic("trap_patch_tlb_inserts: iitlb_insert_pa20 bad size");
+	}
+	if(dlen != (idtlb_insert0_end-idtlb_insert0)) {
+		panic("trap_patch_tlb_inserts: idtlb_insert_pa20 bad size");
+	}
+	if(dlen != (idtlb_insert0_end-idtlb_insert0)) {
+		panic("trap_patch_tlb_inserts: idtlb_insert_pa20 bad size");
+	}
+
+	memcpy (iitlb_insert, iitlb_insert_pa20, ilen);
+	memcpy (idtlb_insert0, idtlb_insert_pa20, dlen);
+	memcpy (idtlb_insert1, idtlb_insert_pa20, dlen);
+
+	flush_kernel_dcache_range((unsigned long)iitlb_insert, ilen);
+	flush_kernel_dcache_range((unsigned long)idtlb_insert0, dlen);
+	flush_kernel_dcache_range((unsigned long)idtlb_insert1, dlen);
+
+	flush_kernel_icache_range((unsigned long)iitlb_insert, ilen);
+	flush_kernel_icache_range((unsigned long)idtlb_insert0, dlen);
+	flush_kernel_icache_range((unsigned long)idtlb_insert1, dlen);
+
+        asm volatile("sync");
+
+}
+
 void __init trap_init(void)
 {
 	volatile long eiem;
@@ -385,6 +433,9 @@ void __init trap_init(void)
 	
 	if(check_ivt((void *)fault_vector))
 		panic("IVT invalid");
+	if(boot_cpu_data.cpu_type >= pcxu) {
+		trap_patch_tlb_inserts();
+	}
 
 	mtctl(__pa(&fault_vector), 14);
 	mtctl(0, 30);

--dc+cDN39EJAMEtIO--
