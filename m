Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id E46894829
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jun 2003 01:08:48 -0600 (MDT)
Date: Tue, 17 Jun 2003 09:08:40 +0200
Message-ID: <3ED70CF1000065CC@ocpmta2.freegates.net>
From: "Joel Soete" <jsoe0708@tiscali.be>
To: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Subject: [parisc-linux] g++ (3.3): ...Error: Field out of range
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

Hi Dave,

Some month ago we already spook about a similar pb (<http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/018938.html>)
but that was an ld pb and now it is an "Assembler" pb:

 g3.3 -DHAVE_CONFIG_H -I. -I/CAD/OpenCascade/src/OCC/OCC/src/TKFillet -I../..
-I/CAD/OpenCascade/src/OCC/OCC/inc -I/CAD/OpenCascade/src/OCC/OCC/drv/ChFiDS
-I/CAD/OpenCascade/src/OCC/OCC/drv/ChFi2d -I/CAD/OpenCascade/src/OCC/OCC/drv/ChFi3d
-I/CAD/OpenCascade/src/OCC/OCC/drv/ChFiKPart -I/CAD/OpenCascade/src/OCC/OCC/drv/Blend
-I/CAD/OpenCascade/src/OCC/OCC/drv/BRepBlend -I/CAD/OpenCascade/src/OCC/OCC/drv/BlendFunc
-I/CAD/OpenCascade/src/OCC/OCC/drv/BRepFilletAPI -I/CAD/OpenCascade/src/OCC/OCC/drv/FilletSurf
-g -O2 -DCSFDB -MT ChFi3d_Builder_CnCrn.lo -MD -MP -MF .deps/ChFi3d_Builder_CnCrn.Tpo
-c /CAD/OpenCascade/src/OCC/OCC/src/ChFi3d/ChFi3d_Builder_CnCrn.cxx  -fPIC
-DPIC -o .libs/ChFi3d_Builder_CnCrn.o
/tmp/ccQuyyIf.s: Assembler messages:
/tmp/ccQuyyIf.s:146240: Error: Field out of range [-262144..262143] (-290528).
make[3]: *** [ChFi3d_Builder_CnCrn.lo] Error 1
make[3]: Leaving directory `/CAD/OpenCascade/build-40/src/TKFillet'
make[2]: *** [all-recursive] Error 1
make[2]: Leaving directory `/CAD/OpenCascade/build-40/src'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/CAD/OpenCascade/build-40'
make: *** [all] Error 2

palx2000:/CAD/OpenCascade/build-40# dpkg -l g3.3
Desired=Unknown/Install/Remove/Purge/Hold
| Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
|/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
||/ Name                    Version                 Description
=======================-=======================-==============================================================
ii  g3.3                 3.3-3                   The GNU C compiler

This occurs as well with binutils 2.13.90.0.18-1.7 as with 2.14.90.0.4-0.1.

OTC according gcc br 10274 (<http://gcc.gnu.org/bugzilla/show_bug.cgi?id=10274>)
which I filled in because of a ICE (in its time), binutils 2.13.2.1 would
solved this pb (but unfortunately not debian available). What should I do
more to help to fix this?

Thanks in advance,
    Joel

---------------------------------
Découvrez les 6 clés et gagnez le Club Med à Vie avec Tiscali
http://www.tiscali.be/nl/subs/tiscali4life/default.asp?lang=fr
