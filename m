Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id EA80548AB
	for <parisc-linux@lists.parisc-linux.org>;
	Mon,  2 Feb 2004 03:25:34 -0700 (MST)
Date: Mon, 2 Feb 2004 11:25:08 +0100
Message-ID: <401530610000500D@ocpmta1.freegates.net>
In-Reply-To: <20040201200540.GG959@tausq.org>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 carlos
To: "Randolph Chung" <randolph@tausq.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: James Bottomley <James.Bottomley@steeleye.com>,
	Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Randolph,

Very sorry but it doesn't works :( 
(Sorry also if I couldn't help more: my knowledge of kernel internals is
still too limited :( )

Thanks for your attention,
    Joel


>-- Original Message --
>Date: Sun, 1 Feb 2004 12:05:40 -0800
>From: Randolph Chung <randolph@tausq.org>
>To: Joel Soete <soete.joel@tiscali.be>
>Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
>	James Bottomley <James.Bottomley@steeleye.com>,
>	parisc-linux@lists.parisc-linux.org
>Reply-To: Randolph Chung <randolph@tausq.org>
>Subject: Re: [parisc-linux] RE: [parisc-linux-cvs] linux-2.6 carlos
>
>
>> Sorry for auto-reply but my suspicious was right: I just revert this patch:

can you try this one instead?

randolph

Index: arch/parisc/kernel/head64.S
===================================================================
RCS file: /var/cvs/li
>ux-2.6/arch/parisc/kernel/head64.S,v
retrieving revision 1.3
diff -u -p -r1.3 head64.S
--- arch/parisc/kernel/head64.S 17 Jan 2004 15:00:32 -0000      1.3
+++ arch/parisc/kernel/head64.S 1 Feb 2004 18:09:13 -0000
@@ -165,8 +165,7 @@ common_stext:

> #endif /* CONFIG_SMP */

        /* Save the rfi target address */
-       ldo             -THREAD_SZ_ALGN(%sp), %r1
-       ldd             TI_TASK(%r1), %r1
+       ldd             TI_TASK-THREAD_SZ_ALGN(%sp), %r1
        std             %r11,
> TASK_PT_GR11(%r1)

 #ifndef CONFIG_PDC_NARROW
@@ -301,7 +300,8 @@ smp_slave_stext:

        /*  Initialize the SP - monarch sets up smp_init_current_idle_task
*/
        load32          PA(smp_init_current_idle_task),%sp
-       ldd            
>0(%sp),%sp      /* load task address */
+       ldd             0(%sp),%sp      /* load thread_info address */
+       ldd             TASK_THREAD_INFO(%sp), %sp
        mtctl           %sp,%cr30       /* store in cr30 */
        ldo             TH
>EAD_SZ_ALGN(%sp),%sp
        tophys_r1       %sp



-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
