Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B6BEC482D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 20:46:16 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18AMZY-0003ui-00; Sat, 09 Nov 2002 03:46:12 +0000
Date: Sat, 9 Nov 2002 03:46:12 +0000
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "Adam J. Richter" <adam@yggdrasil.com>,
	James.Bottomley@steeleye.com, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Message-ID: <20021109034612.S12011@parcelfarce.linux.theplanet.co.uk>
References: <200211090128.RAA31693@adam.yggdrasil.com> <adam@yggdrasil.com> <20021109015611.571B44829@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021109015611.571B44829@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Fri, Nov 08, 2002 at 06:56:11PM -0700
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

On Fri, Nov 08, 2002 at 06:56:11PM -0700, Grant Grundler wrote:
> They don't have PCI slots.
> I hedge because HP makes a "card-mode Dino" type of card that will
> fit into 715 which has a GSCtoPCI bus controller on-board along
> with the target PCI device (eg 21143 tulip)

Sorry Grant, HP marketing has confused you ;-).  715/33, 715/50 &
715/75 have a PCX-T processor (can't do uncached pages), but don't have
a GSC slot.  715/64, 715/80, 715/100 & 715/100XC have a PCX-L processor
(can do uncached pages), and do have a GSC slot.  The only machines
with GSC and non-coherent memory are the T class (unsupportable..) and
something like an F, G, H or I class with a GeckoBOA adapter... and we
aren't claiming support for those either.

-- 
Revolutions do not require corporate support.
