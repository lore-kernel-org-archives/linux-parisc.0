Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hptux.heylan (pD9E4A8A7.dip.t-dialin.net [217.228.168.167])
	by dsl2.external.hp.com (Postfix) with ESMTP id 203EF4829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 09:54:36 -0600 (MDT)
Date: Fri, 20 Sep 2002 17:54:30 +0200
From: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@lists.parisc-linux.org,
	Petr Vandrovec <vandrove@vc.cvut.cz>
Subject: Re: [parisc-linux] partial success with matroxfb
Message-ID: <20020920155429.GB22068@gate450.dyndns.org>
References: <20020821232010.GD15344@gate450.dyndns.org> <20020822225054.GA24190@ppc.vc.cvut.cz> <20020920002700.GY22068@gate450.dyndns.org> <200209200923.31247.deller@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200209200923.31247.deller@gmx.de>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Hallo Helge,
	
* Helge Deller <deller@gmx.de> [2002-09-20 09:25]:
> instead of 
> 
>  static inline unsigned int mga_readb(vaddr_t va, unsigned int offs) {
> +	return __raw_readb(va.vaddr + offs);
> - 	return readb(va.vaddr + offs);
>  }
> 
> I think you should use the
> 	fb_readXXX() and fb_writeXX()
> functions from include/video/fbcon.h which are automatically
> initialized correctly acording to the architecture.

I fear this would still break m68k because it is defined differently
in include/video/fbcon.h than in include/asm-m68k/io.h. matroxfb is
currently using the definition from io.h.

regards
andreas
