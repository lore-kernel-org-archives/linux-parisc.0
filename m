From: "soete.joel" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Tue, 19 Jul 2005 18:41:47 +0100
Message-ID: <IJVYHN$354379AA3907AD5E5A7B8AAF60BAA597@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=iso-8859-1
Cc: kyle <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: "dave" <dave@hiauly1.hia.nrc.ca>
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

---------- Initial header -----------

>>From      : parisc-linux-bounces@lists.parisc-linux.org
To          : grundler@parisc-linux.org
CC          : kyle@mcmartin.ca,parisc-linux@lists.parisc-linux.org
Date      : Mon, 18 Jul 2005 18:34:17 -0400 (EDT)
Subject : Re: [parisc-linux] PA 2.0 float conversion to unsigned long lon=
g

> > On Wed, Jul 13, 2005 at 11:56:28PM -0400, John David Anglin wrote:
> > ...
> > > That's what I was thinking when I wrote the message.  Under linux,
> > > both the left and right halves of fr22 end up with 0x80000000.  Und=
er
> > > hpux, the left result is 0x80000000 and the right 0.  The only othe=
r
> > > explanation is that the c3k fpu has a bug that's not present in an =
=3D
> > A500
> > > (doubtful).
> > 
Dave would you mean that c3k was runing parisc-linux and a500 hpux?

> > If they are running at the same clock speed, they are likely to have
> > identical CPUs. Some of the 440Mhz boxes did roll CPU HW version
> > after initial release - including some SMP bugs that C3K wouldn't
> > be exposed to. I'm skeptical it's a bug in the FPU unless you
> > can demonstrate the same code works on another (newer) CPU model.
> 
> Actually, it's the reverse.  I believe that the A500 is a 550 MHz
> 8600 and the C3K is a 875 MHz 8700.
I doubt it help but with parisc-linux, I also encounter the same pb with =
a
pa8000 180mhz (d380), as well as on a pa8600 440Mhz (b2k) or same pa8600
550Mhz (n4k smp)

(sorry no pa2.0 running hpux on which I could install gcc :_( ) 

> It's really unclear which of
> the new PA 2.0 floating-point instructions are actually supported
> in hardware.  I'd have to do some timing tests to figure that out
> as there's not much documentation.  It is clear that linux has code
> in the kernel to handle the convert in question.
> 
mmm fwiw, when I did the test replacing float with double as:
unsigned long long
d2ull(double f)
{
  return (unsigned long long int) f;
}

int
main ()
{
  unsigned long long x1, x2;

  x1 =3D ((~0ULL) >> 1);
  x2 =3D ((~0ULL) >> 1);

  printf("x1 =3D 0x%llx\n", x1);
  printf("d2ull((double) x1) =3D 0x%llx\n", d2ull((double) x1));

  printf("(~0ULL) >> 1 =3D 0x%llx\n", (~0ULL) >> 1);
  printf("((~0ULL) >> 1) + 1 =3D 0x%llx\n", ((~0ULL) >> 1) + 1);

  if (d2ull((double) x1) !=3D (~0ULL) >> 1 &&  /* 0x7fffffff */
      d2ull((double) x2) !=3D ((~0ULL) >> 1) + 1)
    abort();
  return 0;
}
/*
x1 =3D 0x7fffffffffffffff
d2ull((double) x1) =3D 0x8000000000000000
(~0ULL) >> 1 =3D 0x7fffffffffffffff
((~0ULL) >> 1) + 1 =3D 0x8000000000000000
 */

(I just used x var to encounter the 'ull -> float' in main() too)

Is there some pb in sgl -> udw convertion?

Joel=0A=0A-------------------------------------------------------=0ANOTE!=
 My email address is changing to ... @scarlet.be=0APlease make the necess=
ary changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
