From: "Joel Soete" <soete.joel@scarlet.be>
Subject: [parisc-linux] merge 2.6.22-rc2 ftbfs
Date: Fri, 25 May 2007 11:54:53 +0200
Message-ID: <JILCVH$61D15139B4C794DE6FE7310CA621D93B__8723.69042267582$1416624365$gmane$org@scarlet.be>
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

Hello Kyle,

Just a short playtime (just need to have some fun from time to time) and =
here
are two small patch which help me build your merge of 2.6.22-rc2:
--- ./drivers/parisc/pdc_stable.c.Orig  2007-05-24 13:19:16.000000000 +00=
00
+++ ./drivers/parisc/pdc_stable.c       2007-05-25 07:03:29.000000000 +00=
00
@@ -1067,7 +1067,7 @@
                        error =3D subsys_create_file(&stable_subsys, attr=
);

        /* register the paths subsys as a subsystem of stable subsys */
-       kset_set_kset_s(&paths_subsys, stable_subsys);
+       kobj_set_kset_s(&paths_subsys, stable_subsys);
        if ((rc =3D subsystem_register(&paths_subsys)))
                goto fail_subsysreg;

--- ./drivers/parisc/power.c.Orig       2007-05-25 07:04:03.000000000 +00=
00
+++ ./drivers/parisc/power.c    2007-05-25 07:04:13.000000000 +0000
@@ -35,6 +35,7 @@
  */

 #include <linux/module.h>
+#include <linux/pm.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/notifier.h>

That even boot on a b180 and a b2k (32bit) compiled with:
# gcc -v
Using built-in specs.
Target: hppa-linux-gnu
Configured with: ../src/configure -v
--enable-languages=3Dc,c++,fortran,objc,obj-c++,treelang --prefix=3D/usr
--enable-shared --with-system-zlib --libexecdir=3D/usr/lib
--without-included-gettext --enable-threads=3Dposix --enable-nls
--with-gxx-include-dir=3D/usr/include/c++/4.1.3 --program-suffix=3D-4.1
--enable-__cxa_atexit --enable-clocale=3Dgnu --enable-libstdcxx-debug
--enable-mpfr --disable-libssp --enable-checking=3Drelease hppa-linux-gnu=

Thread model: posix
gcc version 4.1.3 20070518 (prerelease) (Debian 4.1.2-8)

but I am worry of some WARNING:
## B180
make -f /CAD/linux-2.6.22-rc2-20070524/scripts/Makefile.modpost vmlinux
  scripts/mod/modpost   -o /CAD/linux-2.6-pa-b180/Module.symvers   
arch/parisc/kernel/head.o   init/built-in.o  usr/built-in.o  arc
h/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o 
arch/parisc/math-emu/built-in.o arch/parisc/kernel/init_task.o  kernel/bu=
ilt-
in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.o 
crypto/built-in.o  block/built-in.o  lib/lib.a  arch/parisc
/lib/lib.a `gcc -print-libgcc-file-name`  lib/built-in.o 
arch/parisc/lib/built-in.o `gcc -print-libgcc-file-name`  drivers/built-i=
n
.o  sound/built-in.o  net/built-in.o
WARNING: arch/parisc/kernel/built-in.o(.text.alloc_pa_dev+0x150): Section=

mismatch: reference to .init.text:parisc_hardware_descript
ion (after 'alloc_pa_dev')
WARNING: arch/parisc/kernel/built-in.o(.data.read_mostly+0xc4): Section
mismatch: reference to .init.text:processor_probe (between '
cpu_driver' and 'boot_cpu_data')
WARNING: drivers/built-in.o(.text.eisa_probe+0x2c8): Section mismatch:
reference to .init.text:eisa_root_register (after 'eisa_probe
')
WARNING: drivers/built-in.o(.text.sticore_pci_init+0xac): Section mismatc=
h:
reference to .init.text:sti_try_rom_generic (after 'stic
ore_pci_init')
WARNING: drivers/built-in.o(.text.sticore_pci_init+0xcc): Section mismatc=
h:
reference to .init.text:sticore_check_for_default_sti (a
fter 'sticore_pci_init')
WARNING: drivers/built-in.o(.text.parport_init_chip+0x70): Section mismat=
ch:
reference to .init.data:parport_count (after 'parport_i
nit_chip')
WARNING: drivers/built-in.o(.text.parport_init_chip+0x74): Section mismat=
ch:
reference to .init.data:parport_count (after 'parport_i
nit_chip')
WARNING: drivers/built-in.o(.text.parport_init_chip+0x7c): Section mismat=
ch:
reference to .init.data:parport_count (after 'parport_i
nit_chip')
rm -f .old_version

## B2k
make -f /CAD/linux-2.6.22-rc2-20070524/scripts/Makefile.modpost vmlinux
  scripts/mod/modpost -m  -o /CAD/linux-2.6-pa-b2k32/Module.symvers   
arch/parisc/kernel/head.o   init/built-in.o  usr/built-in.o
arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o 
arch/parisc/math-emu/built-in.o arch/parisc/kernel/init_task.o  kernel/bu=
i
lt-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  security/built-in.=
o 
crypto/built-in.o  block/built-in.o  lib/lib.a  arch/par
isc/lib/lib.a `gcc -print-libgcc-file-name`  lib/built-in.o 
arch/parisc/lib/built-in.o `gcc -print-libgcc-file-name`  drivers/built
-in.o  sound/built-in.o  arch/parisc/oprofile/built-in.o  net/built-in.o
WARNING: arch/parisc/kernel/built-in.o(.text.alloc_pa_dev+0x150): Section=

mismatch: reference to .init.text:parisc_hardware_descript
ion (after 'alloc_pa_dev')
WARNING: arch/parisc/kernel/built-in.o(.data.read_mostly+0xc8): Section
mismatch: reference to .init.text:processor_probe (between '
cpu_driver' and 'boot_cpu_data')
WARNING: drivers/built-in.o(.text.lba_fixup_bus+0x3c): Section mismatch:
reference to .init.text:pci_read_bridge_bases (after 'lba_f
ixup_bus')
rm -f .old_version

Sorry to haven't any more much time to do more.

J.=0A---=0AFree iPod Nano 2GB with every Scarlet One Unlimited, 50GB, 6 M=
bps, from EUR 39,95

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
