Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.esiee.fr (mail.esiee.fr [147.215.1.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id DCF4B4894
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Sep 2003 07:40:45 -0600 (MDT)
Date: Mon, 22 Sep 2003 15:40:41 +0200
Subject: Re: [parisc-linux] Compile-Error with linux-2.6 and harmony
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: Ruediger Scholz <rscholz@hrzpub.tu-darmstadt.de>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <3F6EF96B.8070308@hrzpub.tu-darmstadt.de>
Message-Id: <5BA663C2-ED02-11D7-98CE-0030656F07A2@esiee.fr>
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

Le lundi, 22 sep 2003, =E0 15:30 Europe/Paris, Ruediger Scholz a =E9crit =
:

> Hi there,
>
> I tried to compile the latest kernel  from CVS with OSS harmony=20
> enabled, but at first I got a compiler warning and afterwards a linker=20=

> error:
>

this

>    ---------------><------------
>      LD      sound/oss/sound.o
>      CC      sound/oss/harmony.o
>    sound/oss/harmony.c: In function `harmony_driver_callback':
>    sound/oss/harmony.c:1237: Warnung: implicit declaration of function
>    `ccio_get_fake'
>    sound/oss/harmony.c:1237: Warnung: assignment makes pointer from
>    integer without a cast

has nothing to do with this:

>
>    sound/built-in.o: In function `harmony_driver_callback':
>    sound/built-in.o(.init.text+0x3a0): undefined reference to
>    `ccio_get_fake'
>    make: *** [.tmp_vmlinux1] Fehler 1


>
> I thought that only the alsa harmony driver makes trouble when=20
> linking? I also can't find this function "ccio_get_fake" anywhere.

yeah that's known. ALSA Harmony won't link at the moment. Be patient,=20
this will be fixed ;)


Thibaut VARENE
The PA/Linux ESIEE Team
http://pateam.esiee.fr/=
