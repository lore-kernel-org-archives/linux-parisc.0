From: Helge Deller <deller@gmx.de>
Subject: [parisc-linux] i386 cross-compiler for hppa/hppa64 ?
Date: Wed, 15 Sep 2004 21:13:56 +0200
Message-ID: <200409152113.57033.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi all,

running today into the following compile problem with current PARISC CVS HEAD with my old gcc 3.0.2 i386/hppa crosscompiler:
....
  CC      arch/parisc/kernel/unaligned.o
{standard input}: Assembler messages:
{standard input}:158: Error: operation combines symbols in different segments
make[1]: *** [arch/parisc/kernel/unaligned.o] Error 1

i started looking for a newer gcc cross-compiler to download.

The cross-compiler section on the parisc homepage at http://parisc-linux.org/software/index.html#xcs links to 
http://ftp.parisc-linux.org/x86-xcompilers/   and  
ESIEE Team's download page at http://www.pateam.org/download.html#deb

Both links sadly only contain really old crosscompilers.
Maybe someone is looking for an interesting job and could provide new cross compilers either as .deb or rpm packages and update the website ?

Thanks,
Helge
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
