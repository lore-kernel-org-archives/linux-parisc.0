Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hotmail.com (oe13.law4.hotmail.com [216.33.148.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 493B2482B
	for <parisc-linux@parisc-linux.org>; Sun,  4 Nov 2001 11:47:52 -0700 (MST)
From: "kenneth westelinck" <kennywest1@hotmail.com>
To: "Kaj-Michael Lang" <milang@tal.org>,
	<parisc-linux@parisc-linux.org>
References: <OE761L3gJcYPqd2rg2Q00007507@hotmail.com> <003101c163a9$48570590$56dc10c3@amos>
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails
Date: Sun, 4 Nov 2001 19:46:23 +0100
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0017_01C16569.61E3B910"
Message-ID: <OE13GhAj5p1Fjxe0ymQ00007efc@hotmail.com>
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

This is a multi-part message in MIME format.

------=_NextPart_000_0017_01C16569.61E3B910
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Nope, same error (see the attached file). Any other ideas?

----- Original Message -----
From: "Kaj-Michael Lang" <milang@tal.org>
To: "kenneth westelinck" <kennywest1@hotmail.com>;
<parisc-linux@parisc-linux.org>
Sent: Friday, November 02, 2001 3:18 PM
Subject: Re: [parisc-linux] Compiling Mozilla on parisc-linux fails


> > "./configure --build=hppa-hpux --host=hppa-hpux". Again I passed the
test
> so
>
> Try:
>
> ./configure --build=hppa-linux --host=hppa-linux
>
> Works with a bunch of software that won't recogonice "parisc"
>
> --
> Kaj-Michael Lang , milang@tal.org
>
>
>
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>

------=_NextPart_000_0017_01C16569.61E3B910
Content-Type: application/octet-stream;
	name="make.log.hppa-linux"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
	filename="make.log.hppa-linux"

make[1]: Entering directory `/usr/local/src/mozilla/config'=0A=
nsinstall.c=0A=
gcc -o nsinstall.o -c -DOSTYPE=3D\"Linux2.4\" -DOSARCH=3D\"Linux\" =
-DMOZ_REFLOW_PERF -DMOZ_REFLOW_PERF_DSP -DOJI -D_BSD_SOURCE   =
-I../dist/include -I../dist/include =
-I/usr/local/src/mozilla/dist/include/nspr      -I/usr/X11R6/include   =
-fPIC -I/usr/X11R6/include -Wall -W -Wno-unused -Wpointer-arith =
-Wcast-align -pedantic -Wno-long-long -pipe -fshort-wchar  -DDEBUG =
-DDEBUG_root -DTRACING -g -I/usr/X11R6/include -include ../config-defs.h =
-DMOZILLA_CLIENT -Wp,-MD,.deps/nsinstall.pp nsinstall.c=0A=
pathsub.c=0A=
gcc -o pathsub.o -c -DOSTYPE=3D\"Linux2.4\" -DOSARCH=3D\"Linux\" =
-DMOZ_REFLOW_PERF -DMOZ_REFLOW_PERF_DSP -DOJI -D_BSD_SOURCE   =
-I../dist/include -I../dist/include =
-I/usr/local/src/mozilla/dist/include/nspr      -I/usr/X11R6/include   =
-fPIC -I/usr/X11R6/include -Wall -W -Wno-unused -Wpointer-arith =
-Wcast-align -pedantic -Wno-long-long -pipe -fshort-wchar  -DDEBUG =
-DDEBUG_root -DTRACING -g -I/usr/X11R6/include -include ../config-defs.h =
-DMOZILLA_CLIENT -Wp,-MD,.deps/pathsub.pp pathsub.c=0A=
gcc -o nsinstall -I/usr/X11R6/include -Wall -W -Wno-unused =
-Wpointer-arith -Wcast-align -pedantic -Wno-long-long -pipe =
-fshort-wchar  -DDEBUG -DDEBUG_root -DTRACING -g nsinstall.o pathsub.o  =
-L../dist/bin -L../dist/lib  -ldl -lm  -lc  =0A=
/usr/bin/perl -I. ./bdate.pl build_number =0A=
../config/nsinstall -R -m 444 nsBuildID.h ../dist/include=0A=
/usr/bin/perl -I../config ../config/build-list.pl =
../dist/include/.headerlist nsBuildID.h=0A=
rm -f ../config/final-link-comps ../config/final-link-libs =
../config/final-link-comp-names=0A=
make[1]: Leaving directory `/usr/local/src/mozilla/config'=0A=
make[1]: Entering directory `/usr/local/src/mozilla/build'=0A=
make[2]: Entering directory `/usr/local/src/mozilla/build/unix'=0A=
chmod 755 mozilla-config=0A=
../../config/nsinstall -R -m 755 mozilla-config ../../dist/bin=0A=
make[2]: Leaving directory `/usr/local/src/mozilla/build/unix'=0A=
make[1]: Leaving directory `/usr/local/src/mozilla/build'=0A=
make[1]: Entering directory `/usr/local/src/mozilla/nsprpub'=0A=
cd config; make export=0A=
make[2]: Entering directory `/usr/local/src/mozilla/nsprpub/config'=0A=
rm -f /usr/local/src/mozilla/dist/bin/nspr-config=0A=
make[2]: Leaving directory `/usr/local/src/mozilla/nsprpub/config'=0A=
cd pr; make export=0A=
make[2]: Entering directory `/usr/local/src/mozilla/nsprpub/pr'=0A=
cd include; make export=0A=
make[3]: Entering directory `/usr/local/src/mozilla/nsprpub/pr/include'=0A=
cd md; make export=0A=
make[4]: Entering directory =
`/usr/local/src/mozilla/nsprpub/pr/include/md'=0A=
../../../config/./nsinstall -R -m 444 ./_linux.cfg =
/usr/local/src/mozilla/dist/include/nspr=0A=
mv -f /usr/local/src/mozilla/dist/include/nspr/_linux.cfg =
/usr/local/src/mozilla/dist/include/nspr/prcpucfg.h=0A=
make[4]: Leaving directory `/usr/local/src/mozilla/nsprpub/pr/include/md'=0A=
cd private; make export=0A=
make[4]: Entering directory =
`/usr/local/src/mozilla/nsprpub/pr/include/private'=0A=
../../../config/./nsinstall -R -m 444 ./pprio.h ./pprthred.h ./prpriv.h =
/usr/local/src/mozilla/dist/include/nspr/private=0A=
make[4]: Leaving directory =
`/usr/local/src/mozilla/nsprpub/pr/include/private'=0A=
cd obsolete; make export=0A=
make[4]: Entering directory =
`/usr/local/src/mozilla/nsprpub/pr/include/obsolete'=0A=
../../../config/./nsinstall -R -m 444 ./pralarm.h ./probslet.h =
./protypes.h ./prsem.h /usr/local/src/mozilla/dist/include/nspr/obsolete=0A=
make[4]: Leaving directory =
`/usr/local/src/mozilla/nsprpub/pr/include/obsolete'=0A=
../../config/./nsinstall -R -m 444 ./nspr.h ./pratom.h ./prbit.h =
./prclist.h ./prcmon.h ./prcountr.h ./prcvar.h ./prdtoa.h ./prenv.h =
./prerr.h ./prerror.h ./prinet.h ./prinit.h ./prinrval.h ./prio.h =
./pripcsem.h ./prlink.h ./prlock.h ./prlog.h ./prlong.h ./prmem.h =
./prmon.h ./prmwait.h ./prnetdb.h ./prolock.h ./prpdce.h ./prprf.h =
./prproces.h ./prrng.h ./prrwlock.h ./prshm.h ./prshma.h ./prsystem.h =
./prthread.h ./prtime.h ./prtpool.h ./prtrace.h ./prtypes.h ./prvrsion.h =
./prwin16.h /usr/local/src/mozilla/dist/include/nspr=0A=
make[3]: Leaving directory `/usr/local/src/mozilla/nsprpub/pr/include'=0A=
cd src; make export=0A=
make[3]: Entering directory `/usr/local/src/mozilla/nsprpub/pr/src'=0A=
cd io; make export=0A=
make[4]: Entering directory `/usr/local/src/mozilla/nsprpub/pr/src/io'=0A=
gcc -o prfdcach.o -c     -ansi -Wall -pipe -g -fPIC  -UNDEBUG  =
-DDEBUG=3D1 -DDEBUG_root=3D1 -DXP_UNIX=3D1 -D_POSIX_SOURCE=3D1 =
-D_BSD_SOURCE=3D1 -D_SVID_SOURCE=3D1 -D_LARGEFILE64_SOURCE=3D1 =
-DHAVE_FCNTL_FILE_LOCKING=3D1 -DLINUX=3D1 -Dlinux=3D1 -DHAVE_LCHOWN=3D1 =
-DHAVE_STRERROR=3D1 -D_REENTRANT=3D1  -DFORCE_PR_LOG -D_PR_PTHREADS =
-UHAVE_CVAR_BUILT_ON_SEM -D_NSPR_BUILD_ =
-I/usr/local/src/mozilla/dist/include/nspr -I../../../pr/include =
-I../../../pr/include/private  prfdcach.c=0A=
In file included from =
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:55,=0A=
                 from =
/usr/local/src/mozilla/dist/include/nspr/pratom.h:43,=0A=
                 from /usr/local/src/mozilla/dist/include/nspr/nspr.h:38,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prcpucfg.h:419:2: #error =
"Unknown CPU architecture"=0A=
In file included from =
/usr/local/src/mozilla/dist/include/nspr/pratom.h:43,=0A=
                 from /usr/local/src/mozilla/dist/include/nspr/nspr.h:38,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:277:2: #error No =
suitable type for PRInt8/PRUint8=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:290:2: #error No =
suitable type for PRInt16/PRUint16=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:310:2: #error No =
suitable type for PRInt32/PRUint32=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:361:2: #error =
'sizeof(int)' not sufficient for platform use=0A=
In file included from =
/usr/local/src/mozilla/dist/include/nspr/pratom.h:43,=0A=
                 from /usr/local/src/mozilla/dist/include/nspr/nspr.h:38,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:384: parse error =
before "PROffset32"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:384: warning: type =
defaults to `int' in declaration of `PROffset32'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:384: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:411: parse error =
before "PRBool"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:411: warning: type =
defaults to `int' in declaration of `PRBool'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:411: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:421: parse error =
before "PRPackedBool"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:421: warning: type =
defaults to `int' in declaration of `PRPackedBool'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:421: warning: data =
definition has no type or storage class=0A=
In file included from =
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:482,=0A=
                 from =
/usr/local/src/mozilla/dist/include/nspr/pratom.h:43,=0A=
                 from /usr/local/src/mozilla/dist/include/nspr/nspr.h:38,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:45: parse =
error before "uintn"=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:45: =
warning: type defaults to `int' in declaration of `uintn'=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:45: =
warning: data definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:47: parse =
error before "intn"=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:47: =
warning: type defaults to `int' in declaration of `intn'=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:47: =
warning: data definition has no type or storage class=0A=
In file included from =
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:482,=0A=
                 from =
/usr/local/src/mozilla/dist/include/nspr/pratom.h:43,=0A=
                 from /usr/local/src/mozilla/dist/include/nspr/nspr.h:38,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:114: parse =
error before "uint32"=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:114: =
warning: type defaults to `int' in declaration of `uint32'=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:114: =
warning: data definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:125: parse =
error before "uint16"=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:125: =
warning: type defaults to `int' in declaration of `uint16'=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:125: =
warning: data definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:133: parse =
error before "uint8"=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:133: =
warning: type defaults to `int' in declaration of `uint8'=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:133: =
warning: data definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:154: parse =
error before "int32"=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:154: =
warning: type defaults to `int' in declaration of `int32'=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:154: =
warning: data definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:168: parse =
error before "int16"=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:168: =
warning: type defaults to `int' in declaration of `int16'=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:168: =
warning: data definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:178: parse =
error before "int8"=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:178: =
warning: type defaults to `int' in declaration of `int8'=0A=
/usr/local/src/mozilla/dist/include/nspr/obsolete/protypes.h:178: =
warning: data definition has no type or storage class=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/nspr.h:38,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:57: parse error before =
"PR_AtomicIncrement"=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:57: parse error before =
'*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:57: warning: type =
defaults to `int' in declaration of `PR_AtomicIncrement'=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:57: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:68: parse error before =
"PR_AtomicDecrement"=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:68: parse error before =
'*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:68: warning: type =
defaults to `int' in declaration of `PR_AtomicDecrement'=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:68: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:80: parse error before =
"PR_AtomicSet"=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:80: parse error before =
'*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:80: warning: type =
defaults to `int' in declaration of `PR_AtomicSet'=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:80: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:92: parse error before =
"PR_AtomicAdd"=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:92: parse error before =
'*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:92: warning: type =
defaults to `int' in declaration of `PR_AtomicAdd'=0A=
/usr/local/src/mozilla/dist/include/nspr/pratom.h:92: warning: data =
definition has no type or storage class=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/nspr.h:39,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prbit.h:56: parse error before =
"PR_CeilingLog2"=0A=
/usr/local/src/mozilla/dist/include/nspr/prbit.h:56: parse error before =
"i"=0A=
/usr/local/src/mozilla/dist/include/nspr/prbit.h:56: warning: type =
defaults to `int' in declaration of `PR_CeilingLog2'=0A=
/usr/local/src/mozilla/dist/include/nspr/prbit.h:56: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prbit.h:61: parse error before =
"PR_FloorLog2"=0A=
/usr/local/src/mozilla/dist/include/nspr/prbit.h:61: parse error before =
"i"=0A=
/usr/local/src/mozilla/dist/include/nspr/prbit.h:61: warning: type =
defaults to `int' in declaration of `PR_FloorLog2'=0A=
/usr/local/src/mozilla/dist/include/nspr/prbit.h:61: warning: data =
definition has no type or storage class=0A=
In file included from =
/usr/local/src/mozilla/dist/include/nspr/prmon.h:39,=0A=
                 from =
/usr/local/src/mozilla/dist/include/nspr/prcmon.h:48,=0A=
                 from /usr/local/src/mozilla/dist/include/nspr/nspr.h:41,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:58: parse error =
before "PRIntervalTime"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:58: warning: type =
defaults to `int' in declaration of `PRIntervalTime'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:58: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:105: parse error =
before "PR_IntervalNow"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:105: warning: type =
defaults to `int' in declaration of `PR_IntervalNow'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:105: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:123: parse error =
before "PR_TicksPerSecond"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:123: warning: type =
defaults to `int' in declaration of `PR_TicksPerSecond'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:123: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:142: parse error =
before "PR_SecondsToInterval"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:142: parse error =
before "seconds"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:142: warning: type =
defaults to `int' in declaration of `PR_SecondsToInterval'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:142: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:143: parse error =
before "PR_MillisecondsToInterval"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:143: parse error =
before "milli"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:143: warning: type =
defaults to `int' in declaration of `PR_MillisecondsToInterval'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:143: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:144: parse error =
before "PR_MicrosecondsToInterval"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:144: parse error =
before "micro"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:144: warning: type =
defaults to `int' in declaration of `PR_MicrosecondsToInterval'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:144: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:163: parse error =
before "PR_IntervalToSeconds"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:163: parse error =
before "ticks"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:163: warning: type =
defaults to `int' in declaration of `PR_IntervalToSeconds'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:163: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:164: parse error =
before "PR_IntervalToMilliseconds"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:164: parse error =
before "ticks"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:164: warning: type =
defaults to `int' in declaration of `PR_IntervalToMilliseconds'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:164: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:165: parse error =
before "PR_IntervalToMicroseconds"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:165: parse error =
before "ticks"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:165: warning: type =
defaults to `int' in declaration of `PR_IntervalToMicroseconds'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinrval.h:165: warning: data =
definition has no type or storage class=0A=
In file included from =
/usr/local/src/mozilla/dist/include/nspr/prcmon.h:48,=0A=
                 from /usr/local/src/mozilla/dist/include/nspr/nspr.h:41,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prmon.h:92: parse error before =
"PRIntervalTime"=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/nspr.h:41,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prcmon.h:73: parse error before =
"PRIntervalTime"=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/nspr.h:42,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prcvar.h:94: parse error before =
"PRIntervalTime"=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/nspr.h:43,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prdtoa.h:69: parse error before =
"PRIntn"=0A=
/usr/local/src/mozilla/dist/include/nspr/prdtoa.h:82: parse error before =
"PRIntn"=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/nspr.h:45,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:42: parse error =
before "PRErrorCode"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:42: warning: type =
defaults to `int' in declaration of `PRErrorCode'=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:42: warning: data =
definition has no type or storage class=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/nspr.h:45,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:54: parse error =
before "errorCode"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:66: parse error =
before "textLength"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:71: parse error =
before "PR_GetError"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:71: warning: type =
defaults to `int' in declaration of `PR_GetError'=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:71: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:77: parse error =
before "PR_GetOSError"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:77: warning: type =
defaults to `int' in declaration of `PR_GetOSError'=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:77: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:84: parse error =
before "PR_GetErrorTextLength"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:84: warning: type =
defaults to `int' in declaration of `PR_GetErrorTextLength'=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:84: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:91: parse error =
before "PR_GetErrorText"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:91: warning: type =
defaults to `int' in declaration of `PR_GetErrorText'=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:91: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:174: parse error =
before "PRLanguageCode"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:174: warning: type =
defaults to `int' in declaration of `PRLanguageCode'=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:174: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:196: parse error =
before "PRErrorCode"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:196: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:198: parse error =
before '}' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:226: parse error =
before "code"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:259: parse error =
before "code"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:273: parse error =
before "code"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:300: parse error =
before "PR_ErrorInstallTable"=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:300: warning: type =
defaults to `int' in declaration of `PR_ErrorInstallTable'=0A=
/usr/local/src/mozilla/dist/include/nspr/prerror.h:300: warning: data =
definition has no type or storage class=0A=
In file included from =
/usr/local/src/mozilla/dist/include/nspr/prinit.h:38,=0A=
                 from /usr/local/src/mozilla/dist/include/nspr/nspr.h:47,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prthread.h:140: parse error =
before "PRUint32"=0A=
/usr/local/src/mozilla/dist/include/nspr/prthread.h:201: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prthread.h:214: parse error =
before "tpdIndex"=0A=
/usr/local/src/mozilla/dist/include/nspr/prthread.h:225: parse error =
before "tpdIndex"=0A=
/usr/local/src/mozilla/dist/include/nspr/prthread.h:262: parse error =
before "ticks"=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/nspr.h:47,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:85: parse error before =
'*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:85: warning: type =
defaults to `int' in declaration of `PRBool'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:85: `PRBool' declared =
as function returning a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:85: `PRBool' =
redeclared as different kind of symbol=0A=
/usr/local/src/mozilla/dist/include/nspr/prtypes.h:411: previous =
declaration of `PRBool'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:95: `PR_VersionCheck' =
declared as function returning a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:109: parse error =
before "PRUintn"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:129: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:129: parse error =
before "argc"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:129: warning: type =
defaults to `int' in declaration of `PRIntn'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:129: `PRIntn' declared =
as function returning a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:132: parse error =
before "prmain"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:132: `PR_Initialize' =
declared as function returning a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:137: `PR_Initialized' =
declared as function returning a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:184: parse error =
before "numCPUs"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:216: field =
`initialized' declared as a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:217: parse error =
before "PRInt32"=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:217: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:219: parse error =
before '}' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:219: warning: type =
defaults to `int' in declaration of `PRCallOnceType'=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:219: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prinit.h:224: parse error =
before '*' token=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/prio.h:46,=0A=
                 from /usr/local/src/mozilla/dist/include/nspr/nspr.h:49,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:85: parse error before =
"PRInt32"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:85: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:86: warning: type =
defaults to `int' in declaration of `tp_dst_offset'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:86: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:87: warning: type =
defaults to `int' in declaration of `PRTimeParameters'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:87: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:113: parse error =
before "PRInt32"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:113: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:114: warning: type =
defaults to `int' in declaration of `tm_sec'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:114: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:116: parse error =
before "tm_min"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:116: warning: type =
defaults to `int' in declaration of `tm_min'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:116: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:117: parse error =
before "tm_hour"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:117: warning: type =
defaults to `int' in declaration of `tm_hour'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:117: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:118: parse error =
before "tm_mday"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:118: warning: type =
defaults to `int' in declaration of `tm_mday'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:118: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:120: parse error =
before "tm_month"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:120: warning: type =
defaults to `int' in declaration of `tm_month'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:120: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:121: parse error =
before "tm_year"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:121: warning: type =
defaults to `int' in declaration of `tm_year'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:121: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:124: parse error =
before "tm_wday"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:124: warning: type =
defaults to `int' in declaration of `tm_wday'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:124: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:126: parse error =
before "tm_yday"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:126: warning: type =
defaults to `int' in declaration of `tm_yday'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:126: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:129: parse error =
before "tm_params"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:129: warning: type =
defaults to `int' in declaration of `tm_params'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:129: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:130: warning: type =
defaults to `int' in declaration of `PRExplodedTime'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:130: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:155: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:155: warning: type =
defaults to `int' in declaration of `PRExplodedTime'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:155: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:155: warning: type =
defaults to `int' in declaration of `PRTimeParameters'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:155: =
`PRTimeParameters' declared as function returning a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:155: =
`PRTimeParameters' redeclared as different kind of symbol=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:87: previous =
declaration of `PRTimeParameters'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:192: parse error =
before "PRTimeParamFn"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:200: warning: type =
defaults to `int' in declaration of `PRExplodedTime'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:200: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:215: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:222: warning: type =
defaults to `int' in declaration of `PRExplodedTime'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:222: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:222: =
`PR_LocalTimeParameters' declared as function returning a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:225: warning: type =
defaults to `int' in declaration of `PRExplodedTime'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:225: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:225: =
`PR_GMTParameters' declared as function returning a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:231: warning: type =
defaults to `int' in declaration of `PRExplodedTime'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:231: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:231: =
`PR_USPacificTimeParameters' declared as function returning a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:281: parse error =
before "PR_FormatTime"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:282: warning: type =
defaults to `int' in declaration of `PRExplodedTime'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:282: parse error =
before '*' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:282: warning: type =
defaults to `int' in declaration of `PR_FormatTime'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:282: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:288: parse error =
before "PR_FormatTimeUSEnglish"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:288: parse error =
before "PRUint32"=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:289: warning: type =
defaults to `int' in declaration of `PR_FormatTimeUSEnglish'=0A=
/usr/local/src/mozilla/dist/include/nspr/prtime.h:289: warning: data =
definition has no type or storage class=0A=
In file included from /usr/local/src/mozilla/dist/include/nspr/nspr.h:49,=0A=
                 from ../../../pr/include/private/primpl.h:66,=0A=
                 from prfdcach.c:35:=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:83: field `identity' =
declared as a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:150: parse error before =
"PRUint8"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:150: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:150: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:151: warning: type =
defaults to `int' in declaration of `_S6_u16'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:151: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:152: parse error before =
"_S6_u32"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:152: warning: type =
defaults to `int' in declaration of `_S6_u32'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:152: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:154: parse error before =
'}' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:154: warning: type =
defaults to `int' in declaration of `_S6_un'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:154: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:155: parse error before =
'}' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:165: parse error before =
"PRUint16"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:165: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:165: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:171: parse error before =
'}' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:171: warning: type =
defaults to `int' in declaration of `raw'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:171: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:173: parse error before =
"PRUint16"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:173: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:174: warning: type =
defaults to `int' in declaration of `port'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:174: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:175: parse error before =
"ip"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:175: warning: type =
defaults to `int' in declaration of `ip'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:175: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:181: parse error before =
'}' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:181: warning: type =
defaults to `int' in declaration of `inet'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:181: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:183: parse error before =
"PRUint16"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:183: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:184: warning: type =
defaults to `int' in declaration of `port'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:184: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:185: parse error before =
"flowinfo"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:185: warning: type =
defaults to `int' in declaration of `flowinfo'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:185: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:186: conflicting types =
for `ip'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:175: previous =
declaration of `ip'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:187: parse error before =
"scope_id"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:187: warning: type =
defaults to `int' in declaration of `scope_id'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:187: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:188: warning: type =
defaults to `int' in declaration of `ipv6'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:188: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:191: parse error before =
"PRUint16"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:191: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:193: parse error before =
'}' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:193: warning: type =
defaults to `int' in declaration of `local'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:193: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:195: parse error before =
'}' token=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:231: field `polarity' =
declared as a function=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:232: parse error before =
"PRIntervalTime"=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:232: warning: no =
semicolon at end of struct or union=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:233: warning: type =
defaults to `int' in declaration of `PRLinger'=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:233: warning: data =
definition has no type or storage class=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:236: field `mcaddr' has =
incomplete type=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:237: field `ifaddr' has =
incomplete type=0A=
/usr/local/src/mozilla/dist/include/nspr/prio.h:238: confused by earlier =
errors, bailing out=0A=
{standard input}: Assembler messages:=0A=
{standard input}:593: Warning: end of file in string; inserted '"'=0A=
{standard input}:613: Warning: .stabs: missing comma=0A=
make[4]: *** [prfdcach.o] Error 1=0A=
make[4]: Leaving directory `/usr/local/src/mozilla/nsprpub/pr/src/io'=0A=
make[3]: *** [export] Error 2=0A=
make[3]: Leaving directory `/usr/local/src/mozilla/nsprpub/pr/src'=0A=
make[2]: *** [export] Error 2=0A=
make[2]: Leaving directory `/usr/local/src/mozilla/nsprpub/pr'=0A=
make[1]: *** [export] Error 2=0A=
make[1]: Leaving directory `/usr/local/src/mozilla/nsprpub'=0A=
make: *** [export] Error 2=0A=

------=_NextPart_000_0017_01C16569.61E3B910--
