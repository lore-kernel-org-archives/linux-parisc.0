Return-Path: <varenet@esiee.fr>
Received: from viefep18-int.chello.at (viefep18-int.chello.at [213.46.255.21])
	by dsl2.external.hp.com (Postfix) with ESMTP id B2A344838
	for <parisc-linux@parisc-linux.org>;
	Sat, 20 Mar 2004 03:40:15 -0700 (MST)
Date: Sat, 20 Mar 2004 11:40:11 +0100
From: Thibaut VARENE <varenet@esiee.fr>
To: pinotj@club-internet.fr
Subject: Re: [parisc-linux] Re: [DOC] Linux
Message-Id: <20040320114011.20de3426.varenet@esiee.fr>
In-Reply-To: <mnet2.1079773336.27405.pinotj@club-internet.fr>
References: <mnet2.1079773336.27405.pinotj@club-internet.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: willy@debian.org, ajwalker@broadpark.no, joey@infodrom.org,
	parisc-linux@parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sat, 20 Mar 2004 10:02:16 CET
pinotj@club-internet.fr wrote:


> +
> + 10. PA-RISC (32/64)
> + ~~~~~~~~~~~~~~~~~~~
> +	PA-7000         (PCX-S)
> +	PA-7100/PA-7150 (PCX-T)
> +	PA-7100LC       (PCX-L)
> +	PA-7200         (PCX-T')
> +	PA-7300LC       (PCX-L2)
> +	PA-8000         (PCX-U)
> +	PA-8200         (PCX-U+)
> +	PA-8500         (PCX-W)
> +	PA-8600         (PCX-W+)
> +	PA-8700         (PCX-W2)
> +
> +	705, 710, 720, 730, 750
> +       712, 715, 725, 735, 755
> +       B, C, J class workstations
> +       D, K, R, A, L, N class servers and rpXXXX servers

Well, it's a bit quick: we've got no feedback from any successful
install on R class, we only 'suspect' it should work since they're based
on D class hardware (if anyone reading this has a R running, please send
feedback by the way). L-3000 and N class only work UP, as well as P8700
boxes (rpXXXX) that have, unless i'm quite out of sync with latest
developments, some SMP troubles too. Finally, E class are supported
diskless.

> +       T and V class servers are not supported
> +       Superdome will need some additional work.

Superdome, if ever supported, will not be supported as a "Superdome"
system, but as separate units, as far as I've been told. The same goes
for 742/743 VME boards that works standalone.

Have a look at http://www.pateam.org/list.html

HTH,

Thibaut VARENE
The PA/Linux ESIEE Team
http://www.pateam.org/
