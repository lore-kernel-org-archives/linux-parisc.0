From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-15?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20but=20still=20panic=3A=20=5BWAS=3A=202=2E6=2E10=2Drc1=2Dpa15=20boot=20fine=09on=20n4k=20but=20still=09annoying=20bactrace=5D?=
Date: Fri, 26 Nov 2004 08:22:26 +0100
Message-ID: <418A80E800007D7B@mail-6-bnl.tiscali.it>
References: <1101415152.2020.21.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>
To: "James Bottomley" <James.Bottomley@SteelEye.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <1101415152.2020.21.camel@mulgrave>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> -- Original Message --
> From: James Bottomley <James.Bottomley@SteelEye.com>
> To: Joel Soete <soete.joel@tiscali.be>
> Cc: Grant Grundler <grundler@parisc-linux.org>,
>    PARISC list
> 	 <parisc-linux@lists.parisc-linux.org>
> Date: 25 Nov 2004 14:39:05 -0600
> Subject: Re: [parisc-linux] but still panic: [WAS: 2.6.10-rc1-pa15 boot=

fine
> 	on n4k but still	annoying bactrace]
> 
> 
> On Mon, 2004-11-22 at 08:10, Joel Soete wrote:
> > IASQ: 0000000000000000 0000000000000000 IAOQ: 000000001016a7cc 000000=
001016a7d0
> >  IIR: 527401a0    ISR: 0000000000000000  IOR: 00000000000000d0
> >  CPU:        0   CR30: 000000004d5a0000 CR31: 00000000105f0000
> >  ORIG_R28: 000000001010d18c
> >  IAOQ[0]: update_one_process+0x74/0x168
> >  IAOQ[1]: update_one_process+0x78/0x168
> >  RP(r2): update_one_process+0x6c/0x168
> 
> As best I can tell, this is in kernel/timer.c here:
> 
>         if (p->signal && !unlikely(p->state & (EXIT_DEAD|EXIT_ZOMBIE))
> &&
>             psecs / HZ >=3D p->signal->rlim[RLIMIT_CPU].rlim_cur) {
> 
NIce to point it me out :)

> The problem seems to be that p->signal is null, but it wasn't null when=

> the processor began the evaluation of the condition.  0xd0 is the 64 bi=
t
> offset of rlim[RLIMIT_CPU].rlim_cur.
> 
Cool ;-)

> If you look at the code, p->signal should be in r19 which is zero.
>
I will try to figure thid out.
 
> I have no explanation for this (other than some weird race in the signa=
l
> handling code somewhere).
> 
Yes the hazardous aspect of the pb seems to confirm this hypothesis.
The pb is to find where this race condition occurs; I continue investigat=
ion.

Thanks for help,
    Joel

-------------------------------------------------------------------------=
--
Tiscali vous offre 3 mois d'ADSL et 3 mois de DVD gratuits...profitez-en.=
..
http://reg.tiscali.be/adsl/default.asp?lg=3DFR




_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
