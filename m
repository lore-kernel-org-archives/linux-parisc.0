Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Mon, 11 Aug 2003 13:09:14 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] xfree86 4.2.1-9 build problem
Message-ID: <20030811190914.GA25311@dsl2.external.hp.com>
References: <20030811152442.GB20405@dsl2.external.hp.com> <200308111730.h7BHUf9S018795@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="mP3DRpeJDSE+ciuQ"
In-Reply-To: <200308111730.h7BHUf9S018795@hiauly1.hia.nrc.ca>
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

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Aug 11, 2003 at 01:30:40PM -0400, John David Anglin wrote:
> It's not clear what's going on.  Possibly, linking with libgcc.a
> is interacting in a bad way with shared libraries linked with
> libgcc_s.so.  You can get more info by adding `-Wl,-v' to the link
> command.  Adding `-Wl,-debug' to the gcc link command will show
> the full `ld' command.

-debug output is attached.
`-Wl,-v' only shows the "ld" command. The -debug output has that too.

What's interesting is the "ld" command has "-lgcc-eh" which is where
the missing symbols are defined:
grundler <512>nm libgcc_eh.a | grep _Unwind_SjLj_Resume
0000079c T _Unwind_SjLj_Resume
000008d0 T _Unwind_SjLj_Resume_or_Rethrow
grundler <513>pwd
/usr/lib/gcc-lib/hppa-linux/3.3.1


> I am certain that the symbols are defined in libgcc_s.so.  It may
> be that the linker isn't looking for dependent libraries correctly.

I wonder if "-Wl,-rpath-link,../../exports/lib" is the problem.
I'd normally expect an application to use "-L" to specify additional
lib search paths.

> Using the g++ driver or adding `-shared-libgcc' to the link command
> should work around the problem.  But I don't think that it should
> be necessary.

ok

thanks,
grant

--mP3DRpeJDSE+ciuQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="glxinfo.debug"

grundler@gsyprf11:/usr/src/xfree86-4.2.1/build-tree/xc/programs/glxinfo$ gcc -o glxinfo -g -O -ansi -pedantic -Wall -Wpointer-arith -Wstrict-prototypes -Wmissing-prototypes -Wmissing-declarations -Wredundant-decls -Wnested-externs -Wundef     -L../../exports/lib glxinfo.o -lGLU -lGL -lXext -lX11  -lpthread -lm -lgcc_eh  -Wl,-rpath-link,../../exports/lib -Wl,-debug
Convert string '/usr/lib/gcc-lib/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/:/usr/lib/gcc/hppa-linux/3.3.1/:/usr/lib/gcc/hppa-linux/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/bin/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/bin/' into prefixes, separator = ':'
  - add prefix: /usr/lib/gcc-lib/hppa-linux/3.3.1/
  - add prefix: /usr/lib/gcc-lib/hppa-linux/3.3.1/
  - add prefix: /usr/lib/gcc-lib/hppa-linux/
  - add prefix: /usr/lib/gcc/hppa-linux/3.3.1/
  - add prefix: /usr/lib/gcc/hppa-linux/
  - add prefix: /usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/bin/hppa-linux/3.3.1/
  - add prefix: /usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/bin/
Convert string '/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:/home/grundler/bin' into prefixes, separator = ':'
  - add prefix: /usr/local/bin/
  - add prefix: /usr/bin/
  - add prefix: /bin/
  - add prefix: /usr/bin/X11/
  - add prefix: /usr/games/
  - add prefix: /home/grundler/bin/
Looking for 'real-ld'
Looking for 'collect-ld'
Looking for 'ld'
Looking for 'ld'
Looking for 'gnm'
Looking for 'gnm'
Looking for 'nm'
Looking for 'nm'
Looking for 'gstrip'
Looking for 'gstrip'
Looking for 'strip'
Looking for 'strip'
Looking for 'gcc'
Looking for 'gcc'
collect2 version 3.3.1 (Debian) (hppa)
ld_file_name        = /usr/bin/ld
c_file_name         = /usr/bin/gcc
nm_file_name        = /usr/bin/nm
strip_file_name     = /usr/bin/strip
c_file              = /tmp/ccAA0Eun.c
o_file              = /tmp/cc0QBMNA.o
COLLECT_GCC_OPTIONS = '-o' 'glxinfo' '-g' '-O' '-ansi' '-pedantic' '-Wall' '-Wpointer-arith' '-Wstrict-prototypes' '-Wmissing-prototypes' '-Wmissing-declarations' '-Wredundant-decls' '-Wnested-externs' '-Wundef' '-L../../exports/lib'
COLLECT_GCC         = gcc
COMPILER_PATH       = /usr/lib/gcc-lib/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/:/usr/lib/gcc/hppa-linux/3.3.1/:/usr/lib/gcc/hppa-linux/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/bin/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/bin/
LIBRARY_PATH        = /usr/lib/gcc-lib/hppa-linux/3.3.1/:/usr/lib/gcc/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/lib/hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../../hppa-linux/lib/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../hppa-linux/3.3.1/:/usr/lib/gcc-lib/hppa-linux/3.3.1/../../../:/lib/hppa-linux/3.3.1/:/lib/:/usr/lib/hppa-linux/3.3.1/:/usr/lib/

/usr/bin/ld --eh-frame-hdr -dynamic-linker /lib/ld.so.1 -o glxinfo /usr/lib/gcc-lib/hppa-linux/3.3.1/../../../crt1.o /usr/lib/gcc-lib/hppa-linux/3.3.1/../../../crti.o /usr/lib/gcc-lib/hppa-linux/3.3.1/crtbegin.o -L../../exports/lib -L/usr/lib/gcc-lib/hppa-linux/3.3.1 -L/usr/lib/gcc-lib/hppa-linux/3.3.1/../../.. glxinfo.o -lGLU -lGL -lXext -lX11 -lpthread -lm -lgcc_eh -rpath-link ../../exports/lib -lgcc -lgcc_eh -lc -lgcc -lgcc_eh /usr/lib/gcc-lib/hppa-linux/3.3.1/crtend.o /usr/lib/gcc-lib/hppa-linux/3.3.1/../../../crtn.o
../../exports/lib/libGLU.so: undefined reference to `_Unwind_SjLj_Resume@GCC_3.0'
../../exports/lib/libGLU.so: undefined reference to `_Unwind_SjLj_Register@GCC_3.0'
/usr/bin/../lib/libstdc++.so.5: undefined reference to `_Unwind_SjLj_RaiseException@GCC_3.0'
../../exports/lib/libGLU.so: undefined reference to `_Unwind_SjLj_Unregister@GCC_3.0'
/usr/bin/../lib/libstdc++.so.5: undefined reference to `_Unwind_SjLj_Resume_or_Rethrow@GCC_3.3'
collect2: ld returned 1 exit status
[Leaving /tmp/ccAA0Eun.c]
[Leaving /tmp/cc0QBMNA.o]
[Leaving /tmp/ccGtmF6N.ld]
[Leaving glxinfo]
grundler@gsyprf11:/usr/src/xfree86-4.2.1/build-tree/xc/programs/glxinfo$ 


--mP3DRpeJDSE+ciuQ--
