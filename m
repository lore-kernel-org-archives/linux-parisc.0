From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>
Subject: [parisc-linux] 712-60 XFree86 mouse driver problems
Date: Sun, 9 Jun 2002 11:57:24 +0300 (EEST)
Message-ID: <Pine.LNX.4.21.0206091151160.26092-100000__47554.0763968185$1416621382$gmane$org@hal.pp.fishpool.fi>
References: <Pine.LNX.4.44.0206051039560.1815-100000@sal.ucc.ie>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <Pine.LNX.4.44.0206051039560.1815-100000@sal.ucc.ie>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Wed, 5 Jun 2002, M. Grabert wrote:

> On Tue, 4 Jun 2002, B. Douglas Hilton wrote:
>=20
> > Install Notes: "gpm" doesn't seem to work for me, although I
> > am running a Dexxa Optical Wheel Mouse through a KVM switch.
> > I just set X to "PS/2" and it worked ( but no mouse wheel ).
>=20
> Try ImPS/2 or ExplorerPS/2 instead and add a line
>=20
> Option "ZAxisMapping" "4 5"
>=20
> in the InputDevice Section

On my 712-60, I've had to call my mouse "ps2fu" in gpm.conf but enabling th=
e
same repeater didn't get X to use it.  Anyhow, the problem with fups2 is th=
at
every time I exit Gnome and X is restarted by gdm, the mouse in X no longer
works so I have to ctrl-alt-back kill X to reinitialize the mouse again.

Meanwhile, that same fups2 driver seems to work as expected on consoles and
never caused me any problem.

--=20
Martin-=C9ric Racine, Helsinki, Finland.
http://www.pp.fishpool.fi/~q-funk/
+358 41 474 0289
