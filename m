Return-Path: <soete.joel@tiscali.be>
Received: from cpout1.tiscali.be (cpout1.tiscali.be [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C68BF48BD
	for <parisc-linux@lists.parisc-linux.org>;
	Wed, 18 Feb 2004 10:25:55 -0700 (MST)
Date: Wed, 18 Feb 2004 18:25:46 +0100
Message-ID: <402A42A10000569A@ocpmta1.freegates.net>
In-Reply-To: <20040218163927.GC9497@baldric.uwo.ca>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] glibc-2.3.3 & gcc-snapshot (3.5.0) pb
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"Elliott Potter" <epotter@eep.burdell.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos,

>>> > But now I need more to try to complete job because:
>> > make[2]: *** [/Develop/parisc-linux/build/glibc/sunrpc/xbootparam_prot.stmp]
>
>This is the first time that the loader you built is used. If the loader
>is in anyway broke, it will *always* die here first. Just remember this
>glibc haiku when you are coding:
>
>	Loader code is bad.
>	Dying in sunrpc.
>	Blame relocations.
>
>:)

:)) (I was ignoring what an haiku is but now find it as a very good example)


r00-03  0000000000000000 000000004102b6fc 000000004100721f 00000000faf02040

>[snip] If you had a copy of your
/proc/<pid>/maps then you could decipher where 0x4102b6fc pointed.

First just to be sure: don't you speak better of r02=0x4100721f?

unfortunately when I discover dmesg, the process was already died :(
(I will see howto ?)

> > IASQ: 0000000000003580 0000000000003580 IAOQ: 0000000041007293 0000000041007297
> >  IIR: 0ec01095    ISR: 0000000000003580  IO
>: 000000000016b690
> >  CPU:        8   CR30: 000000003a038000 CR31: 00000000104a4000
> >  ORIG_R28: 0000000040170000
> >  IAOQ[0]: 0x41007293
> >  IAOQ[1]: 0x41007297
> >  RP(r2): 0x4100721f

>Odd, the insns you are executing are really close to
>your IAOQ addresses, so the functions are close together.

Thanks for advise, help and attention,
    Joel


----------------------------------------------------------------------------------------
Tiscali ADSL: 19,50 €/mois, pendant 3 mois! L'Internet rapide, c'est pour
tout le monde.
http://reg.tiscali.be/default.asp?lg=fr
