Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk (the-village.bc.nu [81.2.110.252])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id B60C648AB; Sun,  4 Apr 2004 18:12:11 -0600 (MDT)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	i350870r010151; Mon, 5 Apr 2004 01:08:08 +0100
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	i35087al010149; Mon, 5 Apr 2004 01:08:07 +0100
Subject: Re: [parisc-linux] ATOMIC_HASH brainfart
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Grant Grundler <grundler@parisc-linux.org>
In-Reply-To: <20040404065604.GA2335@colo.lackof.org>
References: <20040404065604.GA2335@colo.lackof.org>
Content-Type: text/plain
Message-Id: <1081123678.10091.19.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Mon, 05 Apr 2004 01:08:00 +0100
Cc: HPPA List <parisc-linux@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sul, 2004-04-04 at 07:56, Grant Grundler wrote:
> Hi all,
> Seems like someone was confused when they hacked ATOMIC_HASH macro.
> Cacheline is 64 bytes not 256...but I've been told several times gcc
> is smart enough to convert "foo/64" to "foo>>6"...then just use
> the L1_CACHE_BYTES definition to indicate intent?

IFF foo is a constant or foo is unsigned. Looks fine to me
