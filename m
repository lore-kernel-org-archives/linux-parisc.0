Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from swan.prod.itd.earthlink.net (swan.mail.pas.earthlink.net [207.217.120.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id 805B14868
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 19:11:05 -0700 (MST)
Message-ID: <3C7456F0.809@earthlink.net>
Date: Wed, 20 Feb 2002 20:09:52 -0600
From: "Bryan W. Headley" <bwheadley@earthlink.net>
MIME-Version: 1.0
To: "Jeremy C. Reed" <reed@reedmedia.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Is there a hard-drive image for PA-RISC Linux 0.9.3?
References: <Pine.LNX.4.33.0202201518450.13804-100000@goliath.alaskatech.org>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Tom wrote:
> On Wed, 20 Feb 2002, Jeremy C. Reed wrote:
> 
> 
>>I see that 710 is now supported by PA-RISC Linux.
>>
>>I see that there are ISO images available. Can these be extracted to place
>>on a SCSI disk?
>>
> 
> Isn't it possible to use 'dd if=palinux.iso of=/dev/sda' and end up with a
> "CD on a disk"? Or somethign similar? Would require a disposable 1G SCSI
> drive, but it'd at least work...

Assuming no "reasonable assumptions" made by the boot ROM precludes it 
("iso9660 on a disc? No.") Worst case is mount the iso image on another 
linux box, and use nfsroot/rboot. Personally, I'd just find a friend 
with a CD burner and write on CD/R media. Lot less cantankerous, believe me!





-- 
____               .:.                 ____
Bryan W. Headley - bwheadley@earthlink.net
