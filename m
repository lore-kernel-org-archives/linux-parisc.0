Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc3-hem11-4-cust123.bre.cable.ntl.com [213.107.179.123])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6FAC5482B
	for <parisc-linux@parisc-linux.org>; Wed, 24 Jul 2002 09:42:49 -0600 (MDT)
Date: Wed, 24 Jul 2002 15:39:58 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: kenneth westelinck <kennywest1@hotmail.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] unresoved symbols when doing a make modules_install
Message-ID: <20020724143958.GS29996@sleepie.demon.co.uk>
References: <OE32H8BX2vRxFmNHYus00008028@hotmail.com> <20020723150421.G3052@parcelfarce.linux.theplanet.co.uk> <OE71RBHZXFZ0stgr3SU00003162@hotmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OE71RBHZXFZ0stgr3SU00003162@hotmail.com>
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

On Wed, Jul 24, 2002 at 10:33:22AM +0200, kenneth westelinck wrote:
> > i'm baffled.  we prototype, define and EXPORT_SYMBOL outs[bwl].  i can't
> > see why you'd get this error.

But only if CONFIG_PCI or CONFIG_ISA, kenneth has neither in his config.

Richard
