Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hauptpostamt.charite.de (hauptpostamt.charite.de [193.175.66.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 146B94840
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Jul 2002 06:22:45 -0600 (MDT)
Received: from postamt1.charite.de (postamt1.charite.de [193.175.66.246])
	by hauptpostamt.charite.de (Postfix) with ESMTP id ACF3B15C02E
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Jul 2002 14:22:43 +0200 (CEST)
Date: Thu, 4 Jul 2002 14:22:42 +0200
From: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Power Button doesn't turn machine off anymore
Message-ID: <20020704122241.GY19722@charite.de>
References: <20020702190606.GA3678@systemhalted> <20020702190842.GR25586@charite.de> <20020702192147.GC3678@systemhalted> <20020702193116.GU25586@charite.de> <20020703052415.GB32490@charite.de> <20020703121306.GA8464@systemhalted> <20020703121737.GS15228@charite.de> <20020703164631.F0CE2483A@dsl2.external.hp.com> <20020703165234.GG13244@charite.de> <20020703203227.GE9009@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020703203227.GE9009@systemhalted>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Am 03.07.2002 um 16:32:27 -0400 schrieb Carlos O'Donell folgendes:

> Could you please try this out and see if you see anything in your logs :)

Applied. Rebuilding now. Will try it out when I'm back home.

> --- ./arch/parisc/kernel/power.c	Tue Jul  2 15:17:59 2002
> +++ ./arch/parisc/kernel/power.c	Wed Jul  3 16:28:47 2002
> @@ -55,6 +55,7 @@
>  #include <asm/led.h>
>  #include <asm/uaccess.h>
>  
> +#define DEBUG
>  
>  #ifdef DEBUG
>  # define DPRINTK(x) printk x
> @@ -123,6 +124,8 @@
>  /* check, give feedback and start shutdown after one second */
>  static void process_shutdown(void)
>  {
> +	DPRINTK((KERN_INFO "Processing shutodwn...\n"));
> +
>  	if (shutdown_timer == 0)
>  		DPRINTK((KERN_INFO "Shutdown requested...\n"));
>  
> @@ -181,7 +184,12 @@
>  static void polling_tasklet_func(unsigned long soft_power_reg)
>  {
>          unsigned long current_status;
> -	
> +
> +#ifdef DEBUG
> +	/* CAO July 3, 2002 - Prove we are using gecko tasklet */
> +	BUG();
> +#endif
> +
>  	if (!pwrsw_enabled)
>  		return;
>  
> @@ -362,6 +370,8 @@
>  	power_remove_procfs();
>  	power_tasklet.func = NULL;
>  	pdc_soft_power_button(0);
> +
> +	printk(KERN_INFO "Soft power switch disabled.\n");
>  }
>  
>  module_init(power_init);


-- 
Ralf Hildebrandt (Im Auftrag des Referat V A)   Ralf.Hildebrandt@charite.de
Charite Campus Virchow-Klinikum                 Tel.  +49 (0)30-450 570-155
Referat V A - Kommunikationsnetze -             Fax.  +49 (0)30-450 570-916
Why you can't find your system administrators:
The admin electroculted themselves whilst installing some cabling near the main power cable. Since the admin's body is the only thing keeping the power flowing, the management boarded up the body and pretended they still had a system administrator. 
