Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.zigoo.net (d108.dhcp212-198-139.noos.fr [212.198.139.108])
	by dsl2.external.hp.com (Postfix) with ESMTP id A6121482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Jul 2003 06:34:24 -0600 (MDT)
Date: Sat, 12 Jul 2003 14:34:18 +0200
From: Thibaut VARENE <varenet@esiee.fr>
To: =?ISO-8859-1?Q?R=FCdiger?= Scholz <rscholz@hrzpub.tu-darmstadt.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Sound in 2.5
Message-Id: <20030712143418.37631a6c.varenet@esiee.fr>
In-Reply-To: <3F0FB712.7060702@hrzpub.tu-darmstadt.de>
References: <3F0FB712.7060702@hrzpub.tu-darmstadt.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

On Sat, 12 Jul 2003 09:21:54 +0200
R=FCdiger Scholz <rscholz@hrzpub.tu-darmstadt.de> wrote:

> Hi there!
>=20
> Had anyone success compiling a kernel with sound support enabled? If  I=20
> enable the ALSA harmony driver, I get a lot of errors during compile:
>=20
> ---------------SNIP-------------
>=20
>       LD      sound/isa/wavefront/built-in.o
>       LD      sound/isa/built-in.o
>       CC      sound/parisc/harmony.o
>     sound/parisc/harmony.c:80:21: asm/gsc.h: Datei oder Verzeichnis
>     nicht gefunden
>=20
> ---------------SNAP-------------
>=20
> The compiler didn't find the file "asm/gsc.h" (first error message:=20
> "Datei oder Verzeichnis nicht gefunden"). But if I put there the right=20
> path to gsc.h it won't compile either.
> Any hints to make some noise with a 2.5-kernel?
>   =20

I guess that a part of the answer stands there:

http://cvs.parisc-linux.org/linux-2.5/include/asm-parisc/Attic/gsc.h
Revision 1.5 , Fri Nov 1 01:04:30 2002 UTC (8 months, 1 week ago) by willy
Move gsc_read,write[bwl] to asm/io.h.  Move drivers/parisc/busdevice.h
to drivers/parisc/gsc.h.  Move the rest of include/asm-parisc/gsc.h
to drivers/parisc/gsc.h.  Edit dozens of files to remove the include
of <asm/gsc.h>

I tried to reproduce, correcting the path to gsc.h, and here's what
happened:

  CC      sound/parisc/harmony.o
sound/parisc/harmony.c: In function `snd_card_harmony_playback_open':
sound/parisc/harmony.c:712: structure has no member named `dma_private'
sound/parisc/harmony.c:713: structure has no member named `dma_type'
sound/parisc/harmony.c:713: `SNDRV_PCM_DMA_TYPE_PCI' undeclared (first use
in this function)
sound/parisc/harmony.c:713: (Each undeclared identifier
is reported only once sound/parisc/harmony.c:713: for each function it
appears in.)
sound/parisc/harmony.c: In function `snd_card_harmony_capture_open':
sound/parisc/harmony.c:736: structure has no member named `dma_private'
sound/parisc/harmony.c:737: structure has no member named `dma_type'
sound/parisc/harmony.c:737:`SNDRV_PCM_DMA_TYPE_PCI' undeclared (first use
in this function)
sound/parisc/harmony.c: In function `snd_card_harmony_hw_params':
sound/parisc/harmony.c:784: warning: unused variable `runtime'
sound/parisc/harmony.c: In function`snd_card_harmony_pcm_init':
sound/parisc/harmony.c:827: warning: passing arg 2 of `request_irq' from
incompatible pointer type
sound/parisc/harmony.c: In function`snd_card_harmony_create':
sound/parisc/harmony.c:1033: warning: implicit declaration of
function`ccio_get_fake'
sound/parisc/harmony.c:1033: warning: assignment makes pointer from
integer without a cast
sound/parisc/harmony.c: At top level:
include/sound/initval.h:140: warning: `get_id' defined but not used
make[2]:***[sound/parisc/harmony.o] Error 1

Since I've not closely followed the last change made to 2.5, I cannot tell
right now what's wrong. Maybe willy can give us some hints there? ;)
Laurent Canet, which is the author of this driver, is currently on
vacation (as I'm supposed to be, btw ;P) so don't expect any help from him
before a little while.

I'll have a closer look and try to find out what's wrong.


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/
