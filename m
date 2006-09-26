From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] Can't write to hard drives on a K200
Date: Tue, 26 Sep 2006 12:13:10 +0000
Message-ID: <45191956.4060800@scarlet.be>
References: <4518662C.6020103@emenaker.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: Joe Emenaker <joe@emenaker.com>
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



Joe Emenaker wrote:
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
> Just in case it was a glitch in cfdisk, I tried writing from fdisk, as 
> well:
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
>   dd if=/dev/zero of=/dev/sda bs=512 count=10
> 
> That works fine. So.... anybody have any idea what's going on?
> 
If that doesn't matter to completely erase your disk try the same cmdl without count param, i.e.
	dd if=/dev/zero of=/dev/sda bs=512

Or to be quicker:
	dd if=/dev/zero of=/dev/sda bs=512k (e.g.)

(I don't remember where [c ]fdisk write its "partition table" but) my hypothesis is that could be out of first 5k?

btw, iirc you have severall other disks on this system, didn't you have the opportunity to switch this disk with another one 
  or, if possible, choose another disk (sdb, sdc, sdd?) to install your distro?

Hth,
	Joel
> 
> ------------------------------------------------------------------------
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
