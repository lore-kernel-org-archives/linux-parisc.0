Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C24864837
	for <parisc-linux@lists.parisc-linux.org>; Tue, 17 Jun 2003 09:08:08 -0600 (MDT)
Message-Id: <200306171508.h5HF86eW010149@hiauly1.hia.nrc.ca>
To: jsoe0708@tiscali.be (Joel Soete)
Date: Tue, 17 Jun 2003 11:08:05 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3ED70CF1000065CC@ocpmta2.freegates.net> from "Joel Soete" at Jun 17, 2003 09:08:40 am
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Subject: [parisc-linux] Re: g++ (3.3): ...Error: Field out of range
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

Hi Joel,

>  g3.3 -DHAVE_CONFIG_H -I. -I/CAD/OpenCascade/src/OCC/OCC/src/TKFillet -I../..
> -I/CAD/OpenCascade/src/OCC/OCC/inc -I/CAD/OpenCascade/src/OCC/OCC/drv/ChFiDS
> -I/CAD/OpenCascade/src/OCC/OCC/drv/ChFi2d -I/CAD/OpenCascade/src/OCC/OCC/drv/ChFi3d
> -I/CAD/OpenCascade/src/OCC/OCC/drv/ChFiKPart -I/CAD/OpenCascade/src/OCC/OCC/drv/Blend
> -I/CAD/OpenCascade/src/OCC/OCC/drv/BRepBlend -I/CAD/OpenCascade/src/OCC/OCC/drv/BlendFunc
> -I/CAD/OpenCascade/src/OCC/OCC/drv/BRepFilletAPI -I/CAD/OpenCascade/src/OCC/OCC/drv/FilletSurf
> -g -O2 -DCSFDB -MT ChFi3d_Builder_CnCrn.lo -MD -MP -MF .deps/ChFi3d_Builder_CnCrn.Tpo
> -c /CAD/OpenCascade/src/OCC/OCC/src/ChFi3d/ChFi3d_Builder_CnCrn.cxx  -fPIC
> -DPIC -o .libs/ChFi3d_Builder_CnCrn.o
> /tmp/ccQuyyIf.s: Assembler messages:
> /tmp/ccQuyyIf.s:146240: Error: Field out of range [-262144..262143] (-290528).
> make[3]: *** [ChFi3d_Builder_CnCrn.lo] Error 1
> make[3]: Leaving directory `/CAD/OpenCascade/build-40/src/TKFillet'
> make[2]: *** [all-recursive] Error 1
> make[2]: Leaving directory `/CAD/OpenCascade/build-40/src'
> make[1]: *** [all-recursive] Error 1
> make[1]: Leaving directory `/CAD/OpenCascade/build-40'
> make: *** [all] Error 2
> 
> palx2000:/CAD/OpenCascade/build-40# dpkg -l g3.3
> Desired=Unknown/Install/Remove/Purge/Hold
> | Status=Not/Installed/Config-files/Unpacked/Failed-config/Half-installed
> |/ Err?=(none)/Hold/Reinst-required/X=both-problems (Status,Err: uppercase=bad)
> ||/ Name                    Version                 Description
> =======================-=======================-==============================================================
> ii  g3.3                 3.3-3                   The GNU C compiler
> 
> This occurs as well with binutils 2.13.90.0.18-1.7 as with 2.14.90.0.4-0.1.
> 
> OTC according gcc br 10274 (<http://gcc.gnu.org/bugzilla/show_bug.cgi?id=10274>)
> which I filled in because of a ICE (in its time), binutils 2.13.2.1 would
> solved this pb (but unfortunately not debian available). What should I do
> more to help to fix this?

You could try assembling with the current cvs version of binutils.  You
can generate an assembler file by changing `-c' to `-S' and the output
file name in the above command.  This will allow you to look at the
assembler line in question and see whether this is a problem with stubs
or not (i.e., something other than a branch to a function).  As this is
C++ code, there might be a huge number of small functions causing overflow
of the stub table.

The stub table fix was done quite sometime ago and I would have thought
that recent debian versions of binutils would have it.

If this is not a stub table overflow problem, please file a gcc PR
including the preprocessed source from the above command.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
