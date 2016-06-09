From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH v4] parisc: add <asm/hash.h>
Date: Thu, 9 Jun 2016 21:53:59 +0200
Message-ID: <5759C957.5090607@gmx.de>
References: <20160607234506.32160.qmail@ns.sciencehorizons.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Cc: "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>
To: George Spelvin <linux@sciencehorizons.net>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20160607234506.32160.qmail@ns.sciencehorizons.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi George,

On 08.06.2016 01:45, George Spelvin wrote:
> PA-RISC is interesting; integer multiplies are implemented in the
> FPU, so are painful in the kernel.  But it tries to be friendly to
> shift-and-add sequences for constant multiplies.
>=20
> __hash_32 is implemented using the same shift-and-add sequence as
> Microblaze, just scheduled for the PA7100.  (It's 2-way superscalar
> but in-order, like the Pentium.)
>=20
> hash_64 was tricky, but a suggestion from Jason Thong allowed a
> good solution by breaking up the multiplier.  After a lot of manual
> optimization, I found a 19-instruction sequence for the multiply that
> can be executed in 10 cycles using only 4 temporaries.
>=20
> (The PA8xxx can issue 4 instructions per cycle, but 2 must be ALU ops
> and 2 must be loads/stores.  And the final add can't be paired.)
>=20
> An alternative considered, but ultimately not used, was Thomas Wang's
> 64-to-32-bit integer hash.  At 12 instructions, it's smaller, but the=
y're
> all sequentially dependent, so it has longer latency.
>=20
> https://web.archive.org/web/2011/http://www.concentric.net/~Ttwang/te=
ch/inthash.htm
> http://burtleburtle.net/bob/hash/integer.html
>=20
> Signed-off-by: George Spelvin <linux@sciencehorizons.net>
> Cc: Helge Deller <deller@gmx.de>
> Cc: linux-parisc@vger.kernel.org
> ---
> No functional change, just cleaned up a lot.  This is final if no pro=
blems
> are found.

Thanks, but two minor issues...

>  arch/parisc/Kconfig            |   1 +
>  arch/parisc/include/asm/hash.h | 146 +++++++++++++++++++++++++++++++=
++++++++++
>  2 files changed, 147 insertions(+)
>  create mode 100644 arch/parisc/include/asm/hash.h
>=20
> diff --git a/arch/parisc/Kconfig b/arch/parisc/Kconfig
> index 88cfaa8a..8ed2a444 100644
> --- a/arch/parisc/Kconfig
> +++ b/arch/parisc/Kconfig
> @@ -30,6 +30,7 @@ config PARISC
>  	select TTY # Needed for pdc_cons.c
>  	select HAVE_DEBUG_STACKOVERFLOW
>  	select HAVE_ARCH_AUDITSYSCALL
> +	select HAVE_ARCH_HASH
>  	select HAVE_ARCH_SECCOMP_FILTER
>  	select ARCH_NO_COHERENT_DMA_MMAP

Minor issue:
This line (ARCH_NO_COHERENT) is not yet in Linus' tree.
I assume you diff'ed against -next or something?
Maybe you move the "select HAVE_ARCH_HASH" one or two lines up, or
wait until the other patch went upstream?

> diff --git a/arch/parisc/include/asm/hash.h b/arch/parisc/include/asm=
/hash.h
> new file mode 100644
> index 00000000..fb992a3b
> --- /dev/null
> +++ b/arch/parisc/include/asm/hash.h
> @@ -0,0 +1,146 @@
> +#ifndef _ASM_HASH_H
> +#define _ASM_HASH_H
> +
> +/*
> + * HP-PA only implements integer multiply in the FPU.  However, for
> + * integer multiplies by constant, it has a number of shift-and-add
> + * (but no shift-and-subtract, sigh!) instructions that a compiler
> + * can synthesize a code sequence with.
> + *
> + * Unfortunately, GCC isn't very efficient at using them.  For examp=
le
> + * it uses three instructions for "x *=3D 21" when only two are need=
ed.
> + * But we can find a sequence manually.
> + */
> +
> +#define HAVE_ARCH__HASH_32 1
> +
> +/*
> + * This is a multiply by GOLDEN_RATIO_32 =3D 0x61C88647 optimized fo=
r the
> + * PA7100 pairing rules.  This is an in-order 2-way superscalar proc=
essor.
> + * Only one instruction in a pair may be a shift (by more than 3 bit=
s),
> + * but other than that, simple ALU ops (including shift-and-add by u=
p
> + * to 3 bits) may be paired arbitrarily.
> + *
> + * PA8xxx processors also dual-issue ALU instructions, although with
> + * fewer constraints, so this schedule is good for them, too.
> + *
> + * This 6-step sequence was found by Yevgen Voronenko's implementati=
on
> + * of the Hcub algorithm at http://spiral.ece.cmu.edu/mcm/gen.html.
> + */
> +static inline u32 __attribute_const__ __hash_32(u32 x)
> +{
> +	u32 a, b, c;
> +
> +	/*
> +	 * Phase 1: Compute  a =3D (x << 19) + x,
> +	 * b =3D (x << 9) + a, c =3D (x << 23) + b.
> +	 */
> +	a =3D x << 19;		/* Two shifts can't be paired */
> +	b =3D x << 9;	a +=3D x;
> +	c =3D x << 23;	b +=3D a;
> +			c +=3D b;
> +	/* Phase 2: Return (b<<11) + (c<<6) + (a<<3) - c */
> +	b <<=3D 11;
> +	a +=3D c << 3;	b -=3D c;
> +	return (a << 3) + b;
> +}
> +
> +#if BITS_PER_LONG =3D=3D 64
> +
> +#define HAVE_ARCH_HASH_64 1
> +
> +/*
> + * Finding a good shift-and-add chain for GOLDEN_RATIO_64 is tricky,
> + * because available software for the purpose chokes on constants th=
is
> + * large.  (It's mostly designed for compiling FIR filter coefficien=
ts
> + * into FPGAs.)
> + *
> + * However, Jason Thong pointed out a work-around.  The Hcub softwar=
e
> + * (http://spiral.ece.cmu.edu/mcm/gen.html) is designed for *multipl=
e*
> + * constant multiplication, and is good at finding shift-and-add cha=
ins
> + * which share common terms.
> + *
> + * Looking at 0x0x61C8864680B583EB in binary:
> + * 0110000111001000100001100100011010000000101101011000001111101011
> + *  \______________/    \__________/       \_______/     \________/
> + *   \____________________________/         \____________________/
> + * you can see the non-zero bits are divided into several well-separ=
ated
> + * blocks.  Hcub can find algorithms for those terms separately, whi=
ch
> + * can then be shifted and added together.
> + *
> + * Dividing the input into 2, 3 or 4 blocks, Hcub can find solutions
> + * with 10, 9 or 8 adds, respectively, making a total of 11 for the
> + * whole number.
> + *
> + * Using just two large blocks, 0xC3910C8D << 31 in the high bits,
> + * and 0xB583EB in the low bits, produces as good an algorithm as an=
y,
> + * and with one more small shift than alternatives.
> + *
> + * The high bits are a larger number and more work to compute, as we=
ll
> + * as needing one extra cycle to shift left 31 bits before the final
> + * addition, so they are the critical path for scheduling.  The low =
bits
> + * can fit into the scheduling slots left over.
> + */
> +
> +
> +/*
> + * This _ASSIGN(dst, src) macro performs "dst =3D src", but prevents=
 GCC
> + * from inferring anything about the value assigned to "dest".
> + *
> + * This prevents it from mis-optimizing certain sequences.
> + * In particular, gcc is annoyingly eager to combine consecutive shi=
fts.
> + * Given "x <<=3D 19; y +=3D x; z +=3D x << 1;", GCC will turn this =
into
> + * "y +=3D x << 19; z +=3D x << 20;" even though the latter sequence=
 needs
> + * an additional instruction and temporary register.
> + *
> + * Because no actual assembly code is generated, this construct is
> + * usefully portable across all GCC platforms, and so can be test-co=
mpiled
> + * on non-PA systems.
> + *
> + * In two places, additional unused input dependencies are added.  T=
his
> + * forces GCC's scheduling so it does not rearrange instructions too=
 much.
> + * Because the PA-8xxx is out of order, I'm not sure how much this m=
atters,
> + * but why make it more difficult for the processor than necessary?
> + */
> +#define _ASSIGN(dst, src, ...) asm("" : "=3Dr" (dst) : "0" (src), ##=
__VA_ARGS__)
> +
> +/*
> + * Multiply by GOLDEN_RATIO_64 =3D 0x0x61C8864680B583EB using a heav=
ily
> + * optimized shift-and-add sequence.
> + *
> + * Without the final shift, the multiply proper is 19 instructions,
> + * 10 cycles and uses only 4 temporaries.  Whew!
> + *
> + * You are not expected to understand this.
> + */
> +static __always_inline u32 __attribute_const__
> +hash_64(u64 a, unsigned int bits)
> +{
> +	u64 b, c, d;
> +
> +	/*
> +	 * Encourage GCC to move a dynamic shift to %sar early,
> +	 * thereby freeing up an additional temporary register.
> +	 */
> +	if (!__builtin_constant_p(bits))
> +		asm("" : "=3Dq" (bits) : "0" (64 - bits));
> +	else
> +		bits =3D 64 - bits;
> +
> +	_ASSIGN(b, a*5);	c =3D a << 13;
> +	b =3D (b << 2) + a;	_ASSIGN(d, a << 17);
> +	a =3D b + (a << 1);	c +=3D d;
> +	d =3D a << 10;		_ASSIGN(a, a << 19);
> +	d =3D a - d;		_ASSIGN(a, a << 4, "X" (d));
> +	c +=3D b;			a +=3D b;
> +	d -=3D c;			c +=3D a << 1;
> +	a +=3D c << 3;		_ASSIGN(b, b << 7+31, "X" (c), "X" (d));

This line produces compiler warnings:
arch/parisc/include/asm/hash.h: In function =91hash_64=92:
arch/parisc/include/asm/hash.h:137:29: warning: suggest parentheses aro=
und =91+=92 inside =91<<=92 [-Wparentheses]
  a +=3D c << 3;  _ASSIGN(b, b << 7+31, "X" (c), "X" (d));
                             ^

You should add () around 7+31.

With those changes I sucessfully tested it on a 64bit parisc kernel.

So, please add
Acked-by: Helge Deller <deller@gmx.de>


THANKS!
Helge


> +	a <<=3D 31;		b +=3D d;
> +	a +=3D b;
> +	return a >> bits;
> +}
> +#undef _ASSIGN	/* We're a widely-used header file, so don't litter! =
*/
> +
> +#endif /* BITS_PER_LONG =3D=3D 64 */
> +
> +#endif /* _ASM_HASH_H */
>=20

--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
