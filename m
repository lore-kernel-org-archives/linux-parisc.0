Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Fri, 11 Jul 2003 09:24:59 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Bartlomiej Zolnierkiewicz <B.Zolnierkiewicz@elka.pw.edu.pl>
Cc: Matthew Wilcox <willy@debian.org>,
	Alan Cox <alan@lxorguk.ukuu.org.uk>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: [2.5] ns87415 irq
Message-ID: <20030711152459.GA27684@dsl2.external.hp.com>
References: <20030711140732.GA20424@parcelfarce.linux.theplanet.co.uk> <Pine.SOL.4.30.0307111612370.9740-100000@mion.elka.pw.edu.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.SOL.4.30.0307111612370.9740-100000@mion.elka.pw.edu.pl>
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

On Fri, Jul 11, 2003 at 04:26:21PM +0200, Bartlomiej Zolnierkiewicz wrote:
> Are there any other archs using ns87415?

Well, the original ns87415 is a PCI device.
I'd guess any arch could have interest in it.

The parisc specifc code is for "SuckyIO" (aka Nat Sem "87560")
which has ns87415 embedded as one of it's functions.
AFAIK, HP was the only customer to use NS's SuckyIO chip.

grant
