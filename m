From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] PRINTK_TIME make panicing very early b2k?
Date: Mon, 27 Jun 2005 18:07:22 +0200
Message-ID: <42BAE856000010F9@mail-6-bnl.tiscali.it>
References: <20050627150107.GG5200@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: Parisc List <parisc-linux@lists.parisc-linux.org>
To: "Matthew Wilcox" <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050627150107.GG5200@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> 
> On Mon, Jun 27, 2005 at 04:30:21PM +0200, Joel Soete wrote:
> > Hello all,
> > 
> > I hope to get help from CONFIG_PRINTK_TIME to debug my d380 64bit slo=
wness
> > pb but tested first on a b2k it panics (waht siad lcd display at leat=
)
> very
> > early in the boot and unfortunately pim lakes of relievant info:
> 
> I'm not sure why you say it lacks relevant info.
Just because I again missed gr2 info (my bad) sorry

>  Seems pretty clear to me:
> 
> > IIA Space                    =3D 0x0000000000000000
> > IIA Offset                   =3D 0x0000000000000000
> 
> ... a null pointer dereference, in kernel space.
> 
> > General Registers 0 - 31
> > 00-03   0000000000000000  0000000000000000  000000001012799c  0000000=
000800327
> 
> called from 1012799c.  Where's that in your System.map?
>
mmm
 GR[02] =3D=3D rp =3D 000000001012799c

Func: vprintk, Off: 0xcc, Addr: 0x1012799c

10127990 <vprintk+0xc0>:
10127990:       37 84 00 60     ldo 30(ret0),r4
10127994:       eb ef a1 c5     b,l 10106a7c <sched_clock>,%r2
10127998:       08 00 02 40     nop
1012799c:       6b dc 3e 91     stw ret0,-b8(,sp)
101279a0:       6b dd 3e 99     stw ret1,-b4(,sp)
101279a4:       08 1c 02 55     copy ret0,r21
101279a8:       08 1d 02 56     copy ret1,r22
101279ac:       08 1c 02 5d     copy ret0,ret1
101279b0:       34 1c 00 00     ldi 0,ret0
101279b4:       0b bc 02 7c     or ret0,ret1,ret0
101279b8:       8f 80 25 48     cmpib,<> 0,ret0,10127c64 <vprintk+0x394>

and afaik:

GR[28] =3D=3D ret0 =3D 00000000fffb6c20

GR[30] =3D=3D sp =3D 0000000020000080

A bit (no largely) out of my understanding.

Joel


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
