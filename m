Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Moritz Sinn <moritz@freesources.org>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: Message from Moritz Sinn <moritz@freesources.org>
   of "15 Sep 2002 22:33:39 -0000." <87k7lm3mt8.fsf@appserv.sinnhq.de>
References: <87k7lm3mt8.fsf@appserv.sinnhq.de> 
Date: Sun, 15 Sep 2002 22:30:04 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020916043004.B27754829@dsl2.external.hp.com>
Subject: [parisc-linux] Re: ide controller
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

Moritz Sinn wrote:
> 
> hi,
> 
> i've got an promise PDC20268 ide controller, which i would like to use
> in my hp c360 workstation. i'm using kernel 2.4.18 (couldn't compile
> 2.4.19 and 2.4.20-pre7).
> if i compile with "Generic PCI bus-master DMA support", the kernel
> crashes when i insmod the 'ide-mod' module. it doesn't print useable
> error messages, it just doesn't react anymore.

Are you using the "apt-get source kernel-image-2.4.18-hppa"
or from kernel.org?

If the latter, that won't work.

> when i compile without dma support, i can insmod the 'ide-mod' and
> 'ide-disk' module, but it crashes when i want to insmod the
> 'ide-probe-mod' module.
> 
> would be great if someone could help me.

1) see cvs.parisc-linux.org to get the latest bits
   (or ftp.parisc-linux.org/cvs/)

2) define the following to 1 in drivers/ide/pdc202xx.c:

#define PDC202XX_DEBUG_DRIVE_INFO               0
#define PDC202XX_DECODE_REGISTER_INFO           0

  and rebuild the module with that.

3) post the console log and "ser pim" output at PDC prompt.

grant
