Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mailgate5.cinetic.de (mailgate5.cinetic.de [217.72.192.165])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3DC94829
	for <parisc-linux@parisc-linux.org>; Tue, 15 Apr 2003 07:07:07 -0600 (MDT)
Received: from web.de (fmomail02.dlan.cinetic.de [172.20.1.46])
	by mailgate5.cinetic.de (8.11.6p2/8.11.2/SuSE Linux 8.11.0-0.4) with SMTP id h3FD70q05547
	for parisc-linux@parisc-linux.org; Tue, 15 Apr 2003 15:07:00 +0200
Date: Tue, 15 Apr 2003 15:07:00 +0200
Message-Id: <200304151307.h3FD70q05547@mailgate5.cinetic.de>
MIME-Version: 1.0
From: <b.gunreben@web.de>
To: parisc-linux@parisc-linux.org
Content-Type: text/plain; charset="iso-8859-1"
Subject: [parisc-linux] another profile (2.5.67-pa3)
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

Hi,      =20
      =20
I just did a profile of a gcc33 compiled 2.5.67-pa3. I sometimes had the i=
mpression,     =20
that especially shell scripts run very slow on parisc. What I did, was bui=
lding a howto     =20
package, where several keywords are searched with grep -v in all howtos. =20
     =20
user  :       0:01:11.25   0.4%  page in :        0     =20
nice  :       1:24:24.96  25.0%  page out:        0     =20
system:       4:02:17.73  71.8%  swap in :        0     =20
idle  :       0:09:00.58   2.7%  swap out:        0     =20
uptime:       5:37:28.50         context :  3593391     =20
     =20
procinfo also shows another problem with page counts, but more interesting=
 is, that the     =20
system (from a freshly booted system) needed lots of system time to build =
that package,     =20
and not so much nice time. The total build time was   =20
   =20
built howto in 17650 s   =20
compared to   =20
built howto in 23414 s  =20
with kernel 2.4.19  =20
 =20
The Kernel command line: profile=3D2 root=3D/dev/sda3 HOME=3D/ console=3DttyS0 TER=
M=3Dvt102 =20
Here is the profile:     =20
# readprofile -m /boot/System.map-2.5.67 | sort -nr -k3 | head -20        =
                    =20
478488 fisync                                   39874.0000     =20
358656 fdsync                                   17932.8000     =20
120353 fioneloop                                15044.1250     =20
 73159 flush=5Fuser=5Fdcache=5Frange=5Fasm              2032.1944     =20
 61150 flush=5Fuser=5Ficache=5Frange=5Fasm              1698.6111     =20
 57005 cpu=5Fidle                                 950.0833     =20
  7926 $lcfu=5Fdone                               660.5000     =20
  9494 $lctu=5Fdone                               593.3750     =20
  6359 $lctu=5Floop                               529.9167     =20
 38952 fprob                                    512.5263     =20
  2584 $lcfu=5Floop                               215.3333     =20
 31317 copy=5Fuser=5Fpage=5Fasm                       206.0329     =20
 18180 flush=5Fkernel=5Fdcache=5Fpage                 181.8000     =20
  9414 flush=5Fkernel=5Ficache=5Fpage                  94.1400     =20
   725 $lslen=5Fdone                               90.6250     =20
  1119 $lclu=5Fdone                                69.9375     =20
 24429 page=5Fremove=5Frmap                          57.0771     =20
   608 $lslen=5Floop                               50.6667     =20
  2091 memcpy                                    47.5227     =20
 19734 zap=5Fpte=5Frange                             37.6603     =20
     =20
The machine I used is a C240 with 1.5GiB Memory.=20
=20
Berthold=20
=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=5F=
=5F=5F=5F=5F
UNICEF bittet um Spenden f=FCr die Kinder im Irak! Hier online an
UNICEF spenden: https://spenden.web.de/unicef/special/=3Fmc=3D021101
