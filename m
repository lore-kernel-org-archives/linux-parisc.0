Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (cr821974-a.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 17774482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  4 Feb 2002 18:27:44 -0700 (MST)
Date: Mon, 4 Feb 2002 20:27:53 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: James Bottomley <James.Bottomley@HansenPartnership.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: 53c700 (LASI SCSI 53c700) hang
Message-ID: <20020204202753.B3465@systemhalted>
References: <deller@gmx.de> <200202041950.g14JoUm03211@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200202041950.g14JoUm03211@localhost.localdomain>; from James.Bottomley@HansenPartnership.com on Mon, Feb 04, 2002 at 01:50:30PM -0600
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

> What these errors tell me is that your HD accepted more tags than it could 
> cope with and then choked.  Linux error handler isn't very good at handling 
> this situation.  Also, your disc:
> 
> deller@gmx.de said:
> >   Vendor: QUANTUM   Model: FIREBALL_TM3200S  Rev: 300X 
> 
> Is a known trouble causer with tag command queueing.  Initially, try taking 
> the #define NCR_700_MAX_TAGS in drivers/scsi/53c700.h down to 4 or 2 and 
> recompiling the driver.  Alternatively, turn off tagged command queueing 
> altogether by commenting out this block of code:
> 
> I am getting around to adding the code changes to make this able to be done as 
> module/kernel command line options.
> 
> James
>

I've been having problems with the driver for quite some time now.

SCSI subsystem driver Revision: 1.00
53c700: consistent memory allocation failed
53c700: Version 2.6 By James.Bottomley@HansenPartnership.com
scsi0: 53c700 rev 0 
scsi0 : LASI SCSI 53c700
  Vendor: FUJITSU   Model: M2694ES-512       Rev: 8134
  Type:   Direct-Access                      ANSI SCSI revision: 02
Attached scsi disk sda at scsi0, channel 0, id 6, lun 0
SCSI device sda: 2117025 512-byte hdwr sectors (1084 MB)
Partition check:
 sda: sda1 sda2

Compiled kernel with tag queue code _always_ disabled (2.4.17-pa18 from CVS).

#ifdef NEVERCOMIPLE
        if(SCp->device->tagged_supported && !SCp->device->tagged_queue
           && (hostdata->tag_negotiated &(1<<SCp->target)) == 0
           && NCR_700_is_flag_clear(SCp->device, NCR_700_DEV_BEGIN_TAG_QUEUEING)) {
                /* upper layer has indicated tags are supported.  We don't
                 * necessarily believe it yet.
                 *
                 * NOTE: There is a danger here: the mid layer supports
                 * tag queuing per LUN.  We only support it per PUN because
                 * of potential reselection issues */
                printk(KERN_INFO "scsi%d: (%d:%d) Enabling Tag Command Queuing\n", SCp->device->host->host_no, SCp->target, SCp->lun);
                hostdata->tag_negotiated |= (1<<SCp->target);
                NCR_700_set_flag(SCp->device, NCR_700_DEV_BEGIN_TAG_QUEUEING);
                SCp->device->tagged_queue = 1;
        }
#endif

in drivers/scsi/53c700.c at about line 1891.

Start up one of those real-world scripts :}

#!/bin/tcsh
while ( 1 )
find /bin | xargs cat > /dev/null
find /boot | xargs cat > /dev/null
find /etc | xargs cat > /dev/null
find /root | xargs cat > /dev/null
find /sbin | xargs cat > /dev/null
find /tmp | xargs cat > /dev/null
find /usr | xargs cat > /dev/null
find /var | xargs cat > /dev/null
end

root@node44:/proc/scsi/lasi700# cat 0
Total commands outstanding: 1
Target  Depth  Active  Next Tag
======  =====  ======  ========
  6: 0     16       1         0


10 minutes into the run, the find _and_ cat are D on the process list.
The drive is officially unresponsive around this point... maybe it was
just cat and find you say?

Soon after, kupdated goes into D aswell. From there on in the box is
locking up left right and center. I wish I had kdb and could see what's
going on.

I've repeated this lockup 3 times.

Most intersting is that when I reenable the Tag queueing code but change
the Tag depth to 2 (instead of 16). The machine doesn't seem to hang.
I have a box currently running well over the 10 minute mark that I will
leave running until tommorow.

The sim700 driver runs poorly, but happily for days... generating heat :)
Sadly, the sim700 driver is currently only functionaly with the older kernels.
I'm using 2.4.9-pa25 to run the 715/50's in our cluster (diskless boxes run
the latest kernel no problems).

Any thoughts? 

Is the issue as simple as: 

Leave Tag queuing in, but set depth to something low (2 or 4).

Good: 	Tag Queu, Depth = 2

Bad: 	No Tag Queue. 
	Tag Queue, Depth = 16.

c.
 
