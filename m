From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: Re: Bug#539378: [hppa]: fails to load nfs module: Global Offset Table
Date: Fri, 31 Jul 2009 21:49:50 -0400
Message-ID: <119aab440907311849q597135a4t929a13d093021942@mail.gmail.com>
References: <119aab440907311413s2e5ef1ebl690fff1bc4f0daea@mail.gmail.com>
	 <20090731212634.737DB4CFD@hiauly1.hia.nrc.ca>
	 <119aab440907311500v14b192e7t8a244d9d3b2c482e@mail.gmail.com>
	 <20090731233828.GF26333@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>, deller@gmx.de,
	elendil@planet.nl, 539378@bugs.debian.org,
	debian-hppa@lists.debian.org, linux-parisc@vger.kernel.org,
	randolph@tausq.org, submit@bugs.debian.org
To: Kyle McMartin <kyle@mcmartin.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20090731233828.GF26333@bombadil.infradead.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Fri, Jul 31, 2009 at 7:38 PM, Kyle McMartin<kyle@mcmartin.ca> wrote:
> Is it as simple as:
>
> diff --git a/arch/parisc/kernel/module.c b/arch/parisc/kernel/module.=
c
> index ef5caf2..0502fab 100644
> --- a/arch/parisc/kernel/module.c
> +++ b/arch/parisc/kernel/module.c
> @@ -82,13 +82,6 @@
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -ENOEXEC; =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0}
>
> -/* Maximum number of GOT entries. We use a long displacement ldd fro=
m
> - * the bottom of the table, which has a maximum signed displacement =
of
> - * 0x3fff; however, since we're only going forward, this becomes
> - * 0x1fff, and thus, since each GOT entry is 8 bytes long we can hav=
e
> - * at most 1023 entries */
> -#define MAX_GOTS =A0 =A0 =A0 1023
> -
> =A0/* three functions to determine where in the module core
> =A0* or init pieces the location is */
> =A0static inline int in_init(struct module *me, void *loc)
> @@ -126,6 +119,14 @@ struct stub_entry {
> =A0};
> =A0#endif
>
> +/* Maximum number of GOT entries. We use a long displacement ldd fro=
m
> + * the bottom of the table, which has 16-bit signed displacement fro=
m
> + * %dp. Because we only use the forward direction, we're limited to
> + * 15-bits - 1, and because each GOT entry is 8-bytes wide, we're li=
mited
> + * to 4095 entries.
> + */
> +#define MAX_GOTS =A0 =A0 =A0 (((1 << 15) - 1) / sizeof(struct got_en=
try))
> +

OK

> =A0/* Field selection types defined by hppa */
> =A0#define rnd(x) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (((x)+0x1000)&~0x1f=
ff)
> =A0/* fsel: full 32 bits */
> @@ -151,6 +152,15 @@ static inline int reassemble_14(int as14)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0((as14 & 0x2000) >> 13));
> =A0}
>
> +/* Unusual 16-bit encoding, for wide mode only. =A0*/
> +static inline int reassemble_16a(int as16)
> +{
> + =A0 =A0 =A0 int s, t;
> + =A0 =A0 =A0 t =3D (as16 << 1) & 0xffff;
> + =A0 =A0 =A0 s =3D (as16 & 0x8000);
> + =A0 =A0 =A0 return (t ^ s ^ (s >> 1)) | (s >> 15);
> +}
> +

OK

> =A0static inline int reassemble_17(int as17)
> =A0{
> =A0 =A0 =A0 =A0return (((as17 & 0x10000) >> 16) |
> @@ -460,12 +470,16 @@ static Elf_Addr get_stub(struct module *me, uns=
igned long value, long addend,
> =A0*/
> =A0 =A0 =A0 =A0switch (stub_type) {
> =A0 =A0 =A0 =A0case ELF_STUB_GOT:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 unsigned int d =3D get_got(me, value, a=
ddend) & 0x7fff;
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stub->insns[0] =3D 0x537b0000; =A0 =A0=
/* ldd 0(%dp),%dp =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stub->insns[1] =3D 0x53610020; =A0 =A0=
/* ldd 10(%dp),%r1 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stub->insns[2] =3D 0xe820d000; =A0 =A0=
/* bve (%r1) =A0 =A0 =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stub->insns[3] =3D 0x537b0030; =A0 =A0=
/* ldd 18(%dp),%dp =A0 =A0 =A0*/
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[0] |=3D reassemble_14(get_g=
ot(me, value, addend) & 0x3fff);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (d > 15)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 stub->insns[0] |=3D rea=
ssemble_16a(d);
> +

You need to rewrite stub->insn[0[, the long format 3 ldd is a
different opcode, see the PA 2.0 manual, it will no longer be
0x537b0000.

You also still need a <=3D 15 byte case which uses the old short format
5 ldd with a 14-bit immediate.

> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0case ELF_STUB_MILLI:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0stub->insns[0] =3D 0x20200000; =A0 =A0=
/* ldil 0,%r1 =A0 =A0 =A0 =A0 =A0 */
>
> I don't think we need to worry about the initial 15-bytes displacemen=
t,
> since they're all within the first got_entry? (The resulting assembly
> looks alright from a 64-bit toolchain:

No, we still have to worry about the initial 15-bytes. Within the
first 15-bytes you have one GOT entry (%dp + 0) and thus you need to
add the case for the short format 3 ldd.

Thanks for hacking this up!

Cheers,
Carlos.
--
To unsubscribe from this list: send the line "unsubscribe linux-parisc"=
 in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
