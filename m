Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (unknown [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE8894829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Jun 2003 09:35:24 -0600 (MDT)
Date: Tue, 3 Jun 2003 17:35:08 +0200
Message-ID: <3ED70CF100001633@ocpmta2.freegates.net>
In-Reply-To: <200306031418.h53EI399028101@hiauly1.hia.nrc.ca>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] compiler & kernel
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: joel.soete@tiscali.be, xam@cs.ucc.ie,
	parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>
>> # file vmlinux-2.4.21-rc4-pa35
> vmlinux-2.4.21-rc4-pa35: ELF 64-bit MSB ..., dynamically linked (uses share
> libs), ...
> 
> In the 32-bits case I well understand that kernel was staticaly linked
but
> I but surprised that 64-bit kernel is dyn
>mically linked? 

This is a limitation of the 64-bit linker.  Binaries still need an
interpreter for startup even when linked with -static.  This probably
could be fixed but the use of static binaries under 64-bit hpux is
discouraged.  Under hpux,
>the linker needs to define some extra symbols
when a static binary is created.

> Anyway could you let me know how to 'generate this profile'

Look at the -Q, -ftime-report and -fmem-report options.

Thanks for all explanation.

For the last point I edit Makefile and in CFLAGS I added the tree mentionned
options. I just start to recompile a kernel 2.4.20 and log everything but
I think that it will increase dramaticaly the overall volume: is that all
will really help you or better some typical comparison?

Joel

---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
