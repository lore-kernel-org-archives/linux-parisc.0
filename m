Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from boispop1.bois.uswest.net (boispop1.bois.uswest.net [207.108.224.1])
	by dsl2.external.hp.com (Postfix) with SMTP id DF917482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 25 Mar 2001 17:47:08 -0700 (MST)
Date: Sun, 25 Mar 2001 17:46:57 -0700
To: Matthew Wilcox <matthew@wil.cx>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Keyboard cleanup
Message-ID: <20010325174657.A12358@beavis.ybsoft.com>
Reply-To: rbradetich@uswest.net
References: <E14fxTj-00036B-00@chrysl> <20010326003312.N31126@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010326003312.N31126@parcelfarce.linux.theplanet.co.uk>; from matthew@wil.cx on Mon, Mar 26, 2001 at 12:33:12AM +0100
From: Ryan Bradetich <rbrad@beavis.ybsoft.com>
List-ID: <linux-parisc.vger.kernel.org>

This patch worked fine for me on my 712/80 with a ps2 keyboard.

- Ryan

On Mon, Mar 26, 2001 at 12:33:12AM +0100, Matthew Wilcox wrote:
> On Wed, Mar 21, 2001 at 10:17:43PM -0700, Matthew Wilcox wrote:
> > and it seems to be because the array we're initialising is of size 0
> > (128 - SC_LIM).  the following patch seems to DTRT, but i would appreciate
> > someone who has a (non-HIL) keyboard testing it and confirming it works.
> 
> If no-one comes back to me by next weekend and says `no it doesn't work',
> i'm going to commit this anyway and be unsympathetic if it has broken.
> 
> -- 
> Revolutions do not require corporate support.
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux
> 
