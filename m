Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2EF1A4829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Dec 2002 10:05:53 -0700 (MST)
Date: Fri, 6 Dec 2002 09:09:04 -0800
From: Randolph Chung <randolph@tausq.org>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] new 2.4.20-pa10 kernel: boot pb.
Message-ID: <20021206170904.GY19331@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <3DF0D2C0.D24A29B1@admin.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DF0D2C0.D24A29B1@admin.france.hp.com>
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

> nothing more, it stay here forever.......
> 
> It is an A500 in SMP/64.
> 
> A normal boot with 2.4.19
> scsi1 : sym53c8xx-1.7.3c-20010512
> scsi2 : sym53c8xx-1.7.3c-20010512
> scsi3 : sym53c8xx-1.7.3c-20010512
>   Vendor: SEAGATE   Model: ST31230N          Rev: HP05
>   Type:   Direct-Access                      ANSI SCSI revision: 02
>   Vendor: SEAGATE   Model: ST318404LC        Rev: HP04

Bruno, can you try the sym2 driver and let us know how it goes?

CONFIG_SCSI_SYM53C8XX_2=y
CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=0
CONFIG_SCSI_SYM53C8XX_DEFAULT_TAGS=16
CONFIG_SCSI_SYM53C8XX_MAX_TAGS=64

there was a similar problem with the sym2 driver that was fixed
recently.

alternatively, please try turning on CONFIG_DEBUG_SPINLOCK in your
kernel and try running the sym53c8xx driver and see if that helps
identify the problem...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
