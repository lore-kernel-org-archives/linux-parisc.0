Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from eightythree.valleybikes.com (valleybikes.com [24.123.22.113])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1D6B2482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Nov 2002 10:13:21 -0700 (MST)
Subject: Re: [parisc-linux] Disk problems
From: James Smith <james@compusmithllc.com>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021123015234.15604.qmail@web12501.mail.yahoo.com>
References: <20021123015234.15604.qmail@web12501.mail.yahoo.com>
Content-Type: text/plain
Date: 25 Nov 2002 12:13:15 -0500
Message-Id: <1038244395.441.13.camel@seventy>
Mime-Version: 1.0
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

its the original seagate disk that came with it

the disk still works in the mac, so its not dead

i dont have anything other than macs & the workstations that are scsi

would a low level format on the mac do the same as low level using an
adaptec card ?

James S




On Fri, 2002-11-22 at 20:52, Derek Engelhaupt wrote:
> 
> Well quit putting them in those darn macs....just kidding.  Who makes the disk?  IBM has certain tools like their drive fitness tests that has saved me a few times.  Seagate and others probably have similar tools.  Check their support sites and it may just be a matter of the wrong block size written by your mac.  IBM drives are especially notorious for having weird block sizes and such.
> derek
>  James Smith <james@compusmithllc.com> wrote:I just got a pile of 712/60's - $80 for 10 of em :)
> 
> 
> i've set one up & now i'm going through the disks one at a time &
> cloning them as its quicker than going through the install each time
> 
> 
> i've hit one disk that gives me this whenever i try to fdisk it 
> 
> 
> sixty:~# fdisk /dev/sdb
> 
> Unable to read /dev/sdb
> 
> 
> when i tried to zero the disk, i got this....
> 
> sixty:~# dd if=/dev/zero of=/dev/sdb count=1 bs=512 
> dd: writing `/dev/sdb': Input/output error
> 1+0 records in
> 0+0 records out
> 
> the console sees the disk when i use search 
> 
> does this indicate a dead disk?
> 
> the disk was ok until i put it into a mac......
> 
> James S
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
> ---------------------------------
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now
