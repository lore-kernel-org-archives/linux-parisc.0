Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from solo.franken.de (pD951C6B0.dip.t-dialin.net [217.81.198.176])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE1F1482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Nov 2001 14:28:09 -0700 (MST)
Date: Thu, 22 Nov 2001 22:07:10 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Markus Grabert <xam@student.cs.ucc.ie>
Cc: Grant Grundler <grundler@puffin.external.hp.com>,
	Herb Radford <herbr@magma.ca>, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] My C200 situation
Message-ID: <20011122220710.B2342@solo.franken.de>
References: <200111220447.VAA03217@puffin.external.hp.com> <Pine.OSF.4.41.0111221214040.29126-100000@student.cs.ucc.ie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.OSF.4.41.0111221214040.29126-100000@student.cs.ucc.ie>; from xam@student.cs.ucc.ie on Thu, Nov 22, 2001 at 12:26:07PM +0000
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

On Thu, Nov 22, 2001 at 12:26:07PM +0000, Markus Grabert wrote:
> Does anybody know whether stifb and/or XFree is working on a RavenU+
> (C200/C240) with a VISUALIZE FX graphics card ?

it doesn't. Only sticon works, but that's not enough to get X working.
I'm waiting for documentation, which tells me at least how to enable
the framebuffer and how to setup colormaps.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
