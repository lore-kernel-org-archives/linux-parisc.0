Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hal.pp.fishpool.fi (hal.pp.fishpool.fi [195.197.229.212])
	by dsl2.external.hp.com (Postfix) with ESMTP id 68C294829
	for <parisc-linux@parisc-linux.org>; Fri, 11 Oct 2002 06:22:26 -0600 (MDT)
Date: Fri, 11 Oct 2002 15:22:14 +0300 (EEST)
From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>
To: Thibaut VARENE <varenet@esiee.fr>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] hardware features of 712-60 ?
In-Reply-To: <20021011132811.6e84c1d8.varenet@esiee.fr>
Message-ID: <Pine.LNX.4.21.0210111454200.24681-100000@hal.pp.fishpool.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
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

On Fri, 11 Oct 2002, Thibaut VARENE wrote:

> > http://hwdb.parisc-linux.org/view.php3?type=3Dmachine&name=3D712%2F60
> >=20
> > That page could have been written in Chinese, it would have been equall=
y clear. =20
>
> Did you notice that each chip is labelled with its driver name ?
> See, the text between '()' at the end of each line ?
> I wonder if we should make it bold, or maybe flashing ? :o)

Right, let's run through this list and see if it's as clear as you think:

1) Gecko (712/60) (Processor) (PA7100LC (PCX-L))
2) Gecko (Memory)
3) Gecko Optional RS-232 (Foreign I/O Module) (Serial driver)
4) Gecko Optional Lan (802.3) (Foreign I/O Module) (Lasi_82596 driver)
5) Gecko Core PC Keyboard (Foreign I/O Module) (PS/2 driver)
6) Gecko Core PC Floppy (Foreign I/O Module)
7) Gecko Audio (Foreign I/O Module) (Harmony driver)
8) Gecko Core Centronics (Foreign I/O Module) (Parallel driver)
9) Gecko Core RS-232 (Foreign I/O Module) (Serial driver)
a) Gecko Core Lan (802.3) (Foreign I/O Module) (Lasi_82596 driver)
b) Gecko Core SCSI (Foreign I/O Module) (NCR53c710 driver)
c) Gecko GSC Core Graphics (Foreign I/O Module)
d) Gecko Optional BA (Bus Adapter) (Lasi driver)
e) Gecko Core BA (Bus Adapter) (Lasi driver)=20

1) CPU:  PA7100LC.  clear enough.
2) Memory:  which module?  In which dialogue?
3) Optional RS-232:  which module?  In which dialogue?
4) Optional LAN:  Lasi_Ethernet?  Anything else?
5) Keyboard:  Lasi/Dino PS2 port?  Anything else, besides PS2 mouse?
6) Floppy:  which module?  PC Floppy definitely doesn't work.
7) Sound:  Harmony.  clear enough.
8) Parallel:  which modules?  LASI/ASP builtin, or PC-style hardware too?
9) Core RS-232:  which module?  generic 8250/16550?
a) Core LAN:  Lasi_Ethernet?  Anything else?
b) SCSI:  HP LASI SCSI support for 53c700/710, or NCR53c7,8xx SCSI support =
too?
c) Graphics:  which module?  Generic STI frame buffer?
d) Optional BA:  which module?  In which dialogue?
e) Core BA:  which module?  In which dialogue?

> A last point, subscribing to this mailing-list would be a good idea, or a=
t
> least taking a look at archives. You would have then noticed that the las=
t
> version of the PA-RISC/Linux Boot HOWTO has been released about 4 days ag=
o,

Last online version on parisc-linux is dated from 2002-07-15.

--=20
Martin-=C9ric Racine, Espoo, Finland.
"Kas sa tahad mind? - Nej!!! =C4r du en idiot?!!"
http://www.pp.fishpool.fi/~q-funk/
