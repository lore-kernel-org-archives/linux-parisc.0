Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2A6674829
	for <parisc-linux@parisc-linux.org>; Mon, 30 Sep 2002 09:25:39 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17w2QS-000828-00; Mon, 30 Sep 2002 16:25:36 +0100
Date: Mon, 30 Sep 2002 16:25:36 +0100
From: Matthew Wilcox <willy@debian.org>
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: 'parisc-linux maillist' <parisc-linux@parisc-linux.org>
Subject: Re: [parisc-linux] Serial MUX
Message-ID: <20020930162536.L18377@parcelfarce.linux.theplanet.co.uk>
References: <02Sep30.171511cest.119078@ns.hiscom.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <02Sep30.171511cest.119078@ns.hiscom.nl>; from c.beerse@torex-hiscom.nl on Mon, Sep 30, 2002 at 05:03:09PM +0200
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

From: Christoph Plattner [mailto:christoph.plattner@gmx.at]
> This driver can be used on machines having a non-supported
> multi-serial interface like a E35/45/55 or some K-series
> machines. 

slight misunderstanding: this driver supports almost all the
non-16550-compatible serial ports used on HP machines.  That includes E,
F-I, K-class and the optional console card used with some D & R class
machines.  It doesn't include "Burgundy", "Silverfox" or "Lego" console
devices.  I'm working on updating the hwdb to reflect this.

-- 
Revolutions do not require corporate support.
