From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20new=20toolchain=20=28binutils=202=2E15=2C=20gcc=203=2E5=2C=20glibc=202=2E3=2E3=29=09progress?=
Date: Wed, 7 Jul 2004 19:02:37 +0200
Message-ID: <40BD9F05000175F1@ocpmta1.freegates.net>
References: <40E6A00E.8020203@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-1"
Cc: parisc-linux@parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <40E6A00E.8020203@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Carlos,

SOme news (but didn't help me :(

> -- Original Message --
> Date: Sat, 03 Jul 2004 12:01:18 +0000
> From: Joel Soete <soete.joel@tiscali.be>
> To: Carlos O'Donell <carlos@baldric.uwo.ca>
> Cc: parisc-linux@parisc-linux.org
> Subject: Re: [parisc-linux] new toolchain (binutils 2.15, gcc 3.5, glib=
c
> 2.3.3)
> 	progress
> 
> 
> 
> 
> Carlos O'Donell wrote:
> >>I can now reproduce what happend during check :)
> >>and the crash occurs now at 0x401f67a8
> >>
> >>and ddd offers me a related dump window:
> >>Dump of assembler code from 0x401f67a8 to 0x401f68a8:
> >>    0x401f67a8:     ldw 0(,r25),r21
> >>    0x401f67ac:     ldo 1115(r20),r20
> > 
> > 
> > Joel, the most important code is what came *before* teh crash insn,
you
> > usually want atleast 16-32 insns before the crash to see what was goi=
ng
> > on, usually I trace back to try find the start of the function.
> > 
> > 
> >>0002c77c <_nl_intern_locale_data>:
> >>   2c77c:       6b c2 3f d9     stw rp,-14(,sp)
> >>   2c780:       6f c6 00 80     stw,ma r6,40(,sp)
> >>   2c784:       08 1a 02 46     copy r26,r6
> >>   2c788:       6b c5 3f 89     stw r5,-3c(,sp)
> >>   2c78c:       08 19 02 45     copy r25,r5
> >>   2c790:       6b c3 3f 99     stw r3,-34(,sp)
> >>   2c794:       08 18 02 43     copy r24,r3
> >>   2c798:       6b c4 3f 91     stw r4,-38(,sp)
> >>   2c79c:       8f 0e 81 d0     cmpib,>>=3D 7,r24,2c88c <_nl_intern_l=
ocale_data+0x110>
> >>   2c7a0:       6b d3 3f c1     stw r19,-20(,sp)
> >>   2c7a4:       22 98 04 00     ldil 20030000,r20
> >>=3D=3D>2c7a8:       0f 20 10 95     ldw 0(,r25),r21
> > 
for a run i got r25=3D=3D0x4004b000

and the corresponding mapping at this moment is:
00010000-00011000 r-xp 00000000 08:0b 142497     /Develop/parisc-linux/bu=
ild/glibc/localedata/tst-leaks
00020000-00021000 rwxp 00000000 08:0b 142497     /Develop/parisc-linux/bu=
ild/glibc/localedata/tst-leaks
40000000-40004000 rw-p 40000000 00:00 0 
4004b000-4004c000 r--p 00000000 08:0b 2632       /Develop/parisc-linux/bu=
ild/glibc/localedata/de_DE.ISO-8859-1/LC_IDENTIFICATION
403eb000-40529000 r-xp 00000000 08:0b 18692      /Develop/parisc-linux/bu=
ild/glibc/libc.so
40529000-40536000 rwxp 0012e000 08:0b 18692      /Develop/parisc-linux/bu=
ild/glibc/libc.so
40536000-40538000 rwxp 40536000 00:00 0 
410bd000-410d4000 r-xp 00000000 08:0b 196300     /Develop/parisc-linux/bu=
ild/glibc/elf/ld.so
410e3000-410e7000 rwxp 00016000 08:0b 196300     /Develop/parisc-linux/bu=
ild/glibc/elf/ld.so
410e7000-41108000 rwxp 410e7000 00:00 0 
bff00000-bff02000 rwxp bff00000 00:00 0 

I try to compare with glibc build with gcc-3.3.4 (that takes me some time=

to remember That I have also to upgrade my kernel to make gdb stop at a
break point :( ) and I got the same matching r25 =3D=3D map address of /D=
evelop/parisc-linux/build/glibc/localedata/de_DE.ISO-8859-1/LC_IDENTIFICA=
TION.
But with gcc-3.3.4 that can continue not with gcc-3.5????

What do I miss?

> > 
> > You are trying to get data from a pointer passed in as the second
> > parameter to the function, you want to see the value of r25 before th=
e
> > load to see if it is valid. In gdb you can print register values or
just
> > use the info command to see all the regs. You can display regs by usi=
ng
> > '$r25' AFAIR, though the format may vary.
> > 
> ah I see
> And btw if I put a break at 0x401f677c (corresponding to line 2c77c: th=
e
> first routine insn), I would also be able to find the 
> address from where it's called (just have to find back the right regist=
er).

umm, at this place 'info reg' gave me (among other stuff :) )
rp             0x404179f3
r31            0x404179d7

(rp=3D=3Dr2 if i well understand)

do you remember what is the right calling adress?

Thanks again,
    Joel


-------------------------------------------------------------------------=
--
Tiscali ADSL LIGHT, 19,95 EUR/mois pendant 6 mois, c'est le moment de fai=
re
le pas!
http://reg.tiscali.be/default.asp?lg=3Dfr




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
