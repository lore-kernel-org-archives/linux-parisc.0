From: Ivar <orskaug@stud.ntnu.no>
Subject: [parisc-linux] Building Firefox 0.9.1 / Binutils problem
Date: Sun, 4 Jul 2004 19:43:50 +0200 (MEST)
Message-ID: <Pine.GSO.4.58.0407041929330.20476@panter.stud.ntnu.no>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN;
  charset=US-ASCII
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


I'm trying to compile the latest Firefox from source for parisc-linux
unstable, however not suprisingly, I've run into problems.

The problem seems to be the linker, here is some output:

c++ -I/usr/X11R6/include -fno-rtti -fno-exceptions -Wall -Wconversion
-Wpointer-arith -Wcast-align -Woverloaded-virtual -Wsynth
-Wno-ctor-dtor-privacy -Wno-non-virtual-dtor -Wno-long-long -pedantic
-fshort-wchar -pthread -pipe  -DDEBUG -D_DEBUG -DDEBUG_root -DTRACING -g
-fno-inline -fPIC -shared -Wl,-h -Wl,libuconv.so -o libuconv.so  ugen.o
uscan.o umap.o nsUConvModule.o nsCharsetAliasImp.o
nsConverterInputStream.o nsTextToSubURI.o nsURLProperties.o
nsCharsetConverterManager.o nsUTF8ConverterService.o nsScriptableUConv.o
nsUnicodeDecodeHelper.o nsUnicodeEncodeHelper.o nsMappingCache.o
nsISO88591ToUnicode.o nsCP1252ToUnicode.o nsMacRomanToUnicode.o
nsUTF8ToUnicode.o nsUnicodeToISO88591.o nsUnicodeToCP1252.o
nsUnicodeToMacRoman.o nsUnicodeToUTF8.o nsUNIXCharset.o
-Wl,--whole-archive ../../../dist/lib/libucvlatin_s.a
../../../dist/lib/libucvibm_s.a ../../../dist/lib/libucvja_s.a
../../../dist/lib/libucvtw2_s.a ../../../dist/lib/libucvtw_s.a
../../../dist/lib/libucvko_s.a ../../../dist/lib/libucvcn_s.a
-Wl,--no-whole-archive ../../../dist/lib/libucvutil_s.a
../../../dist/lib/libunicharutil_s.a  -L../../../dist/bin -lxpcom
-L../../../dist/bin -L/usr/mozilla/dist/lib -lplds4 -lplc4 -lnspr4
-lpthread -ldl    -Wl,-Bsymbolic -ldl -lm
/usr/bin/ld: BFD 2.14.90.0.7 20031029 Debian GNU/Linux internal error,
aborting at ../../bfd/elf32-hppa.c line 3624 in
elf32_hppa_relocate_section

/usr/bin/ld: Please report this bug.

collect2: ld returned 1 exit status
make[4]: *** [libuconv.so] Error 1
make[4]: Leaving directory `/usr/mozilla/intl/uconv/src'
make[3]: *** [libs] Error 2
make[3]: Leaving directory `/usr/mozilla/intl/uconv'
make[2]: *** [libs] Error 2
make[2]: Leaving directory `/usr/mozilla/intl'
make[1]: *** [tier_9] Error 2
make[1]: Leaving directory `/usr/mozilla'
make: *** [default] Error 2

I'm rnning unstable:  binutils       2.14.90.0.7-8  and gcc/g++ 3.3

If anyone can indicate where to start in order to track down this
problem, its very appreciated!

cheers,

 Ivar
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
