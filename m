Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc1-hems4-0-cust107.bre.cable.ntl.com [213.105.88.107])
	by dsl2.external.hp.com (Postfix) with ESMTP id 109BB482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  5 Sep 2001 08:29:23 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 99C3EB00C; Wed,  5 Sep 2001 15:30:04 +0100 (BST)
Date: Wed, 5 Sep 2001 15:30:04 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Matthew Wilcox <willy@debian.org>
Cc: =?iso-8859-1?Q?Jo=EBl_Soete?= <jso@europay.com>,
	marteaut@esiee.fr, parisc-linux@lists.parisc-linux.org,
	debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] Re: Thomas Marteau kbd patch adapted.(2)
Message-ID: <20010905153004.L11744@linuxcare.com>
References: <OFF20A0000.EE7BF1AA-ONC1256ABE.00498F17@LocalDomain> <20010905145429.C29327@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010905145429.C29327@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Wed, Sep 05, 2001 at 02:54:29PM +0100
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Sep 05, 2001 at 02:54:29PM +0100, Matthew Wilcox wrote:
> 
> Hi joel.  Ryan reports his C180 hangs with thomas' patch forward-ported,
> so I'm reluctant to commit this.

The version I have hangs if there is a ps/2 port with no keyboard attached,
which is what causes Ryans problem.  Don't know whether Joel has addressed
that or not.  Thomas should have a fix for it, but I don't know when he
is around again.  I've been resisting doing anything on the k/b driver
on the assumption that Thomas will be back some time soon...

There are other problems; '\' on my UK k/b doesn't work (between left-shift
and 'Z'), for example.

Richard
