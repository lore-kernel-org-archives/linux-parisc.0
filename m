From: James Bottomley <James.Bottomley@SteelEye.com>
Subject: Re: [parisc-linux] J5000 LED LCD patch (take 2)
Date: Thu, 24 Mar 2005 14:05:14 -0600
Message-ID: <1111694714.5519.28.camel@mulgrave>
References: <200503241848.57598.dmp@davidmpye.dyndns.org>
Mime-Version: 1.0
Content-Type: text/plain
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: dmp@davidmpye.dyndns.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503241848.57598.dmp@davidmpye.dyndns.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, 2005-03-24 at 18:48 +0000, David Pye wrote:
> +                       set_current_state(TASK_UNINTERRUPTIBLE);                
> +                       schedule_timeout(wait_jiffies); 

The two uses of this should become msleep().  schedule_timeout() is
deprecated in the kernel now.

> +       /* Requeue ourself to run in 5 jiffies */       
> +       queue_delayed_work(led_wq, &led_task, 5);

This is wrong too.  The value of HZ (the rate at which jiffies tick) has
been tampered with several times over the course of the years.  All
timing related quantites need to be expressed in terms of HZ to ensure
they remain constant.

We actually have a class of machines for whom HZ=100 so you'll be
waiting ten times longer than you expect on these...


> +               if (cancel_delayed_work(&led_task) == 0) 
> +                       flush_workqueue(led_wq);

This should really be done using 

cancel_rearming_delayed_workqueue()

Unfortunately, someone needs to get that symbol exported.

This added strlcpy is redundant:


> +       /* copy display string to buffer for procfs */
> +       strlcpy(lcd_text, str, sizeof(lcd_text));
>  
>         /* copy display string to buffer for procfs */
>         strlcpy(lcd_text, str, sizeof(lcd_text));
> 

James



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
