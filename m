Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 632C1482A
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Jul 2003 01:27:46 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157001029.dialin.heagmedianet.de [213.157.1.29])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.9/8.12.7) with ESMTP id h6C7RbA2003975
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Sat, 12 Jul 2003 09:27:41 +0200
Message-ID: <3F0FB712.7060702@hrzpub.tu-darmstadt.de>
Date: Sat, 12 Jul 2003 09:21:54 +0200
From: =?ISO-8859-15?Q?R=FCdiger_Scholz?= <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Sound in 2.5
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

Hi there!

Had anyone success compiling a kernel with sound support enabled? If  I 
enable the ALSA harmony driver, I get a lot of errors during compile:

---------------SNIP-------------

      LD      sound/isa/wavefront/built-in.o
      LD      sound/isa/built-in.o
      CC      sound/parisc/harmony.o
    sound/parisc/harmony.c:80:21: asm/gsc.h: Datei oder Verzeichnis
    nicht gefunden
    sound/parisc/harmony.c: In function `snd_card_harmony_playback_open':
    sound/parisc/harmony.c:712: structure has no member named `dma_private'
    sound/parisc/harmony.c:713: structure has no member named `dma_type'
    sound/parisc/harmony.c:713: `SNDRV_PCM_DMA_TYPE_PCI' undeclared
    (first use in this function)
    sound/parisc/harmony.c:713: (Each undeclared identifier is reported
    only once
    sound/parisc/harmony.c:713: for each function it appears in.)
    sound/parisc/harmony.c: In function `snd_card_harmony_capture_open':
    sound/parisc/harmony.c:736: structure has no member named `dma_private'
    sound/parisc/harmony.c:737: structure has no member named `dma_type'
    sound/parisc/harmony.c:737: `SNDRV_PCM_DMA_TYPE_PCI' undeclared
    (first use in this function)
    sound/parisc/harmony.c: In function `snd_card_harmony_hw_params':
    sound/parisc/harmony.c:784: warning: unused variable `runtime'
    sound/parisc/harmony.c: In function `snd_card_harmony_pcm_init':
    sound/parisc/harmony.c:827: warning: implicit declaration of
    function `request_irq'
    sound/parisc/harmony.c: In function `snd_card_harmony_create':
    sound/parisc/harmony.c:1004: dereferencing pointer to incomplete type
    sound/parisc/harmony.c:1007: dereferencing pointer to incomplete type
    sound/parisc/harmony.c:1022: dereferencing pointer to incomplete type
    sound/parisc/harmony.c:1033: warning: implicit declaration of
    function `ccio_get_fake'
    sound/parisc/harmony.c:1033: warning: assignment makes pointer from
    integer without a cast
    sound/parisc/harmony.c: In function `snd_card_harmony_probe':
    sound/parisc/harmony.c:1079: dereferencing pointer to incomplete type
    sound/parisc/harmony.c: At top level:
    sound/parisc/harmony.c:1109: variable `snd_card_harmony_driver' has
    initializer but incomplete type
    sound/parisc/harmony.c:1110: unknown field `name' specified in
    initializer
    sound/parisc/harmony.c:1110: warning: excess elements in struct
    initializer
    sound/parisc/harmony.c:1110: warning: (near initialization for
    `snd_card_harmony_driver')
    sound/parisc/harmony.c:1111: unknown field `id_table' specified in
    initializer
    sound/parisc/harmony.c:1111: warning: excess elements in struct
    initializer
    sound/parisc/harmony.c:1111: warning: (near initialization for
    `snd_card_harmony_driver')
    sound/parisc/harmony.c:1112: unknown field `probe' specified in
    initializer
    sound/parisc/harmony.c:1112: warning: excess elements in struct
    initializer
    sound/parisc/harmony.c:1112: warning: (near initialization for
    `snd_card_harmony_driver')
    sound/parisc/harmony.c: In function `alsa_card_harmony_exit':
    sound/parisc/harmony.c:1139: warning: implicit declaration of
    function `free_irq'
    sound/parisc/harmony.c: At top level:
    sound/parisc/harmony.c:1109: storage size of
    `snd_card_harmony_driver' isn't known
    include/sound/initval.h:140: warning: `get_id' defined but not used
    make[2]: *** [sound/parisc/harmony.o] Fehler 1
    make[1]: *** [sound/parisc] Fehler 2
    make: *** [sound] Fehler 2
    ruediger@gandalf:/usr/src/linux-2.5$

---------------SNAP-------------

The compiler didn't find the file "asm/gsc.h" (first error message: 
"Datei oder Verzeichnis nicht gefunden"). But if I put there the right 
path to gsc.h it won't compile either.
Any hints to make some noise with a 2.5-kernel?
   
    Rüdiger
