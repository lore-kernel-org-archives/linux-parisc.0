Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 60A1D4829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Aug 2002 12:12:48 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17eJgN-0006Cn-00; Mon, 12 Aug 2002 19:12:47 +0100
Date: Mon, 12 Aug 2002 19:12:47 +0100
From: Matthew Wilcox <willy@debian.org>
To: Thomas Schmid <Thomas.Schmid@ascom.ch>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Additional Network Cards for 712
Message-ID: <20020812191247.P27578@parcelfarce.linux.theplanet.co.uk>
References: <OFF5A919B5.02CBBDDB-ONC1256C13.0060CB62@hasler.ascom.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OFF5A919B5.02CBBDDB-ONC1256C13.0060CB62@hasler.ascom.ch>; from Thomas.Schmid@ascom.ch on Mon, Aug 12, 2002 at 07:46:49PM +0200
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

On Mon, Aug 12, 2002 at 07:46:49PM +0200, Thomas Schmid wrote:
> 1) Are there any add-on NICs for the 712 available (preferably for only 
> little money) ?

they're very specialised and quite rare.

> 2) More important, are they supported by the kernel ?

yes, they're the same chip as is on the motherboard, and the driver
handles multiple devices.

-- 
Revolutions do not require corporate support.
