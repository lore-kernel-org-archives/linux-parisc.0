Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8316F48B4
	for <parisc-linux@lists.parisc-linux.org>;
	Tue, 23 Dec 2003 11:37:18 -0700 (MST)
Date: Tue, 23 Dec 2003 19:37:09 +0100
Message-ID: <3FB265250001889E@ocpmta2.freegates.net>
In-Reply-To: <20031219200236.GA18747@MAIL.13thfloor.at>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Compiling Kernel for HP 9000/800/A400-44
To: "Herbert Poetzl" <herbert@13thfloor.at>,
	=?ISO-8859-1?Q?Thibaut=20VAR=C8NE?= <varenet@esiee.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: Grant Grundler <grundler@parisc-linux.org>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Grant, Herbert,

> >
> >>You'll need to grab the gcc-hppa64 compiler from:	
> >>    
> >>ftp://ftp.parisc-linux.org/unoffocial-debs/gcc-hppa64_3.0.4ds3- 
> >>7.1_hppa.deb
> >
This failled to me:
"  	hppa64-linux-ld  -T arch/parisc/kernel/vmlinux.lds.s arch/parisc/kernel/head64.o
  init/built-in.o --start-group  usr/built-in.o  arch/parisc/mm/built-in.o
 arch/parisc/kernel/built-in.o  arch/parisc/math-emu/built-in.o arch/parisc/kernel/init_task.o
 kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o
 crypto/built-in.o  lib/lib.a  arch/parisc/lib/lib.a `hppa64-linux-gcc -print-libgcc-file-name`
 lib/built-in.o  arch/parisc/lib/built-in.o `hppa64-linux-gcc -print-libgcc-file-name`
 drivers/built-in.o  sound/built-in.o  arch/parisc/oprofile/built-in.o  net/built-in.o
--end-group  -o .tmp_vmlinux1
/usr/bin/hppa64-linux-ld: line 4: 10920 Segmentation fault      /opt/palinux/bin/$prog
$*
make: *** [.tmp_vmlinux1] Error 139
"
A well know pb which required a new release iirc.

> >hmm, is there a source available somewhere ...
> >(I don't like binary only packages)
> 
> If you really want to waste your time in building a cross 
> compiler by yourself, going through the various pain of 
> this process, just follow the recipe here:
> http://www.fr.parisc-linux.org/toolchain/PARISC-Linux-XC-HOWTO.html

For my part I use a script of mine (get the idea in palinux-autobuild and
something in ruby) that produce me well a compiler (let call it) kgcc-3.3.2
64bit. I recompile first last kernel 2.4 which boot well on my b2k (even
with smp :) ). Unfortunately I do the same excercise with latest 2.6 (pa4)
but i don't reach to make boot the same b2k: it crash very early.
And more over the pimfo doesn't help (neither hpmc nor toc reveal any usable
address?).
hmm is somebody knows if Bruno expect to port its lkcd patch into 2.6?

Joel
 

-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
