Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from fep06-app.kolumbus.fi (fep06-0.kolumbus.fi [193.229.0.57])
	by dsl2.external.hp.com (Postfix) with ESMTP id 870954829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 12:16:23 -0600 (MDT)
Received: from azrael.blades.cxm ([62.248.237.162])
          by fep06-app.kolumbus.fi with ESMTP
          id <20020812181617.HEER20539.fep06-app.kolumbus.fi@azrael.blades.cxm>
          for <parisc-linux@lists.parisc-linux.org>;
          Mon, 12 Aug 2002 21:16:17 +0300
Received: (from blades@localhost)
	by azrael.blades.cxm (SGI-8.9.3/8.9.3) id VAA37828
	for parisc-linux@lists.parisc-linux.org; Mon, 12 Aug 2002 21:16:10 +0300 (EEST)
Date: Mon, 12 Aug 2002 21:16:10 +0300
From: Harri Haataja <harri.haataja@cs.helsinki.fi>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Additional Network Cards for 712
Message-ID: <20020812211608.B37236@azrael.smilehouse.com>
References: <OFF5A919B5.02CBBDDB-ONC1256C13.0060CB62@hasler.ascom.ch> <20020812191247.P27578@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020812191247.P27578@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Mon, Aug 12, 2002 at 07:12:47PM +0100
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

On Mon, Aug 12, 2002 at 07:12:47PM +0100, Matthew Wilcox wrote:
> On Mon, Aug 12, 2002 at 07:46:49PM +0200, Thomas Schmid wrote:
> > 1) Are there any add-on NICs for the 712 available (preferably for
> > only little money) ?
> they're very specialised and quite rare.
> 
> > 2) More important, are they supported by the kernel ?
> yes, they're the same chip as is on the motherboard, and the driver
> handles multiple devices.

Did 712 have EISA? Anyway, 715 does. Are there any (E)ISA cards
supported by the linux kernel? Is there an HCL for cards?

-- 
Java users do not need serious computing power, Java does.
		-- Andrew J. Brehm, Scary Devil Monastery
