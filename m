From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] "Unknown machine at ..." on N4k
Date: Fri, 23 Jul 2004 15:10:21 +0200
Message-ID: <40FB87C4000023C7@ocpmta3.freegates.net>
References: <20040722233429.GA27361@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
Cc: List Parisc <parisc-linux@parisc-linux.org>
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040722233429.GA27361@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


Grant,

> 
> On Thu, Jul 22, 2004 at 08:05:32AM +0200, Joel Soete wrote:
> > umm I was curious to know why the code find sversion=3D0x0 while
> > hp_hardware_list awaiting 0x4 (as for all other CPUs)?
> > (a firmware pb, another pdc location or awaited 0x4 is wrong in my ca=
se
> > (I can only test one N) and another entry should be added with sversi=
on=3D0x0?)
> 
> I suggest just adding another entry to hp_hardware_list[].
> It's either a bug in either the PDC implementation or the IO ACD
> (Arch Control Doc) we took the initial table from. I'm much more
> inclined to believe we transposed/updated the table incorrectly.
> 
Something like:
--- arch/parisc/kernel/hardware.c.ORIG	2004-06-07 08:18:42.000000000 +020=
0
+++ arch/parisc/kernel/hardware.c	2004-07-23 08:43:59.000000000 +0200
@@ -209,6 +209,7 @@
 	{HPHW_NPROC,0x5D0,0x4,0x81,"Kazoo W+"},
 	{HPHW_NPROC,0x5D1,0x4,0x91,"Forte W+ 2w"},
 	{HPHW_NPROC,0x5D2,0x4,0x91,"Forte W+ 4w"},
+	{HPHW_NPROC,0x5D3,0x0,0x91,"Prelude W+ 540"},
 	{HPHW_NPROC,0x5D3,0x4,0x91,"Prelude W+ 540"},
 	{HPHW_NPROC,0x5D4,0x4,0x91,"Duet W+"},
 	{HPHW_NPROC,0x5D5,0x4,0x91,"Crescendo 550"},
=3D=3D=3D=3D=3D=3D><=3D=3D=3D=3D=3D=3D

do:
[...]
17. Elroy PCI Bridge at 0xfffffffffecf8000 [1/12] { 13, 0x0, 0x782, 0x000=
0a
}
18. DEW BC Runway Port at 0xfffffffffed24000 [36] { 7, 0x0, 0x584, 0x0000=
c
}
19. Prelude W+ 540 at 0xfffffffffed25000 [37] { 0, 0x0, 0x5d3, 0x00000 }
20. DEW BC Runway Port at 0xfffffffffed2c000 [44] { 7, 0x0, 0x584, 0x0000=
c
}
21. Prelude W+ 540 at 0xfffffffffed2d000 [45] { 0, 0x0, 0x5d3, 0x00000 }
CONFIG_SMP=3Dn  ignoring additional CPUs
CPU: probe of parisc45 failed with error 1
CPU(s): 1 x PA8600 (PCX-W+) at 550.000000 MHz
SBA found Ike rev 2 at 0xfffffffffed00000
[...]

Is anybody else has such model to test it?

hth,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
