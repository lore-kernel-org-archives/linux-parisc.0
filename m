From: "Jim Hull" <jim.hull@hp.com>
Subject: RE: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Mon, 14 Jun 2004 15:45:32 -0700
Message-ID: <00d101c45261$4cc23d80$f463f40f@jh733133>
References: <20040614182903.GA15866@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="US-ASCII"
Cc: 'James Bottomley' <James.Bottomley@steeleye.com>,
 'PARISC list' <parisc-linux@lists.parisc-linux.org>
To: "'Grant Grundler'" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20040614182903.GA15866@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Grant:

> Ouch. Does that mean FDCE and FICE modify the L2 cache also?
> Do FDC/FIC also affect the L2?

The PA processor architecture requires that all of these flush =
instructions
flush every level of the processor cache hierarchy all the way out to =
memory.
In other words, yes.=20

> Someone was asserting it was not necessary to flush the L2=20
> since the L2 is
> a PIPT cache and would always be coherent. I don't really know but
> that makes sense to me.

You could imagine an architecture having several variants of the cache =
flushing
instructions that software could call depending on why it needed to =
flush; for
example, to achieve I-cache/D-cache coherence, to resolve virtual =
aliasing, to
communicate with non-coherent I/O devices, or to flush out to a =
battery-backed
RAM in case of powerfail.

I think pa-linux wants the second of these.  Unfortunately, PA only has =
a single
variant, and it was designed for the third and fourth cases.

> ...
> > > I noticed HPUX was calculating the stride differently than
> > > parisc-linux. I didn't realize until later the difference
> > > could be due to older/newer firmware versions and/or differences
> > > in the "architected loop" initialization.
> >=20
> > For FDC/FIC loops, the architecture was changed to handle=20
> machines with line
> > sizes larger than 64 bytes (like Mako, where it's 128). =20
> The correct equation,
> > which will work on both new and old machines, is:
> >=20
> >   stride =3D (1 << (block - 1)) * ((line * 16) << shift)
>=20
> The above results in stride=3D128 on C8000 as well (output=20
> appended below).
> I now have three variants to calculate stride:
>=20
> #define CAFL_STRIDE(cnf) ((1 << (cnf.cc_block + 3)) * cnf.cc_line)
> #define CAFL_STRIDE(cnf) (cnf.cc_block * (cnf.cc_line << (4 +=20
> cnf.cc_shift)))
> #define CAFL_STRIDE(cnf) ((1 << (cnf.cc_block-1)) *=20
> (cnf.cc_line << (4 + cnf.cc_shift)))
>=20
> 1) original parisc-linux

This one doesn't include the new "shift" field, so it's clearly =
out-of-date.

> 2) "borrowed" from HPUX (i80_latest, maybe HPUX wants to use
>    Jim Hull's suggestion as well?)

This one is almost correct.  If "block" is 1 or 2, it gets the right =
answer -
it's only wrong for "block" values of 3 or more.  I suspect that HPUX =
appears to
work only because no PDC has ever returned anything other than 1 for =
"block".

> 3) "New and Improved" :^)

And correct!  If you'd like a more optimized version, this is =
equivalent:

#define CAFL_STRIDE(cnf) (cnf.cc_line << (3 + cnf.cc_block + =
cnf.cc_shift))

> Jim, do you know if Space Id hashing is disabled the same way
> on PA8800 as for PA8500/8600/8700 CPUs?
>=20
> Or maybe it's easier to verify in the Make ERSthe following=20
> is correct:
> (See arch/parisc/kernel/pacache.S)
> srdis_pa20:
>=20
> 	/* Disable Space Register Hashing for PCXU,PCXU+,PCXW,PCXW+ */
>=20
> 	.word           0x144008bc  /* mfdiag %dr2,%r28 */
> 	depdi           0,54,1,%r28 /* clear DIAG_SPHASH_ENAB=20
> (bit 54) */
> 	.word           0x145c1840  /* mtdiag %r28,%dr2 */

Yes, the Mako ERS says that DIAG_SPHASH_ENAB is still bit 54 in diag =
register 2.

 -- Jim

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
