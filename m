From: Helge Deller <deller@gmx.de>
Subject: Re: [parisc-linux] netpoll support for lasi_82596
Date: Tue, 5 Jul 2005 22:43:32 +0200
Message-ID: <200507052243.32912.deller@gmx.de>
References: <878y0t66v5.fsf@deprecated.intranet.astaro.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <878y0t66v5.fsf@deprecated.intranet.astaro.de>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Thanks Sven,

I've applied your patch (with small modifications).

Helge

On Wednesday 29 June 2005 07:59, Sven Schnelle wrote:
> Hi,
> 
> i'm working on kgdb for linux-2.6, and added netpoll support to the
> lasi_82596 driver. Maybe we can add this patch?
> 
> ---------------------------------------------------------------
> Index: lasi_82596.c
> ===================================================================
> RCS file: /var/cvs/linux-2.6/drivers/net/lasi_82596.c,v
> retrieving revision 1.15
> diff -u -r1.15 lasi_82596.c
> --- lasi_82596.c	29 Nov 2004 19:56:12 -0000	1.15
> +++ lasi_82596.c	29 Jun 2005 05:25:40 -0000
> @@ -415,6 +415,9 @@
>  static int ticks_limit = 100;
>  static int max_cmd_backlog = TX_RING_SIZE-1;
>  
> +#if CONFIG_NET_POLL_CONTROLLER
> +static void i596_poll_controller(struct net_device *dev);
> +#endif
>  
>  static inline void CA(struct net_device *dev)
>  {
> @@ -1209,7 +1212,9 @@
>  	dev->set_multicast_list = set_multicast_list;
>  	dev->tx_timeout = i596_tx_timeout;
>  	dev->watchdog_timeo = TX_TIMEOUT;
> -
> +#ifdef CONFIG_NET_POLL_CONTROLLER
> +	dev->poll_controller = i596_poll_controller;
> +#endif
>  	dev->priv = (void *)(dev->mem_start);
>  
>  	lp = dev->priv;
> @@ -1242,6 +1247,14 @@
>  	return 0;
>  }
>  
> +#ifdef CONFIG_NET_POLL_CONTROLLER
> +static void i596_poll_controller(struct net_device *dev)
> +{
> +    disable_irq(dev->irq);
> +    i596_interrupt(dev->irq, dev, NULL);
> +    enable_irq(dev->irq);
> +}
> +#endif
>  
>  static irqreturn_t i596_interrupt(int irq, void *dev_id, struct pt_regs *regs)
>  {
> --------------------------------------------------------------------------------
> 
> Thanks,
> 
> Sven.
> -- 
> We've seen the restless children at the head of the columns
> Come to purify the future with the arrogance of youth
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
