Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep14-int.chello.at (viefep14-int.chello.at [213.46.255.13])
	by dsl2.external.hp.com (Postfix) with ESMTP id 06DAA4840
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Nov 2003 01:53:02 -0700 (MST)
Date: Mon, 24 Nov 2003 09:52:59 +0100
Subject: Re: [parisc-linux] hppa64-linux-ld segfault
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Mime-Version: 1.0 (Apple Message framework v552)
Cc: parisc-linux@lists.parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
From: =?ISO-8859-1?Q?Thibaut_VAR=C8NE?= <varenet@esiee.fr>
In-Reply-To: <20031124070724.GB26585@colo.lackof.org>
Message-Id: <9AC1702E-1E5B-11D8-B18F-0030656F07A2@esiee.fr>
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

I got the same when building a 64bit kernel with KALLSYMS enabled...

HTH,


Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/

PS: I might be able to package a newer hppa64-gcc, assuming i'm told
what to put in it ;)

Le lundi, 24 nov 2003, =E0 08:07 Europe/Paris, Grant Grundler a =E9crit =
:

> Trying to build 64-bit 2.6.0-test10 on a500...I'm getting:
>
> grundler <537>make
> make[1]: `arch/parisc/kernel/asm-offsets.s' is up to date.
>   CHK     include/asm-parisc/offsets.h
>   CHK     include/linux/compile.h
>   GEN     .version
>   CHK     include/linux/compile.h
>   UPD     include/linux/compile.h
>   CC      init/version.o
>   LD      init/built-in.o
>   LD      .tmp_vmlinux1
> /usr/bin/hppa64-linux-ld: line 4:  9184 Segmentation fault     =20
> /opt/palinux/bin/$prog $*
> make: *** [.tmp_vmlinux1] Error 139
> grundler <538>
>
> It likely I'm not be the only person running into this.
> And not sure why I'm suddenly seeing this problem though...
>
> thanks,
> grant
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
