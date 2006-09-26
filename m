From: "Michael S. Zick" <mszick@morethan.org>
Subject: Re: SPAM: [parisc-linux] Can't write to hard drives on a K200
Date: Mon, 25 Sep 2006 19:06:15 -0500
Message-ID: <200609251906.15570.mszick@morethan.org>
References: <4518662C.6020103@emenaker.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4518662C.6020103@emenaker.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Mon September 25 2006 18:28, Joe Emenaker wrote:
> I've booted a Gentoo install CD, which puts me in a root shell. The 
> first step, I guess, is to partition the drives... but the thing won't 
> let me.
> 
>  > When I try to write from "cfdisk /dev/sda", it gives me:
>  > Wrting partition table to disk...
>  > end_request: I/O error, dev sda, sector 0
>  > Buffer I/O error on device sda, logical block 0
>  > lost page write due to I/O error on sda
>  > SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
> 
> Just in case it was a glitch in cfdisk, I tried writing from fdisk, as well:
> 
>  > Calling ioctl() to re-read partition table.
>  > end_request: I/O error, dev sda, sector 0
>  > Buffer I/O error on device sda, logical block 0
>  > lost page write due to I/O error on sda
>  > SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
>  > sda: Write Protect is off
>  > SCSI device sda: drive cache: write through w/ FUA
>  > SCSI device sda: 8388314 512-byte hdwr sectors (4295 MB)
>  > sda: Write Protect is off
>  > SCSI device sda: drive cache: write through w/ FUA
> 
> Hrmmm.... so maybe the disks are read-only somehow, right? Well then how 
> come I can dd like so:
> 
>    dd if=/dev/zero of=/dev/sda bs=512 count=10
> 
> That works fine. So.... anybody have any idea what's going on?
> 

Other problems have been report on other models that also use the ncr53c720
driver -  most often filesystem corruption.

The problem has not yet been isolated - might be the driver code or the
hardware adapter code used with that scsi adapter.

In contrast, some pci add-in cards that use the driver are known to work(???).

Translation: Something is wrong, no one has yet offered a solution.

Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
