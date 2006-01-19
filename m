From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] pci.h pb with gcc-4.0
Date: Thu, 19 Jan 2006 13:44:23 +0100
Message-ID: <ITCBDZ$237BDD3D61015C37DE6E824ACAF3708B@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
To: "parisc-linux" <parisc-linux@lists.parisc-linux.org>
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

hello *,

mmm don't know if because I use gcc 4.0 but here is a pb I encounter to b=
uild
2.6.16-rc1-pa1 (+patch):

  gcc -Wp,-MD,arch/parisc/kernel/.pci.o.d  -nostdinc -isystem
/usr/lib/gcc/hppa-linux-gnu/4.0.3/include -D__KERNEL__ -Iinclude -Iinc
lude2 -I/CAD/linux-2.6.16-rc1-pa1/include -include include/linux/autoconf=
.h
-I/CAD/linux-2.6.16-rc1-pa1/arch/parisc/kernel -Iarch/pa
risc/kernel -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs
-fno-strict-aliasing -fno-common -ffreestanding -O2 -fomit-frame-pointe
r -pipe -mno-space-regs -mfast-indirect-calls -mdisable-fpregs
-ffunction-sections -march=3D2.0 -mschedule=3D8000 -Wdeclaration-after-st=

atement -Wno-pointer-sign  -D"KBUILD_STR(s)=3D#s"
-D"KBUILD_BASENAME=3DKBUILD_STR(pci)"  -D"KBUILD_MODNAME=3DKBUILD_STR(pci=
)" -c -o
arch/p
arisc/kernel/.tmp_pci.o /CAD/linux-2.6.16-rc1-pa1/arch/parisc/kernel/pci.=
c
/CAD/linux-2.6.16-rc1-pa1/arch/parisc/kernel/pci.c:56: error: static
declaration of \xe2\x80\x98pci_hba_count\xe2\x80\x99 follows no
n-static declaration
include2/asm/pci.h:206: error: previous declaration of
\xe2\x80\x98pci_hba_count\xe2\x80\x99 was here

as it doesn't seems to be used elsewhere I just apply following matter:
--- linux-2.6.16-rc1-pa1/include/asm-parisc/pci.h       2006-01-17
19:48:12.000000000 +0100
+++ linux-2.6.16-rc1-pa1-20060119/include/asm-parisc/pci.h      2006-01-1=
8
17:51:07.000000000 +0100
@@ -203,7 +203,7 @@
 */
 extern struct pci_port_ops *pci_port;
 extern struct pci_bios_ops *pci_bios;
-extern int pci_hba_count;
+/* extern int pci_hba_count; */
 extern struct pci_hba_data *parisc_pci_hba[];
 
 #ifdef CONFIG_PCI
=3D=3D=3D=3D<>=3D=3D=3D=3D

If agreed please fill free to apply (no cvs access ;-( )

TIA,
    Joel=0A=0A-------------------------------------------------------=0AN=
OTE! My email address is changing to ... @scarlet.be=0APlease make the ne=
cessary changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
