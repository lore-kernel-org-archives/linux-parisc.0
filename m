Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sgate.charlysworld.de (pD9541EB0.dip.t-dialin.net [217.84.30.176])
	by dsl2.external.hp.com (Postfix) with ESMTP id C7754482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Apr 2001 07:08:49 -0600 (MDT)
Received: from localhost (xam@localhost)
	by sgate.charlysworld.de (8.11.0/8.11.0) with ESMTP id f3BD8kF05959
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Apr 2001 15:08:47 +0200
Date: Wed, 11 Apr 2001 15:08:46 +0200 (CEST)
From: "M. Grabert" <xam@grabert.net>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 9000/730 booting but SCSI Problems (mke2fs)
In-Reply-To: <20010409225507.RNIM272.mta05-svc.ntlworld.com@mustain.demon.co.uk>
Message-ID: <Pine.LNX.4.21.0104111501310.5108-100000@sgate.charlysworld.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Mon, 9 Apr 2001, Jeff Arthur wrote:

> however I now have a problem with SCSI, all 
> devices are seen ok, have removed cdrom as I 
> noted in some earlier posts that this could 
> cause problems, but when creating filesystems 
> the SCSI dies.
> 
> I have tried a couple of drives, boot log looks 
> fine.  Any Suggestions or is this just down to 
> lack of docs in this area, as I noted from posts 
> back in Feb?
> 
> hpbox:~# mke2fs /dev/sda3
> mke2fs 1.19, 13-Jul-2000 for EXT2 FS 0.5b, 95/08/09
> Filesystem label=
> OS type: Linux
> Block size=4096 (log=2)
> Fragment size=4096 (log=2)
> 71520 inodes, 142991 blocks
> 7149 blocks (5.00%) reserved for the super user
> First data block=0
> 5 block groups
> 32768 blocks per group, 32768 fragments per group
> 14304 inodes per group
> Superblock backups stored on blocks:
>         32768, 98304
> 
> Writing inode tables: done
> scsi0: Unable to abort command for target 2
> scsi0: Unable to send Bus Device Reset for target 2
> scsi0: Unable to do SCSI bus reset
> scsi0: >>>>>>>>>>>> Host reset <<<<<<<<<<<<
> scsi0: istat = 0c, sstat0 = 00, sstat1 = 00, dstat = 00
> scsi0: dsp = 000b2038 (script[0x080e]), dsps = 000b2cde, target = 0
> scsi0: Failing command for ID2
> SCSI disk error : host 0 channel 0 id 2 lun 0 return code = 2
>  I/O error: dev 08:03, sector 160
>  I/O error: dev 08:03, sector 162
>  I/O error: dev 08:03, sector 0
>  I/O error: dev 08:03, sector 288
>  I/O error: dev 08:03, sector 416
>  I/O error: dev 08:03, sector 544...
> 
> 
> ... I/O error: dev 08:03, sector 1052022
>  I/O error: dev 08:03, sector 1052150
> Warning: could not erase block 0: Attempt to write block from filesystem resulte
>  I/O error: dev 08:03, sector 2
> d in short write I/O error: dev 08:03, sector 8
> 
> Writing superb I/O error: dev 08:03, sector 262144
> locks and filesy I/O error: dev 08:03, sector 262152
> stem accounting  I/O error: dev 08:03, sector 524288
> information:  I/O error: dev 08:03, sector 786432
>  I/O error: dev 08:03, sector 786440
>  I/O error: dev 08:03, sector 1048576
> done
>  I/O error: dev 08:03, sector 2
>  I/O error: dev 08:03, sector 8
>  I/O error: dev 08:03, sector 262144
>  I/O error: dev 08:03, sector 262152
>  I/O error: dev 08:03, sector 786432
>  I/O error: dev 08:03, sector 786440

the same problem occurs on my HP9000/730 ...

the machine works normal (expect the rpc.xxx problem),
unless you use your scsi devices extensively (well, not really
extensively, just a "find", "mke2fs" or "ls -lR" or something like that).

greetings max
