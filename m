Return-Path: <randolph@tausq.org>
Date: Sun, 4 Apr 2004 17:20:26 -0700
From: Randolph Chung <randolph@tausq.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] ATOMIC_HASH brainfart
Message-ID: <20040405002026.GT750@tausq.org>
References: <20040404065604.GA2335@colo.lackof.org>
	<1081123678.10091.19.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1081123678.10091.19.camel@dhcp23.swansea.linux.org.uk>
Cc: Grant Grundler <grundler@parisc-linux.org>,
	HPPA List <parisc-linux@parisc-linux.org>
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> > Seems like someone was confused when they hacked ATOMIC_HASH macro.
> > Cacheline is 64 bytes not 256...but I've been told several times gcc
> > is smart enough to convert "foo/64" to "foo>>6"...then just use
> > the L1_CACHE_BYTES definition to indicate intent?
> 
> IFF foo is a constant or foo is unsigned. Looks fine to me

or you can even use L1_CACHE_SHIFT :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
