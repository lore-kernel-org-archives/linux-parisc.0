Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pogo.mtv1.steeleye.com (host194.steeleye.com [216.33.1.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id A9150482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 12:50:44 -0700 (MST)
Received: (from root@localhost)
	by pogo.mtv1.steeleye.com (8.9.3/8.9.3) id LAA09746
	for <parisc-linux@lists.parisc-linux.org>; Mon, 4 Feb 2002 11:50:34 -0800
Received: from mulgrave (jejb@localhost)
	by localhost.localdomain (8.11.6/linuxconf) with ESMTP id g14JoUm03211;
	Mon, 4 Feb 2002 13:50:30 -0600
Message-Id: <200202041950.g14JoUm03211@localhost.localdomain>
To: Helge Deller <deller@gmx.de>
Cc: James.Bottomley@HansenPartnership.com,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Helge Deller <deller@gmx.de>
   of "Sun, 03 Feb 2002 19:29:48 +0100." <200202031929.48891.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 04 Feb 2002 13:50:30 -0600
From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: [parisc-linux] Re: 53c700 (LASI SCSI 53c700) hang
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

What these errors tell me is that your HD accepted more tags than it could 
cope with and then choked.  Linux error handler isn't very good at handling 
this situation.  Also, your disc:

deller@gmx.de said:
>   Vendor: QUANTUM   Model: FIREBALL_TM3200S  Rev: 300X 

Is a known trouble causer with tag command queueing.  Initially, try taking 
the #define NCR_700_MAX_TAGS in drivers/scsi/53c700.h down to 4 or 2 and 
recompiling the driver.  Alternatively, turn off tagged command queueing 
altogether by commenting out this block of code:

	if(SCp->device->tagged_supported && !SCp->device->tagged_queue
	   && (hostdata->tag_negotiated &(1<<SCp->target)) == 0
	   && NCR_700_is_flag_clear(SCp->device, NCR_700_DEV_BEGIN_TAG_QUEUEING)) {
		/* upper layer has indicated tags are supported.  We don't
		 * necessarily believe it yet.
		 *
		 * NOTE: There is a danger here: the mid layer supports
		 * tag queuing per LUN.  We only support it per PUN because
		 * of potential reselection issues */
		printk(KERN_INFO "scsi%d: (%d:%d) Enabling Tag Command Queuing\n", SCp->
device->host->host_no, SCp->target, SCp->lun);
		hostdata->tag_negotiated |= (1<<SCp->target);
		NCR_700_set_flag(SCp->device, NCR_700_DEV_BEGIN_TAG_QUEUEING);
		SCp->device->tagged_queue = 1;
	}

in drivers/scsi/53c700.c at about line 1891.

I am getting around to adding the code changes to make this able to be done as 
module/kernel command line options.

James
