Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by dsl2.external.hp.com (Postfix) with SMTP id 06F314829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 20 Sep 2002 01:24:37 -0600 (MDT)
From: Helge Deller <deller@gmx.de>
To: Andreas Seltenreich <s_selten@informatik.uni-karlsruhe.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] partial success with matroxfb
Date: Fri, 20 Sep 2002 09:23:31 +0200
Cc: Petr Vandrovec <vandrove@vc.cvut.cz>
References: <20020821232010.GD15344@gate450.dyndns.org> <20020822225054.GA24190@ppc.vc.cvut.cz> <20020920002700.GY22068@gate450.dyndns.org>
In-Reply-To: <20020920002700.GY22068@gate450.dyndns.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Message-Id: <200209200923.31247.deller@gmx.de>
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

On Friday 20 September 2002 02:27, Andreas Seltenreich wrote:
> Hello list,
>
> here is a report about my experiments with a "Matrox Mystique" in
> a C200. The attached diff shows the _temporary_ changes I made to the
> matroxfb.
>
> I replaced the {read,write}{b,w,l} calls to their __raw equivalents,
> because Petr Vandrovec told me that matroxfb expects them to do BE to
> PCI on BE machines. I had no success when running the card in LE mode.


Hi Andreas,

instead of 

 static inline unsigned int mga_readb(vaddr_t va, unsigned int offs) {
+	return __raw_readb(va.vaddr + offs);
- 	return readb(va.vaddr + offs);
 }

I think you should use the
	fb_readXXX() and fb_writeXX()
functions from include/video/fbcon.h which are automatically
initialized correctly acording to the architecture.

Greetings,
Helge
