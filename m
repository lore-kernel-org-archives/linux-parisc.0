Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: "M. Grabert" <xam@cs.ucc.ie>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FB on c3k 
In-Reply-To: Message from "M. Grabert" <xam@cs.ucc.ie>
   of "Wed, 06 Mar 2002 15:41:21 GMT." <Pine.LNX.4.44.0203061421250.17588-100000@sal.ucc.ie>
References: <Pine.LNX.4.44.0203061421250.17588-100000@sal.ucc.ie> 
Date: Wed, 06 Mar 2002 09:46:03 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020306164603.D7DED4845@dsl2.external.hp.com>
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

"M. Grabert" wrote:
> very nice!
> Is the Visual-EG of the same type as the Visual-EG in my C240?

Same generation, but I'm using "Vis-EG/PCI" vs plain "Vis-EG".
I expect them to be the same (prgramming model) but don't know
if they actually are.

> Can you use the driver for Visual-FX aswell (AFAIK these are similar) ?

They are not similar. Vis-EG is 1280x1024 8 bit.
Vis-FX are all 24-bit color. FX2/4/6 have 3d acceleration
and texture mapping functionality (AFAIK, Vis-FXe does not)
I think Vis-FX can handle higher resolutions as well.

> Packed pixel:
> 
> If you see stripes it is very likely that you mix up PACKED pixels and
> NONPACKED pixels. But I think that's what you already checked.

I haven't. "PACKED PIXEL" is what the kernel currently hands back.
I believe this works for Vis-EG/GSC on PA1.1 machines.

> Mini-tiles/Packed pixel:
...
> Interleaved:
...
I don't think Vis-EG/PCI uses either of the above.

> BTW, Is the color of the displayed picture alright ?

I can't tell since the visible portions are only black.
Maybe that's a hint they are not.

> Is the picture streched/compressed or cropped ?
> You didn't say whether the Tux picture also had black stripes.

Both STICON text and Tux are striped diagonally top-left
to bottom right.

> Try to use some test-pictures (e.g. all red, all green. all blue,
> check-boxed, special patterns ...)!

That's a good idea. I setup some GIF for that.

> Actually I don't think I'm telling you any new stuff.
> So let's stop here and I wish you good luck!

For me, much of it is new. I don't know anything about FB layout.

thanks,
grant
