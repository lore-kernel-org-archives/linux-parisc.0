Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from "=?iso-8859-1?Q?Jo=EBl_Soete?=" <jso@europay.com>
   of "Wed, 13 Feb 2002 19:18:37 +0100." <OF06B7B721.64C3D9E9-ONC1256B5F.0063DC45@com>
References: <OF06B7B721.64C3D9E9-ONC1256B5F.0063DC45@com> 
Date: Thu, 14 Feb 2002 21:48:36 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020215044836.9DA08484F@dsl2.external.hp.com>
Subject: [parisc-linux] Re: kernel-2.4.17-pa22 boot problem B132L+ with serial
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

"=?iso-8859-1?Q?Jo=EBl_Soete?=" wrote:
> Sorry first for delay.
> 
> Sorry also if I desapoint you but "CONFIG_TULIP_MMIO=y" works for my b180
> (afaik same HW than b132l+ but processor clock?) with last k-2.4.17-pa23:

Disappointed?! are you kidding?! This is great! :^)

> ...
> RAMDISK driver initialized: 16 RAM disks of 6144K size 1024 blocksize
> loop: loaded (max 8 devices)
> Linux Tulip driver version 0.9.15-pre9 (Nov 6, 2001)
> tulip0: no phy info, aborting mtable build
> tulip0:  MII transceiver #1 config 1000 status 782d advertising 01e1.
> eth0: Digital DS21143 Tulip rev 65 at 0xf0fff000, 00:10:83:65:09:4B, IRQ
> 96.

Is this output from B132L with card-mode Dino?
or with built-in 21143 on B180L?

Just curious....

thanks,
grant
