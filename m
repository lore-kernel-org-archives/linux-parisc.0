Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailserver3.hrz.tu-darmstadt.de (mailserver3.hrz.tu-darmstadt.de [130.83.126.47])
	by dsl2.external.hp.com (Postfix) with ESMTP id 41D3E4868
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Sep 2003 07:30:25 -0600 (MDT)
Received: from hrzpub.tu-darmstadt.de (IP-213157024120.dialin.heagmedianet.de [213.157.24.120])
	(authenticated bits=0)
	by mailserver3.hrz.tu-darmstadt.de (8.12.10/8.12.7) with ESMTP id h8MDU5KX017249
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Sep 2003 15:30:10 +0200
Message-ID: <3F6EF96B.8070308@hrzpub.tu-darmstadt.de>
Date: Mon, 22 Sep 2003 15:30:19 +0200
From: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Subject: [parisc-linux] Compile-Error with linux-2.6 and harmony
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

Hi there,

I tried to compile the latest kernel  from CVS with OSS harmony enabled, 
but at first I got a compiler warning and afterwards a linker error:

    ---------------><------------
      LD      sound/oss/sound.o
      CC      sound/oss/harmony.o
    sound/oss/harmony.c: In function `harmony_driver_callback':
    sound/oss/harmony.c:1237: Warnung: implicit declaration of function
    `ccio_get_fake'
    sound/oss/harmony.c:1237: Warnung: assignment makes pointer from
    integer without a cast
      LD      sound/oss/built-in.o
      .....
     UPD     include/linux/compile.h
      CC      init/version.o
      LD      init/built-in.o
      LD      .tmp_vmlinux1
    sound/built-in.o: In function `harmony_driver_callback':
    sound/built-in.o(.init.text+0x3a0): undefined reference to
    `ccio_get_fake'
    make: *** [.tmp_vmlinux1] Fehler 1
    ---------------><------------

I thought that only the alsa harmony driver makes trouble when linking? 
I also can't find this function "ccio_get_fake" anywhere.
I'm running debian testing with gcc-3.3.1 and binutils 2.12.90.
TIA, Ruediger
