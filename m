Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA17640
	for <parisc-linux@puffin.external.hp.com>; Wed, 24 Jan 2001 12:23:02 -0700
Received: from pc188-bre9.cable.ntl.com (HELO rhirst.linuxcare.com) (213.105.88.188)
  by mailserv2.iuinc.com with SMTP; 24 Jan 2001 19:26:55 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id B9B40B008; Wed, 24 Jan 2001 19:14:57 +0000 (GMT)
Date: Wed, 24 Jan 2001 19:14:57 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Greg Ingram <ingram@symsys.com>
Cc: Grant Grundler <grundler@cup.hp.com>, parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] C100 and newest CVS bits
Message-ID: <20010124191457.H3571@linuxcare.com>
References: <200101241708.JAA20961@milano.cup.hp.com> <Pine.LNX.4.21.0101241157050.25744-100000@maestro.symsys.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0101241157050.25744-100000@maestro.symsys.com>; from ingram@symsys.com on Wed, Jan 24, 2001 at 12:06:23PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jan 24, 2001 at 12:06:23PM -0600, Greg Ingram wrote:
> I've appended messages again.  Is the message from sim700 important?  Or
> is it just telling me that I don't have that hardware?  The very last line
> is different too.
> 
> - Greg
> 
> SCSI subsystem driver Revision: 1.00
> sim700: Configuring 53c710 (SCSI-ID 7) at ffd06100, IRQ 86, options 0
> scsi0: Revision 0x2
> Post test1, istat 01, sstat0 00, dstat 84
> sim700: WARNING IRQ probe failed, (returned 0)
> scsi0: Good, target data areas are dma coherent
> scsi0: test 1 completed ok.
> scsi0 : LASI/Simple 53c7xx
>   Vendor: SEAGATE   Model: ST11200N SUN1.05  Rev: 8358
>   Type:   Direct-Access                      ANSI SCSI revision: 02

That lot was from sim700, and is ok.

We are now entering the zalon (ncr53c8xx.c/zalon.c) driver.

> zalon_scsi_callback: Zalon vers field is 0x1, IRQ 34
> ncr53c8xx: 53c720 detected
> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> ncr53c720-0: restart (scsi reset).
> scsi1 : ncr53c8xx - version 3.3b
>   Vendor: SEAGATE   Model: ST32430W          Rev: HP05
>   Type:   Direct-Access                      ANSI SCSI revision: 02
> ncr53c720-0-<6,0>: tagged command queue depth set to 8

Now we are probing the sim700 scsi bus

> Detected scsi disk sda at scsi0, channel 0, id 0, lun 0

Now we are probing the FWD (zalon) scsi bus 

> Detected scsi disk sdb at scsi1, channel 0, id 6, lun 0

Now the system will try to access these disks looking for partition
tables.

> ccio-dma.c:460: Assertion pages_mapped failed!

Your original message (assert size > 0) implies that one of the scsi
drivers has passed down a request to map a zero length buffer.  That
is quite possible - a Test Unit Ready will likely have a zero length
buffer as there is no data phase, and a driver might just try and map
it anyway.  I'll have a look at the drivers shortly.  I cant explain
why it used to work though, unless previous versions of ccio-dma.c
handled zero length requests differently.

Richard
