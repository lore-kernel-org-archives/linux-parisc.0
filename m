From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] TLS patches for glibc,
	and problems with symbols (TLS vs. non-TLS __libc_errno).
Date: Wed, 6 Apr 2005 01:52:36 -0400
Message-ID: <20050406055234.GW1833@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
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


Farthest I've gotten in my build yet, putting together the libc library
causes a linker error:

--
gcc   -nostdlib -nostartfiles -r -o
/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-05-hppa/elf/librtld.map.o
'-Wl,-('
/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-05-hppa/elf/dl-allobjs.os
/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-05-hppa/libc_pic.a
-lgcc '-Wl,-)'
-Wl,-Map,/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-05-hppa/elf/librtld.mapT
/mnt/flaire/src/tls-toolchain/install/bin/../lib/gcc/hppa-linux/3.4.3/../../../../hppa-linux/bin/ld:
__libc_errno: TLS definition in
/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-05-hppa/libc_pic.a(errno.os)
section .tbss mismatches non-TLS reference in
/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-05-hppa/libc_pic.a(check_fds.os)
/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-05-hppa/libc_pic.a:
could not read symbols: Bad value
collect2: ld returned 1 exit status
make[2]: ***
[/home/carlos/fsrc/tls-toolchain/build/libc/2005-04-05-hppa/elf/librtld.map]
Error 1
make[2]: Leaving directory `/mnt/flaire/src/tls-toolchain/src/libc/elf'
make[1]: *** [elf/subdir_lib] Error 2
make[1]: Leaving directory `/mnt/flaire/src/tls-toolchain/src/libc'
make: *** [all] Error 2
--

I later realized that this all has to do with our handling of errno. I'm
going to have to bite the bullet and write the ugly ASM code to handle
all the errno cases based on defines during the build.

glibc head patches:
http://www.parisc-linux.org/~carlos/glibc-work/glibc-hppa-patches-2005-04-05.tar.gz

tls patches against the above:
http://www.parisc-linux.org/~carlos/glibc-work/glibc-hppa-tls-2005-04-05.diff

That *should* get you to the above state.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
