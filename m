Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 02B16482B
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 08:43:07 -0600 (MDT)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <deller@gmx.de>
To: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] disks not recognized by new 53c700/53c710 driver (was [parisc-linux-cvs] linux rhirst)
Date: Sat, 13 Oct 2001 16:42:27 +0200
References: <20011013162103.A3604@dogbert.localdomain> <20011013162718.B3604@dogbert.localdomain>
In-Reply-To: <20011013162718.B3604@dogbert.localdomain>
MIME-Version: 1.0
Message-Id: <20011013144307.02B16482B@dsl2.external.hp.com>
List-ID: <linux-parisc.vger.kernel.org>

> No disks?
>
> In my .config (obtained with make oldconfig) I have:
>
> CONFIG_SCSI=y
> CONFIG_BLK_DEV_SD=y
> CONFIG_SD_EXTRA_DEVS=40
> CONFIG_CHR_DEV_ST=y
> CONFIG_SR_EXTRA_DEVS=2
> CONFIG_CHR_DEV_SG=y
> CONFIG_SCSI_ZALON=y
> CONFIG_SCSI_SYM53C8XX=y
> CONFIG_SCSI_NCR53C8XX_DEFAULT_TAGS=8
> CONFIG_SCSI_NCR53C8XX_MAX_TAGS=32
> CONFIG_SCSI_NCR53C8XX_SYNC=20
>
> Did I miss anything or is there something amiss with the driver? :-)

I think you missed:

CONFIG_SCSI_LASI700=y
CONFIG_53C700_MEM_MAPPED=y
CONFIG_53C700_LE_ON_BE=y
CONFIG_53C700_USE_CONSISTENT=y

You should prefer "make menuconfig". That way you won't
miss such things.

Greetings,
Helge
