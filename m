Return-Path: <q-funk@pp.fishpool.fi>
Received: from hal.pp.fishpool.fi (seven.fishpool.fi [195.197.229.220])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2004948F9
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  9 Mar 2004 05:30:23 -0700 (MST)
Date: Tue, 9 Mar 2004 14:30:19 +0200 (EET)
From: =?iso-8859-1?Q?Martin-=C9ric_Racine?= <q-funk@pp.fishpool.fi>
To: Helge Deller <deller@gmx.de>
In-Reply-To: <200403061226.50883.deller@gmx.de>
Message-ID: <Pine.LNX.4.21.0403091426380.28934-100000@hal.pp.fishpool.fi>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: [parisc-linux] Re: broken keyboard driver on 2.6.3
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, 6 Mar 2004, Helge Deller wrote:

> On Friday 05 March 2004 10:58, Martin-=C9ric Racine wrote:
> > One thing I noticed today, when using the 712 from the keyboard (which =
I almost
> > never do), is that the cursor arrows near the keypad are broken:
> >=20
> > In menuconfig, pressing any arrow kills the script with an abort messag=
e; in
> > Nano, the keys are completely ignored.  However, 2.4.24-pa0 works as ex=
pected.

I wanted to point out that this only seems to affect ncurse-based software.=
 For
instance, using Up/Down to cycle Bash commandline history still works.

> What does "showkey -s" reports if you press those keys ?

I pressed PageUp, PageDown, Up, Down, Left, Right and got:

press any key (program terminates after 10s of last keypress)...
0xe0 0x2a 0xe0 0x37 0xe0 0x49 0xe0 0xc9 0xe0 0xaa 0xe0 0xb7
0xe0 0x2a 0xe0 0x37 0xe0 0x51 0xe0 0xd1 0xe0 0xaa 0xe0 0xb7
0xe0 0x2a 0xe0 0x37 0xe0 0x48 0xe0 0xc8 0xe0 0xaa 0xe0 0xb7
0xe0 0x2a 0xe0 0x37 0xe0 0x50 0xe0 0xd0 0xe0 0xaa 0xe0 0xb7
0xe0 0x2a 0xe0 0x37 0xe0 0x4b 0xe0 0xcb 0xe0 0xaa 0xe0 0xb7
0xe0 0x2a 0xe0 0x37 0xe0 0x4d 0xe0 0xcd 0xe0 0xaa 0xe0 0xb7
<q-funk@zarya:/home/q-funk>$

> Could you mail me privately your bootlog ?

Done.

--=20
Martin-=C9ric Racine, ICT Consultant
http://www.pp.fishpool.fi/~q-funk/
