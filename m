Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from dhcp23.swansea.linux.org.uk (pc1-cwma1-5-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id BB46A4885
	for <parisc-linux@lists.parisc-linux.org>; Wed, 27 Aug 2003 15:24:11 -0600 (MDT)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9) with ESMTP id h7RLNLra023519;
	Wed, 27 Aug 2003 22:23:21 +0100
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.9/8.12.9/Submit) id h7RLNIMj023517;
	Wed, 27 Aug 2003 22:23:18 +0100
Subject: Re: [parisc-linux] C3000 and IDE DMA support
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <Pine.LNX.4.44.0308271731570.14906-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0308271731570.14906-100000@sal.ucc.ie>
Content-Type: text/plain
Message-Id: <1062019396.23493.8.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: 27 Aug 2003 22:23:17 +0100
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

On Mer, 2003-08-27 at 18:36, M. Grabert wrote:
> beast:/home/xam# hdparm -i /dev/hda
>  DMA modes:  mdma0 mdma1 *mdma2

So its tuned for DMA2 (doesn't mean its not using PIO..)

> Mhh, also "hdparm -d" shows that the "DMA mode" of the hard disk is
> "enabled", but I really have the feeling it isn't.

The crash is also curious - I wonder if parisc is either bouncing
every DMA buffer and copying it for some reason, or its failing DMA
by a path other platforms don't hit which isnt cleaning up right.
