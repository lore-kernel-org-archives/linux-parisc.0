From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: zalon/ncr53c720 crashes K460  (parisc port) on bootup.
Date: Sat, 27 Sep 2003 18:23:33 +0100
Message-ID: <20030927172333.GS24824__21658.9864613072$1416622817$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <1064634188.641.27.camel@laptop.bradetich.net> <1064677551.2002.20.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	SCSI Mailing List <linux-scsi@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1064677551.2002.20.camel@mulgrave>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Sat, Sep 27, 2003 at 10:45:50AM -0500, James Bottomley wrote:
> This should fix the panic, but it simply detaches correctly.

Necessary, but not sufficient, I think ... look at ncr_attach().
It doesn't zero hostdata->ncb.  Adding that is easy enough ... I'm about
to commit a patch to the parisc tree containing this fix.

> ===== drivers/scsi/ncr53c8xx.c 1.37 vs edited =====
> --- 1.37/drivers/scsi/ncr53c8xx.c	Thu Sep 25 20:08:49 2003
> +++ edited/drivers/scsi/ncr53c8xx.c	Sat Sep 27 09:44:21 2003
> @@ -8585,12 +8585,17 @@
>  
>  int ncr53c8xx_release(struct Scsi_Host *host)
>  {
> +	ncb_p np;
> +	struct host_data *host_data;
> +
>  #ifdef DEBUG_NCR53C8XX
> -printk("ncr53c8xx : release\n");
> +	printk("ncr53c8xx : release\n");
>  #endif
> -     ncr_detach(((struct host_data *) host->hostdata)->ncb);
> +	if((host_data = (struct host_data *)host->hostdata) &&
> +	   host_data->ncb)
> +		ncr_detach(host_data->ncb);
>  
> -     return 1;
> +	return 1;
>  }
>  
> 
> ===== drivers/scsi/zalon.c 1.11 vs edited =====
> --- 1.11/drivers/scsi/zalon.c	Thu Sep 25 20:08:51 2003
> +++ edited/drivers/scsi/zalon.c	Sat Sep 27 10:31:52 2003
> @@ -146,7 +146,7 @@
>  
>  	host = ncr_attach(&zalon7xx_template, unit, &device);
>  	if (!host)
> -		goto fail;
> +		goto out;
>  
>  	if (request_irq(irq, ncr53c8xx_intr, SA_SHIRQ, dev->dev.bus_id, host)) {
>  		printk(KERN_ERR "%s: irq problem with %d, detaching\n ",
> @@ -169,6 +169,7 @@
>  	free_irq(irq, host);
>   fail:
>  	ncr53c8xx_release(host);
> + out:
>  	return error;
>  }

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
