From: "Joel Soete" <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] clerar user page test
Date: Thu, 9 Dec 2004 18:31:49 +0000
Message-ID: <418A81310000E120@mail-7-bnl.tiscali.it>
References: <20041209173239.GA14560@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="ISO-8859-15"
Cc: parisc-linux@lists.parisc-linux.org
To: "Grant Grundler" <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041209173239.GA14560@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


> I also rewrote the test and parked it on:
> 	http://iou.parisc-linux.org/hppa/clup.c
> 
Cool (thanks a lot)

> Here's the output from a a500-6x running 2.6.10-rc1-pa12-SMP:
> grundler@iodine:~$ gcc-3.3 -o clup0 clup.c
> grundler@iodine:~$ gcc-3.3 -DLOOP2X -o clup1 clup.c
> grundler@iodine:~$ gcc-3.3 -march=3D2.0 -DLP64 -o clup2 clup.c
> grundler@iodine:~$ gcc-3.3 -march=3D2.0 -DLP64 -DLOOP2X -o clup3 clup.c=

> grundler@iodine:~$ gcc-3.3 -march=3D2.0 -DLP64 -DLOOP2X -DPREFETCH -o c=
lup4
> clup.c
> grundler@iodine:~$ for i in 0 1 2 3 4; do time ./clup$i ; done 2>&1 |
fgrep
> user 
> user    0m2.393s
> user    0m2.392s
> user    0m1.238s
> user    0m1.224s
> user    0m1.225s
> 
> I've varied the prefetch values and nothing seems to be helping.
> I have to wonder if it's because the kernel VM is interferring
> with the test.
> 
> But doubling the stride for 64-bit is consistently ~1.8% improvement.
> 
Ok wil I prepare a patch or you?

Thx again,
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
