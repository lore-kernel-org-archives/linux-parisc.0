From: "Joel Soete" <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: Next step in glibc test math failures analysis ;
	-)
Date: Mon, 15 May 2006 12:16:51 +0200
Message-ID: <IZAXW3$C59C39E7DB13AB37BBE79C55CE7BDBBF@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: dave <dave@hiauly1.hia.nrc.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "carlos" <carlos@systemhalted.org>
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

> > So my next question is: is some of you know a similar implementation =
of
cacosf()?
> > or what would be the results of cacosf() for various limit figure wit=
h
nan, 0.0 and infinity?
> 
> Is the problem the setting of the V-bit by the operation?
> 
yes as explain during the computation of:
    __real__ res =3D (float) M_PI_2 - __real__ y;


> The value of  "cacos (inf + NaN i)" is  "NaN + inf i", the problem is
> that after the test the processor has turned on the V bit to indicate
> that the operation is invalid.
> 
That's my understanding too, tx.

> In 10-9 of the PA 2.0 book there is a complete description of what
> should and should
> not trigger an "invalid" exception.
> 
> Do we have a case of:
> 1. Any arithmetic operation on a signaling NaN except for conversion
> to integer formats.
> 2. Magnitude subtraction of intinities like (+inf + -inf)
> 3. Multiplication of 0 and inf
> 4. The division operations 0/0 and inf/inf
> 5. Square root if the operand is less than zero
> 6. Inproper comparison operations
> 7. Conversion to integer format as in table 10-6.
> 
Nothing related sorry.

_real_ y is the real part of casinf (inf + NaN i) =3D=3D NaN + inf i;

so __real__ res =3D=3D some_const [+/-] NaN;

So the pb is realted to oprations with NaN?

I so need to know more about which kind of nan value is in the game: a
signaling or a quiet. (printf ("%f\n", _real_ y) printing sadely 'nan')

I so grab in my foo.c file the generic cacosf and build such local versio=
n:
static __complex__ float
L_cacosf (__complex__ float x)
{
printf ("%s();\n", __FUNCTION__);
  __complex__ float y;
  __complex__ float res;

  struct { unsigned int sw[2]; } s;

  /* Get the current status word. */
  __asm__ (
    "fstd               %%fr0, 0(%1) \n\t"
    : "=3Dm" (s)
    : "r" (&s)
  );

printf ("Just b4 casinf();\n");
printf ("s.sw[0]: 0x%x.\n", s.sw[0]);
printf ("s.sw[0] >> 27: 0x%x.\n", (s.sw[0] >> 27));

printf ("imag x: 0x%x\n", (int) __imag__ x);

  y =3D casinf (x);

  /* Get the current status word. */
  __asm__ (
    "fstd               %%fr0, 0(%1) \n\t"
    : "=3Dm" (s)
    : "r" (&s)
  );

printf ("Just aftr __casinf();\n");
printf ("s.sw[0]: 0x%x.\n", s.sw[0]);
printf ("s.sw[0] >> 27: 0x%x.\n", (s.sw[0] >> 27));

printf ("real y: 0x%x\n", (int) __real__ y);

__asm__("#B4_real_res");
  __real__ res =3D (float) M_PI_2 - __real__ y;
__asm__("#AFTR_real_res");

  /* Get the current status word. */
  __asm__ (
    "fstd               %%fr0, 0(%1) \n\t"
    : "=3Dm" (s)
    : "r" (&s)
  );

printf ("Just aftr __real__ res;\n");
printf ("s.sw[0]: 0x%x.\n", s.sw[0]);
printf ("s.sw[0] >> 27: 0x%x.\n", (s.sw[0] >> 27));

  __imag__ res =3D -__imag__ y;

  /* Get the current status word. */
  __asm__ (
    "fstd               %%fr0, 0(%1) \n\t"
    : "=3Dm" (s)
    : "r" (&s)
  );

printf ("Just aftr __imag__ res;\n");
printf ("s.sw[0]: 0x%x.\n", s.sw[0]);
printf ("s.sw[0] >> 27: 0x%x.\n", (s.sw[0] >> 27));

  return res;
}

Well I have to hack a bit *.s file to printout non converted "imag x:" an=
d
"real y:" but seems to work:

L_cacosf();
Just b4 casinf();
s.sw[0]: 0x100000.
s.sw[0] >> 27: 0x0.
imag x: 0x7fa00000
Just aftr __casinf();
s.sw[0]: 0x4080000.
s.sw[0] >> 27: 0x0.
real y: 0x7fc00000
Just aftr __real__ res;
s.sw[0]: 0x84080000.
s.sw[0] >> 27: 0x10.
Just aftr __imag__ res;
s.sw[0]: 0x84080000.
s.sw[0] >> 27: 0x10.

;-)

Using 'single binary floating-point' format describe p8-6 of same PARISC =
2.0
Architecture, it seems that:

imag x: 0x7fa00000
in bin form: 01111111101000000000000000000000

i.e.: a fraction (not zero)
01000000000000000000000
and e: 11111111 

As the 1st byte (b1) of fraction is 0, this seems to be a quiet nan (acco=
rding
to NaN desciption on top of next page)?

And following same way of thought for real y, I got:

real y: 0x7fc00000
in bin form: 01111111110000000000000000000000

i.e.: a fraction (not zero)
10000000000000000000000
and e: 11111111

But the first bit is this time b1 =3D=3D 1 so a signaling nan.

And p8-23 of same book describe 'Operation with NaNs' and specialy
sic: An operation causes an invalid exception when at least one operand i=
s a
signaling NaN and the operation is any arithmetic operation.

Effectively __asm__("#banners"); help me to locate the genrated code:
#APP   
        #B4_real_res
        .loc 1 274 0
#NO_APP
        fldws -12(%r4),%fr22L
        ldil LR'.LC37,%r28
        ldo RR'.LC37(%r28),%r28
        fldws 0(%r28),%fr23L
        fsub,sgl %fr23L,%fr22L,%fr23L
.LVL57:
        fldws -16(%r6),%fr22L
        ldo -160(%r30),%r5  
        fstws %fr22L,-12(%r5)
        fstws %fr23L,-16(%r4)
        fldws -12(%r5),%fr22L
        fldws -16(%r4),%fr23L
        fstws %fr22L,8(%r4)
.LVL58:
        fstws %fr23L,4(%r4)
.LVL59:
        .loc 1 275 0
#APP
        #AFTR_real_res
        .loc 1 284 0
#NO_APP

and the operation is 'fsub,sgl %fr23L,%fr22L,%fr23L'

Agree?

That's why I am convinced that this implemetation of cacos is to simple
compare to its brotherhood casin which makes much more test for limits va=
lues
like nans, 0, inf.

Thanks a lot,
    Joel
=0A=0A----------=0AClub Scarlet : Tout le monde gagne! Si vous devenez au=
jourd'hui Scarlet One grace a un client existant de Scarlet, vous recevez=
 tous les deux un cadeau d'une valeur de 50 euros! Surfez vite sur http:/=
/www.clubscarlet.be

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
