Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (unknown [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E7A94829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 May 2003 06:23:33 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 19IScn-0000EN-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 May 2003 14:23:17 +0200
Date: Wed, 21 May 2003 14:23:31 +0200
Message-ID: <3EC7617000001BB5@ocpmta1.freegates.net>
In-Reply-To: <3EC39DA000000769@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: RE: [parisc-linux] last binutils-2.14.90.0.2-0.1[was-2.14.90.0.1] failled to build kernel
To: parisc-linux@lists.parisc-linux.org
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

Hi All,
>
>I am now runing a kernel 2.4.20-pa35 + lkcd bruno's patch with gcc-3.2.
>
>In the mean time I made a distupgrade which mainly update binutils from
2.13.90.0.18-1.7
>to 2.14.90.0.1-0.1 which make now failed the rebuild of the kernel:
>[...]
Still failed with binutils_2.14.90.0.2-0.1 :((

gcc -D__ASSEMBLY__ -traditional -D__KERNEL__ -I/usr/src/work/linux-2.4.21-rc2-pa35/include
 -c -o real2.o real2.S
real2.S: Assembler messages:
real2.S:126: Error: too many positional arguments
make[1]: *** [real2.o] Error 1

J.

---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
