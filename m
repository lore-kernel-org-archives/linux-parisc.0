Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from amsfep15-int.chello.nl (amsfep15-int.chello.nl [213.46.243.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id 26032482A
	for <parisc-linux@parisc-linux.org>; Wed, 20 Mar 2002 16:09:20 -0700 (MST)
Date: Thu, 21 Mar 2002 00:10:28 +0100 (CET)
From: Arjen Hommersom <arjenh@chello.nl>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Re: PA-RISC 0.9.3+C200+Visualize-EG+2.4.18-pa05
 = working X!
In-Reply-To: <Pine.LNX.4.44.0203202015180.5453-100000@sal.ucc.ie>
Message-ID: <Pine.LNX.4.21.0203210007210.25956-100000@gatekeeper>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Wed, 20 Mar 2002, M. Grabert wrote:

> On Thu, 14 Mar 2002, Grant Grundler wrote:
> 
> > John wrote:
> > > I wanted to share the good news that Grant's recent patch to "entry.S"
> > ...
> > > Thanks Grant!
> >
> > That's great news!
> >
> > But Thomas Bogendoerf should get most of the credit for figuring
> > out the problem and fix. I just implemented what he said.
> >
> > BTW, I've modified the patch a bit (removed an un-needed depdi)
> > and it's still not committed yet. I'd like to let Thomas
> > commit it himself since he really did the hard part.
> 
> I also downloaded and patched a 2.4.18-pa5 kernel with it,
> (just a simple conflict with the kernel version number in
>  the Makefile appeared, easy to solve).
> 
> It works on my C240 with a FX2 card. Well, it now recognizes
> the gfx card at startup and it seems to initialize it, but since
> I currently don't have a proper monitor, I can't tell you whether
> gfx is working or not :-/
> (BTW, I use the serial console on the C240, connected to a FreeBSD
>  notebook)
> At least the C240 is still running, so the patch doesn't do a harm ;)

It doesnt crash my C240 either, but unfortunately no fb is working. I
guess this doesn't work for the FX2 graphics cards..

Arjen Hommersom
