Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from goliath.alaskatech.org (cable-207-5-237-24.anchorageak.net [24.237.5.207])
	by dsl2.external.hp.com (Postfix) with ESMTP id 42A1F486B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 20 Feb 2002 17:26:56 -0700 (MST)
Date: Wed, 20 Feb 2002 15:19:56 -0900 (AKST)
From: Tom <palinux@alaskatech.org>
To: "Jeremy C. Reed" <reed@reedmedia.net>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Is there a hard-drive image for PA-RISC Linux
 0.9.3?
In-Reply-To: <Pine.LNX.4.43.0202201544030.30896-100000@pilchuck.reedmedia.net>
Message-ID: <Pine.LNX.4.33.0202201518450.13804-100000@goliath.alaskatech.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Wed, 20 Feb 2002, Jeremy C. Reed wrote:

> I see that 710 is now supported by PA-RISC Linux.
>
> I see that there are ISO images available. Can these be extracted to place
> on a SCSI disk?

Isn't it possible to use 'dd if=palinux.iso of=/dev/sda' and end up with a
"CD on a disk"? Or somethign similar? Would require a disposable 1G SCSI
drive, but it'd at least work...

>
> If so, any ideas on how? (For example, how do I get grub or lilo setup
> correctly?)
>
> My HP 710 computer currently has operating system from 1997:
>
>  MkLinux for HP PA-RISC
>  Release 1.1 (Linux 2.0.32-osfmach3 on a hp_pa)
>
> It was installed by using a diks image that copied to the disk using
> dd(1). I am hoping I can do the same again.
>
> Thanks,
>
>    Jeremy C. Reed
>    http://www.reedmedia.net/
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
