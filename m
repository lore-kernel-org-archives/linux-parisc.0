Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (unknown [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 34D6D4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 May 2003 06:55:12 -0600 (MDT)
Received: from [62.235.14.106] (helo=mail.tiscali.be)
	by cpout1.tiscali.be with esmtp (Tiscali)
	id 19Gejs-0001SN-00
	for <parisc-linux@lists.parisc-linux.org>; Fri, 16 May 2003 14:55:08 +0200
Date: Fri, 16 May 2003 14:55:09 +0200
Message-ID: <3EC39DA000000769@ocpmta7.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] last binutils-2.14.90.0.1 failled to build kernel
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

I am now runing a kernel 2.4.20-pa35 + lkcd bruno's patch with gcc-3.2.

In the mean time I made a distupgrade which mainly update binutils from 2.13.90.0.18-1.7
to 2.14.90.0.1-0.1 which make now failed the rebuild of the kernel:
[...]
gcc -D__ASSEMBLY__ -traditional -D__KERNEL__ -I/usr/src/LKCD/hppa/linux-2.4.20-pa35-lkcd/include
 -c -o entry.o entry.S
entry.S: Assembler messages:
entry.S:191: Error: Undefined .EXPORT/.IMPORT argument (ignored): 
entry.S:191: Error: Undefined .EXPORT/.IMPORT argument (ignored): code
entry.S:514: Error: Undefined .EXPORT/.IMPORT argument (ignored): 
entry.S:514: Error: Undefined .EXPORT/.IMPORT argument (ignored): code
entry.S:573: Error: Undefined .EXPORT/.IMPORT argument (ignored): 
entry.S:573: Error: Undefined .EXPORT/.IMPORT argument (ignored): code
entry.S:574: Error: Undefined .EXPORT/.IMPORT argument (ignored): 
entry.S:574: Error: Undefined .EXPORT/.IMPORT argument (ignored): code
entry.S:603: Error: Undefined .EXPORT/.IMPORT argument (ignored): 
entry.S:603: Error: Undefined .EXPORT/.IMPORT argument (ignored): code
entry.S:858: Error: Undefined .EXPORT/.IMPORT argument (ignored): 
entry.S:858: Error: Undefined .EXPORT/.IMPORT argument (ignored): code
make[1]: *** [entry.o] Error 1
make[1]: Leaving directory `/usr/src/LKCD/hppa/linux-2.4.20-pa35-lkcd/arch/parisc/kernel'
make: *** [_dir_arch/parisc/kernel] Error 2
[...]

Any idea?

Thanks,
    Joel



---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
