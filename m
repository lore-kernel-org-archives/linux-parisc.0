From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] BUG 2.6.11-rc4-pa1 XFS data page fault
Date: Fri, 18 Feb 2005 18:35:31 +0100
Message-ID: <420B30A200003973@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: "Michael S.Zick" <mszick@wolfbutter.com>,
 parisc-linux@lists.parisc-linux.org
To: "Thibaut VARENE" <varenet@esiee.fr>,
 "Grant Grundler" <grundler@parisc-linux.org>
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

...
>
> Come to think of it, I wonder how the XFS bug you're pointing at can
> be related to the bug Joel and I reported with ext3:
> http://lists.parisc-linux.org/pipermail/parisc-linux/2005-February/025
> 867.html
>
> Maybe one would like to try XFS on a non-SYM2 box and see what
> happens? That way we might have a clue whether sym2's at fault or
> something else...
>
In fact because I have not other choise (the only spare disk I found is a=

small narrow se 4Gb hp disk which I cab connect to my b180 unstable debia=
n
install), I used the zalon ncr53c710 of my b180 and just build a 2Gb xfs
on a slice of the disk with defaults:
# mkfs -t xfs /dev/sdd1
meta-data=3D/dev/sdd1              isize=3D256    agcount=3D8, agsize=3D6=
4034 blks
         =3D                       sectsz=3D512
data     =3D                       bsize=3D4096   blocks=3D512272, imaxpc=
t=3D25
         =3D                       sunit=3D0      swidth=3D0 blks, unwrit=
ten=3D1
naming   =3Dversion 2              bsize=3D4096
log      =3Dinternal log           bsize=3D4096   blocks=3D2560, version=3D=
1
         =3D                       sectsz=3D512   sunit=3D0 blks
realtime =3Dnone                   extsz=3D65536  blocks=3D0, rtextents=3D=
0

then cvs -z3 co -A linux-2.6 without any pb ;-)

I am convince that doesn't help a lot: that makes 3 big diff with Grant t=
est:
    - 32bit kernel,
    - up system (curious to see results in up too on the grant's a500: ju=
st
deconfigure a cpu, is it possible on a500?)
    - different driver (ncr53c710 in place of sym_2)

The running kernel was 2.6.11-rc4-pa1 (cvs dated 20050217) 32bit without
any other patch, no devfs support builtin (nor module).

Hth anyway,
    Joel

PS: I still have a chroot disk on this system but fw one connected to the=

symbios crtlr using sym-2.1.18n, it was dedicated to carlos libc test but=

trust I could safely convert some extra ext3 fs to xfs (I mean bakup/rest=
ore
:) ... on Monday :-(



_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
