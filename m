Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.web.de (smtp02.web.de [217.72.192.151])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5E991482C
	for <parisc-linux@parisc-linux.org>; Sun,  9 Jun 2002 07:55:22 -0600 (MDT)
Message-ID: <3D035E00.7FBAF703@web.de>
Date: Sun, 09 Jun 2002 15:54:08 +0200
From: "b.gunreben" <b.gunreben@web.de>
MIME-Version: 1.0
To: =?iso-8859-1?Q?Martin=2D=C9ric?= Racine <q-funk@pp.fishpool.fi>
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 712-60 XFree86 mouse driver problems
References: <Pine.LNX.4.21.0206091151160.26092-100000@hal.pp.fishpool.fi>
Content-Type: text/plain; charset=iso-8859-1
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

Martin-=C9ric Racine wrote: =

> On my 712-60, I've had to call my mouse "ps2fu" in gpm.conf but enablin=
g the
> same repeater didn't get X to use it.  Anyhow, the problem with fups2 i=
s that
> every time I exit Gnome and X is restarted by gdm, the mouse in X no lo=
nger
> works so I have to ctrl-alt-back kill X to reinitialize the mouse again=
=2E

There may be problems, if you run gpm while running X. You can try to swi=
tch of
gpm when running X. =


Another possibility is to use the gpm repeater for X as well. =

Try to change your X11 mouse configuration to the following one, and make=
 sure
gpm runs while using X.

Section "Pointer"
  Protocol              "MouseSystems"
  Device                "/dev/gpmdata"
  SampleRate            60
  BaudRate              1200
EndSection


Berthold
