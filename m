Return-Path: <soete.joel@tiscali.be>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BD4848A2
	for <parisc-linux@lists.parisc-linux.org>;
	Sat, 31 Jan 2004 17:38:33 -0700 (MST)
Message-ID: <401C4B13.3060906@tiscali.be>
Date: Sun, 01 Feb 2004 00:40:51 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
Cc: parisc-linux@lists.parisc-linux.org
References: <400CB8A1000070BA@ocpmta3.freegates.net>
In-Reply-To: <400CB8A1000070BA@ocpmta3.freegates.net>
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] About 2.6 64bit on b2k?
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi all,

About this :
> 
> Sorry for auto-reply but my suspicious was right: I just revert this patch:
> ===================================================================
> RCS file: /var/lib/cvs/linux-2.5/arch/parisc/kernel/head64.S,v
> retrieving revision 1.1.2.1
> retrieving revision 1.1.2.2
> diff -u -r1.1.2.1 -r1.1.2.2
> --- linux-2.5/arch/parisc/kernel/head64.S	2002/12/24 22:15:01	1.1.2.1
> +++ linux-2.5/arch/parisc/kernel/head64.S	2003/01/14 13:08:03	1.1.2.2
> @@ -176,7 +176,9 @@
>  #endif /* CONFIG_SMP */
>  
>  	/* Save the rfi target address */
> -	std		%r11,  TASK_PT_GR11-TASK_SZ_ALGN(%sp)
> +	ldo		-THREAD_SZ_ALGN(%sp), %r1
> +	ldd		TI_TASK(%r1), %r1
> +	std		%r11,  TASK_PT_GR11(%r1)
>  
>  #ifndef CONFIG_PDC_NARROW
>  	/* Switch to wide mode; Superdome doesn't support narrow PDC
> @@ -206,7 +208,9 @@
>  
>  stext_pdc_ret:
>  	/* restore rfi target address*/
> -	ldd		TASK_PT_GR11-TASK_SZ_ALGN(%sp), %r11
> +	ldo		-THREAD_SZ_ALGN(%sp), %r1
> +	ldd		TI_TASK(%r1), %r1
> +	ldd		TASK_PT_GR11(%r1), %r11
>  
>  	/* PARANOID: clear user scratch/user space SR's */
>  	mtsp	%r0,%sr0
> @@ -310,7 +314,7 @@
>  	load32		PA(smp_init_current_idle_task),%sp
>  	ldd		0(%sp),%sp	/* load task address */
>  	mtctl           %sp,%cr30       /* store in cr30 */
> -	ldo             TASK_SZ_ALGN(%sp),%sp
> +	ldo             THREAD_SZ_ALGN(%sp),%sp
>  	tophys_r1       %sp
>  
>  	/* point CPU to kernel page tables */
> =========><=========
> 
> and now it boots well but I am very not able to fix it correctly :(.
> 
> hth.
> 
I don't understand why it works on c3k and not on b2k. Could it be because by b2k has only 256k of physical ram?

Also, I notice that in head64.S there aren't .import like:
[snip]
         .import init_thread_union,data
         .import $global$                /* forward declaration */
         .import fault_vector_11,code    /* IVA parisc 1.1 32 bit */
         .import fault_vector_20,code    /* IVA parisc 2.0 32 bit */

[snip]

as in its 32bit brother head.S

I don't yet find the meaning of '.import' but just in case ;)

hth,
	Joel
