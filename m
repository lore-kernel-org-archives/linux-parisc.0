Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7CC304856
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 11 Feb 2004 02:22:29 -0700 (MST)
Date: Wed, 11 Feb 2004 10:22:24 +0100
Message-ID: <4029EF9C00000135@ocpmta1.freegates.net>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	James Morrison <ja2morri@csclub.uwaterloo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Hi Carlos,


>The wrong files are being included. What is your configure line?
As I just change gcc compiler, I don't change glibc configure options which
are:

"unset LD_LIBRARY_PATH; unset LD_RUN_PATH; \
export CC=/Develop/parisc-linux/xc/bin
hppa-linux-gcc; \
export CLFAGS="-O2 -g";  export PATH="/Develop/parisc-linux/xc/bin:$PATH";
\
/Develop/parisc-linux/src/glibc/configure --target=hppa-linux --host=hppa-linux
\
--build=hppa-linux --prefix=/opt/palinux-3.5.0/hppa-linux --without-cv \
--disable-profile --enable-hacker-mode --enable-add-ons=linuxthreads \
--with-headers=/Develop/parisc-linux/src/linux/include
"

hmm I have a look by getting an objdump of elf/dl-symaddr.o (as hppa/dl-symaddr.c
include hppa/dl-machine.h) but I don't find any set_dp? (still have to have
a look with gcc-3.3 for comparison)

Cheers,
    Joel





-------------------------------------------------------------------------
Tiscali ADSL: 12 mois à 29,50 €/mois! L'Internet rapide, c'est pour tout
le monde.
http://reg.tiscali.be/default.asp?lg=fr
