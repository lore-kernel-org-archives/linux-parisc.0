Return-Path: <soete.joel@tiscali.be>
Received: from cpout2.tiscali.be (cpout2.tiscali.be [62.235.13.194])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BF3C4839
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 19 Apr 2004 10:53:56 -0600 (MDT)
Date: Mon, 19 Apr 2004 18:53:52 +0200
Message-ID: <40711E5500008F1F@ocpmta2.freegates.net>
In-Reply-To: <1082306164.2195.27.camel@mulgrave>
From: "Joel Soete" <soete.joel@tiscali.be>
Subject: =?ISO-8859-1?Q?Re=3A=20=5Bparisc=2Dlinux=5D=20Re=3A=20kernel=3E=3D2=2E6=2E4=2Drc3=20hung=20or=20panic=20on=20C1=5B18=5D0=09=5Bwas=3A=202=2E6=2E5=2Drc2=2Dpa2=20boot=20panic=20on=20c110=20=3A=28=5D?=
To: "James Bottomley" <James.Bottomley@steeleye.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Cc: PARISC list <parisc-linux@lists.parisc-linux.org>,
	Andy Walker <ajwalker@broadpark.no>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

James ,

Thanks to your explanation, I become to have (step by step) a more detail
idea on what I did and its borther effect. (still have to confirm by test
:^)

 
>coalescing, so our SG lists were usually lots of page sized entities. 
>Now the individual entries can be up to 256k long.


Just to be sure we spoke about the same thing:
256k for you is it well the parisc_vmerge_max_size = IOVP_SIZE * BITS_PER_LONG?

as IOVP == PAGE_SIZE == 4k and BITS_PER_LONG == 32 for a 32bits kernel, so
parisc_vmerge_max_size= 128k

and BITS_PER_LONG == 64 for 64bit kernel, so parisc_vmerge_max_size= 256k.

Thanks in advance,
    Joel

PS: btw in dma.h I found "#define DMA_CHUNK_SIZE (BITS_PER_LONG*PAGE_SIZE)";
couldn't it used in ccio-dma.c and sba-iommu.c in parisc_vmerge_max_size
assignement?

----------------------------------------------------------------------------------------
Tiscali ADSL: 35 €/mois, la meilleure offre du marché!
http://reg.tiscali.be/default.asp?lg=fr
