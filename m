Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 140FE482A
	for <parisc-linux@parisc-linux.org>; Tue,  7 Aug 2001 04:57:00 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 570A5B00C; Tue,  7 Aug 2001 11:58:17 +0100 (BST)
Date: Tue, 7 Aug 2001 11:58:17 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: "parisc-linux@parisc-linux.org" <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] The final patch for the keyboard problem
Message-ID: <20010807115817.A1011@linuxcare.com>
References: <3B6F986D.FA89E147@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3B6F986D.FA89E147@esiee.fr>; from marteaut@esiee.fr on Tue, Aug 07, 2001 at 09:27:41AM +0200
List-ID: <linux-parisc.vger.kernel.org>

Hi Thimas,

On Tue, Aug 07, 2001 at 09:27:41AM +0200, Thomas Marteau wrote:

> +static int cmd_status;

Calling this awaiting_ack, and setting it true/false might make the code
more readable.  Also I suspect it should be volatile really, as it is
modified via an interrupt handler.

> +	cmd_status=2;
> +	while (cmd_status!=0) {
> +		write_output(KBD_CMD_SET_LEDS, lasikbd_hpa);
> +		mdelay(1); 
> +	}

Nasty, as it will hang the kernel if the keyboard never ACKs.  Should at
least limit the muber of times you loop here.

> +		while ((read_status(hpa) & LASI_STAT_TBNE)==0x01);

Why not simply

		while ((read_status(hpa) & LASI_STAT_TBNE))
			;

> +	do {
> +		while ((read_status(hpa) & LASI_STAT_TBNE)==0x01);
> +		gsc_writeb(0x00, hpa+LASI_XMTDATA);
> +		
> +		while ((read_status(hpa) & LASI_STAT_RBNE)==0x00);
> +   
> +		while ((read_status(hpa) & LASI_STAT_RBNE)==0x01) {
> +			data=read_input(hpa);
> +			fail++; 
> +			if(fail==10) break; 
> +		}
> +   	}while(data!=AUX_REPLY_ACK); 

Do you really want the third 'while' loop in that block of code?

	loop = 10;
	do {
		while ((read_status(hpa) & LASI_STAT_TBNE))
			;
		gsc_writeb(0x00, hpa+LASI_XMTDATA);
		while (!(read_status(hpa) & LASI_STAT_RBNE))
			;
		data = read_input(hpa);
		loop--;
	} while (data != AUX_REPLY_ACK && loop);

One less while loop, but it can still hang in either of the first two while
loops if the h/w misbehaves.

> +        /* allocate the irq and memory region for that device */
> +	if (!(irq = busdevice_alloc_irq(d)))
> +		return -ENODEV;
> +		    
> +	if (request_irq(irq, lasikbd_interrupt, 0, name, hpa))
> +		return -ENODEV;
> +	
> +	if (!request_mem_region((unsigned long)hpa, LASI_STATUS + 4, name))
> +		return -ENODEV;

Typically a driver would release resources before exiting.  e.g. if
request_mem_region() fails you should release_irq().

There are a couple of compiler warnings also.

Anyway, I'm about to try it on a couple of machines here; I'll let you
know how it goes.

Cheers,
  Richard
