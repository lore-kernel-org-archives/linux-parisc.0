Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id BCDF7482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Jul 2003 07:55:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19bKqQ-0003Ey-Og; Sat, 12 Jul 2003 14:55:22 +0100
Date: Sat, 12 Jul 2003 14:55:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: =?iso-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Sound in 2.5
Message-ID: <20030712135522.GR20424@parcelfarce.linux.theplanet.co.uk>
References: <3F0FB712.7060702@hrzpub.tu-darmstadt.de> <20030712143418.37631a6c.varenet@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030712143418.37631a6c.varenet@esiee.fr>
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

On Sat, Jul 12, 2003 at 02:34:18PM +0200, Thibaut VARENE wrote:
> I guess that a part of the answer stands there:
> 
> http://cvs.parisc-linux.org/linux-2.5/include/asm-parisc/Attic/gsc.h
> Revision 1.5 , Fri Nov 1 01:04:30 2002 UTC (8 months, 1 week ago) by willy
> Move gsc_read,write[bwl] to asm/io.h.  Move drivers/parisc/busdevice.h
> to drivers/parisc/gsc.h.  Move the rest of include/asm-parisc/gsc.h
> to drivers/parisc/gsc.h.  Edit dozens of files to remove the include
> of <asm/gsc.h>

Yeah.  But where did sound/parisc/harmony.c come from?  The first thing
I saw of it was when it was added to Linux 2.5.71.  I assumed one of
you guys had been working on it.

>   CC      sound/parisc/harmony.o
> sound/parisc/harmony.c: In function `snd_card_harmony_playback_open':
> sound/parisc/harmony.c:712: structure has no member named `dma_private'
> sound/parisc/harmony.c:713: structure has no member named `dma_type'
> sound/parisc/harmony.c:713: `SNDRV_PCM_DMA_TYPE_PCI' undeclared (first use
> in this function)

static int snd_card_harmony_playback_open(snd_pcm_substream_t * substream)
        substream->dma_private = harmony->fake_pci_dev;
        substream->dma_type = SNDRV_PCM_DMA_TYPE_PCI;

I dunno, this all looks like sound junk to me.

I have no idea what glue the person who wrote this driver is on:

 * (note that some machines -712 for ex.- don't implement DMA consistent
 * memory, so we will need to use kmalloc instead)

712 implements DMA consistent memory.  715/33 doesn't, for example.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
