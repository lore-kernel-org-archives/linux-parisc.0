From: "soete.joel" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] PA 2.0 float conversion to unsigned long long
Date: Wed, 20 Jul 2005 16:30:23 +0100
Message-ID: <IJXN2N$DA7727996AD92DCEF0C4B526A04147B8@scarlet.be>
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

> > Dave would you mean that c3k was runing parisc-linux and a500 hpux?
> 
> Correct.
> 
Ok clear.

> > Is there some pb in sgl -> udw convertion?
> 
> Could be.  There is a significant different between PA 1.x and 2.0
> in this respect.  PA 2.0 has "hardware" instructions to do these
> conversions.  GCC currently uses these instructions when generating
> PA 2.0 code.

After severall hours of test, I changed my mind.

I have my ws runing hpux 11.00 and gcc to compile pr code ;-)

I have a n4k 2-way pa8600 550Mhz testing parisc-linux 2.6.12-pa2-n4ksmp
(ggc-4.0 + fpr limits) 

I can also use a developement n4k 4-way pa8600 440Mhz (not od this clock)=

runing hpux 11.00 (with latest patch bundle).

First thing on p-l I noticed:
I get rid of unsigned by:
long long
f2ull(float f)
{
 return (long long) f;
}

And it print well 'f2ull((float) ((~0ULL) >> 1)) =3D 0x7fffffffffffffff'

I let you also check the resulting .s file when I play with following:
unsigned long long
f2ull(float f)
{
  long long tmp =3D (long long) f;
  return (unsigned long long) temp;
}

Semanticaly it would be the same as the original but the result is also:
'f2ull((float) ((~0ULL) >> 1)) =3D 0x7fffffffffffffff' ?

Now the brain shacking ;-)

the behaviour comparison between hpux and p-l (on the original code):
I used some gui gdb helper (wdb on hpux and insight and ddd on p-l)

    * at the end of f2ull() ret0 and ret1 (aka r28 & r29) are well differ=
ent:
        hpux: r28 =3D=3D 0x80000000; r29 =3D=3D 0x00000000,
        p-l : r28 =3D r29 =3D=3D 0x80000000
    ???? (the code of .s file is quite the same ;-)

    * very strange is the very difference of fpsr:
      (e.g. after fldw r3(,ret0),fr22
            hpux : fpsr =3D=3D 0x40

            after next fcnv insn
            hpux : fpsr =3D=3D 0x80000000; 

            p-l  : fpsr stay constantly =3D=3D 0x0

So as far as this time the 2 hw are nearly the same, as well as the execu=
table
txt, the 2 previous test make me better thought that fpu are 'configurabl=
e'
(may be not all model) and are not setup the same way by the different OS=
. 
That said, I never read anything about this but i don't see other reasona=
ble
explanation?


Joel

PS:
obviously gdb relase are very different on the 2 systems, but I hope that=
 such
'printf "%x\n", $fpsr' (or what else as reg) could show me actual cpu reg=

value, though.

=0A=0A-------------------------------------------------------=0ANOTE! My =
email address is changing to ... @scarlet.be=0APlease make the necessary =
changes in your address book. =0A=0A

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
