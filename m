Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id CF8FE4861
	for <parisc-linux@lists.parisc-linux.org>; Thu,  7 Mar 2002 07:00:07 -0700 (MST)
Date: Thu, 7 Mar 2002 09:00:51 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] FB on c3k
Message-ID: <20020307090051.D30290@systemhalted>
References: <20020306080101.B6A874859@dsl2.external.hp.com> <20020307002239.A9224@solo.franken.de> <tsbogend@alpha.franken.de> <20020307073117.4C572482F@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020307073117.4C572482F@dsl2.external.hp.com>; from grundler@dsl2.external.hp.com on Thu, Mar 07, 2002 at 12:31:16AM -0700
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

On Thu, Mar 07, 2002 at 12:31:16AM -0700, Grant Grundler wrote:
> Thomas Bogendoerfer wrote:
> > right of me is a monitor connected to a B2600 with a X screen on it :-)
> 
> Cool!
>

Speaking of framebuffers. 

Anyone working with DirectFB? (http://www.directfb.org)

I just recently compiled DirectFB on our 715/50 cluster, so I can get
a lightweight library ontop of fbdev (thanks for moral support Fleedwood!)

The only supported mode is RGB332 which is like a fixed index 8-bit vis.
It's displaying stuff (I think, with wrong colours). I'm just at a loss 
to find the right colour palette for 3,3,2 ? :)

More research needed!

c. 
