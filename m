From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] 2.6.11-rc3 failled to build on b2k
Date: Thu, 3 Feb 2005 16:48:21 +0000
Message-ID: <41DE936000008A0C@mail-4-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
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

2.6.11-rc3-pa? build and boot fine on b180 (unfortunately no more N4k, it=

definitely goes back to production :_()
But strangely failed to build on b2k (64bit but would also on 32 bit)
...
   hppa64-linux-ld   -r -o init/built-in.o init/main.o init/version.o ini=
t/mounts.o
init/initramfs.o init/calibrate.o
  hppa64-linux-ld   -o .tmp_vmlinux1 -T arch/parisc/kernel/vmlinux.lds ar=
ch/parisc/kernel/head.o
  init/built-in.o --start-group  us
r/built-in.o  arch/parisc/mm/built-in.o  arch/parisc/kernel/built-in.o  a=
rch/parisc/math-emu/built-in.o
arch/parisc/kernel/init_task
.o  kernel/built-in.o  mm/built-in.o  fs/built-in.o  ipc/built-in.o  secu=
rity/built-in.o
 crypto/built-in.o  lib/lib.a  
arch/parisc/
lib/lib.a `hppa64-linux-gcc -print-libgcc-file-name`  lib/built-in.o  arc=
h/parisc/lib/built-in.o
`hppa64-linux-gcc -print-libgcc-fil
e-name`  drivers/built-in.o  sound/built-in.o  net/built-in.o --end-group=

fs/built-in.o(.text.fh_verify+0x23c): In function `fh_verify':
: undefined reference to `export_op_default'
fs/built-in.o(.text.fh_compose+0x2a0): In function `fh_compose':
: undefined reference to `export_op_default'
fs/built-in.o(.text.fh_update+0xd0): In function `fh_update':
: undefined reference to `export_op_default'
fs/built-in.o(.text._fh_update+0x34): In function `_fh_update':
: undefined reference to `export_op_default'
fs/built-in.o(.data.rel.ro+0x678): In function `.LC16':
: undefined reference to `find_exported_dentry'
make[1]: *** [.tmp_vmlinux1] Error 1
make: *** [vmlinux] Error 2
...

A short analyse, it seems that's because NFSD was builtin while EXPORTFS
was a module in my previous config file. Imho EXPORTFS would be build as
NFSD?

Is the following hunk would do the trick:
--- fs/Kconfig.Orig     2005-02-03 16:45:13.562275206 +0100
+++ fs/Kconfig  2005-02-03 16:46:36.496469111 +0100
@@ -1400,6 +1400,7 @@
        tristate "NFS server support"
        depends on INET
        select LOCKD
+       select EXPORTFS
        select SUNRPC
        help
          If you want your Linux box to act as an NFS *server*, so that o=
ther
=3D=3D=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D=3D=3D

Thanks in advance,
    Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
