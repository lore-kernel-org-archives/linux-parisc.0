From: "Jim Hull" <jim.hull@hp.com>
Subject: RE: [parisc-linux] PA8800/ZX1 support committed to 2.6.7-rc2-pa2
Date: Fri, 11 Jun 2004 17:38:24 -0700
Message-ID: <008a01c45015$9205b780$f463f40f@jh733133>
References: <20040611055819.GA32005@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="US-ASCII"
Cc: 'PARISC list' <parisc-linux@lists.parisc-linux.org>
To: "'Grant Grundler'" <grundler@parisc-linux.org>,
 "'James Bottomley'" <James.Bottomley@steeleye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-reply-to: <20040611055819.GA32005@colo.lackof.org>
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

> Well, I talked to another HP engineer who deals with this stuff
> more than I do and came away with some observations:
>=20
> 1) values returned from the PDC_CACHE_INFO call (stride, block, loop)
>    are supposed to be "universal" - ie apply to all levels of cache.
>    The values are intended to work in the "architected cache=20
> flush loop".
>    Does that only apply for the FDCE loop?
>    What about FDC/FIC loops?

PDC_CACHE returns parameters for both the architected FDCE loop and the
architected FICE loop.  They are D_base, D_count, D_loop, and D_stride =
for the
FDCE loop and I_base, I_count, I_loop, and I_stride for the FICE loop.

The PDC_CACHE description also contains a Programming Note which explain =
how you
might use the values in the various bit-fields from two other returned
parameters (D_conf and I_conf) to flush a range of addresses using FDC =
or FIC.
Technically, these aren't "architected loops", they're just a =
suggestion.

> 2) values from the C8000 prototype could be wrong. Output and diff
>    are appended below. Basically it's telling me to traverse
>    the entire 32MB cache with 128 byte stride.

I checked the Mako ERS; it clearly describes what parameters PDC must =
return in
order for the flush loops to work.  The values you show match those in =
the ERS.

> 3) I'm not sure if loop=3D1 indicates 2-way associative or=20
> direct mapped.
>    I expect direct mapped.  I need to re-read the docs.
>    Maybe someone knows? jsm?

You should not think about the FDCE/FICE parameters as corresponding to =
any
particular property of the given cache.  They are simply abstract values =
to plug
into the architected flush loops in order to make them flush the whole =
cache.
For example, since the Mako caches are all 4-way associative, you might =
think
that the "loop" parameter(s) would be 4.  However, because of the design =
of the
Mako FDCE and FICE instructions, executing with "loop" equal 4, and with =
"count"
equal to 1/4 of its current value, would (sometimes) fail to flush the =
whole
cache.

> Console output from debug info I enabled/added:
> | model 9000/785/C8000
> | ic_size 2000000 dc_size 2000000 it_size f0
> | DC  base 0x0 stride 0x80 count 0x40000 loop 0x1
> | dc_conf =3D 0x1882000  alias 0 blk 1 line 4 shift 1
> |         wt 0 sh 0 cst 1 assoc 0
> | IC  base 0x0 stride 0x80 count 0x40000 loop 0x1
> | ic_conf =3D 0x1882000  alias 0 blk 1 line 4 shift 1
> |         wt 0 sh 0 cst 1 assoc 0
> | D-TLB conf: sh 3 page 1 cst 1 aid 0 pad1 0
> | I-TLB conf: sh 3 page 1 cst 1 aid 3 pad1 0
> | dcache_stride 128   icache_stride 128
> | parisc_cache_init: Only equivalent aliasing supported!
>=20
>=20
> The difference between D-TLB and I-TLB was interesting but
> I don't know what to make of it.
>=20
> I noticed HPUX was calculating the stride differently than
> parisc-linux. I didn't realize until later the difference
> could be due to older/newer firmware versions and/or differences
> in the "architected loop" initialization.

For FDC/FIC loops, the architecture was changed to handle machines with =
line
sizes larger than 64 bytes (like Mako, where it's 128).  The correct =
equation,
which will work on both new and old machines, is:

  stride =3D (1 << (block - 1)) * ((line * 16) << shift)

> Changing "4 + cnf.cc_shift" (stride=3D128) to "3 + cnf.cc_shift"
> (stride=3D64) didn't help. This implies the stride is not the problem.

If the "4 + cnf.cc_shift" is trying to compute a stride, then this may =
be the
source of the problem.  Try changing it as above.

 -- Jim

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
