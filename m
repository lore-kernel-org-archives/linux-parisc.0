Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 487034829
	for <parisc-linux@lists.parisc-linux.org>; Wed,  2 Oct 2002 07:40:40 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17wjjx-0007ES-00; Wed, 02 Oct 2002 14:40:37 +0100
Date: Wed, 2 Oct 2002 14:40:37 +0100
From: Matthew Wilcox <willy@debian.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Ryan Bradetich <rbradetich@uswest.net>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Request for preliminary approval for a lanana device number.
Message-ID: <20021002144037.C18377@parcelfarce.linux.theplanet.co.uk>
References: <1033526414.31126.1871.camel@beavis> <1033565931.23758.12.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1033565931.23758.12.camel@irongate.swansea.linux.org.uk>; from alan@lxorguk.ukuu.org.uk on Wed, Oct 02, 2002 at 02:38:51PM +0100
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

On Wed, Oct 02, 2002 at 02:38:51PM +0100, Alan Cox wrote:
> On Wed, 2002-10-02 at 03:40, Ryan Bradetich wrote:
> > I would like to request prelimiary approval from you that you intend to
> > merge this driver into your tree, so I can request a valid device
> > number from lanana.
> 
> parisc tree is Willy, not my business.

Ah, but lanana doesn't take acceptance by me as sufficient to allocate a
new char major number.  It's you, Marcelo or Linus.

Since this device is PA-RISC specific, I thought we could perhaps use
char-major-11 as that's used for some SPARC-only device at present.

-- 
Revolutions do not require corporate support.
