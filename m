Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D45348D7
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 29 Jan 2004 02:25:24 -0700 (MST)
Date: Thu, 29 Jan 2004 10:25:20 +0100
Message-ID: <400CB8A1000070BA@ocpmta3.freegates.net>
In-Reply-To: <400CB8A100006ED8@ocpmta3.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 carlos
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>


>>Could you explain more about the failure?
>
>Well the pb is easy to decribe:
>the last messages the palo banner advising: "... If this is the last message
>you see ..." then the kernel do very early a hpmc. I so try to get piminfo
>but everything seems to point out of kernel :(. I so try to add some printk()
>just at begining of init() (in init/main.c just before lock_kernel()) but
>it seems to not even reach this point (but not quiet sure that it is a relevant
>place for printk() ). 

seems Ok :)

>So I suspect a pb in very early boot into head64.S or vmlinux.lds.S but
here
>I could insert printk() ?

Sorry for auto-reply but my suspicious was right: I just revert this patch:
===================================================================
RCS file: /var/lib/cvs/linux-2.5/arch/parisc/kernel/head64.S,v
retrieving revision 1.1.2.1
retrieving revision 1.1.2.2
diff -u -r1.1.2.1 -r1.1.2.2
--- linux-2.5/arch/parisc/kernel/head64.S	2002/12/24 22:15:01	1.1.2.1
+++ linux-2.5/arch/parisc/kernel/head64.S	2003/01/14 13:08:03	1.1.2.2
@@ -176,7 +176,9 @@
 #endif /* CONFIG_SMP */
 
 	/* Save the rfi target address */
-	std		%r11,  TASK_PT_GR11-TASK_SZ_ALGN(%sp)
+	ldo		-THREAD_SZ_ALGN(%sp), %r1
+	ldd		TI_TASK(%r1), %r1
+	std		%r11,  TASK_PT_GR11(%r1)
 
 #ifndef CONFIG_PDC_NARROW
 	/* Switch to wide mode; Superdome doesn't support narrow PDC
@@ -206,7 +208,9 @@
 
 stext_pdc_ret:
 	/* restore rfi target address*/
-	ldd		TASK_PT_GR11-TASK_SZ_ALGN(%sp), %r11
+	ldo		-THREAD_SZ_ALGN(%sp), %r1
+	ldd		TI_TASK(%r1), %r1
+	ldd		TASK_PT_GR11(%r1), %r11
 
 	/* PARANOID: clear user scratch/user space SR's */
 	mtsp	%r0,%sr0
@@ -310,7 +314,7 @@
 	load32		PA(smp_init_current_idle_task),%sp
 	ldd		0(%sp),%sp	/* load task address */
 	mtctl           %sp,%cr30       /* store in cr30 */
-	ldo             TASK_SZ_ALGN(%sp),%sp
+	ldo             THREAD_SZ_ALGN(%sp),%sp
 	tophys_r1       %sp
 
 	/* point CPU to kernel page tables */
=========><=========

and now it boots well but I am very not able to fix it correctly :(.

hth.

Thanks again,
    Joel


-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
