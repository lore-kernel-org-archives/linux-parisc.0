Return-Path: <mwood@its.uct.ac.za>
Received: from mail.uct.ac.za (mail.uct.ac.za [137.158.128.3])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5EC7F487B
	for <parisc-linux@lists.parisc-linux.org>;
	Fri, 16 Jan 2004 04:16:13 -0700 (MST)
Date: Fri, 16 Jan 2004 13:16:11 +0200
From: Michael Wood <mwood@its.uct.ac.za>
To: Ivar Orskaug <Ivar.Olav.Harstad.Orskaug@idi.ntnu.no>
Subject: Re: [parisc-linux] Non-HP PCI cards & x86 BOOT-ROMS
Message-ID: <20040116111611.GH9267@marmite.its.uct.ac.za>
References: <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.GSO.4.58.0401161155280.15789@vier.idi.ntnu.no>
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Fri, Jan 16, 2004 at 12:04:22PM +0100, Ivar Orskaug wrote:
> Hi,
> is it possible to run PCI card boot-roms containing x86 code with an
> emulator before loading Linux (perhaps from PALO)? Has anyone succeeded
> doing this, or is it "just not possible" for whatever reason? Anyway,
> if it was possible, it could really make PA-RISCs more usable.
> 	I've heard that this is possible on both linux-mips and linux-alpha

I don't know, but you can do something similar with DHCP, tftp and a
lifimage.

-- 
Michael Wood <mwood@its.uct.ac.za>
