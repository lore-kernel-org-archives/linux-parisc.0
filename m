Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
	by dsl2.external.hp.com (Postfix) with ESMTP id C07004829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 28 Oct 2002 14:18:01 -0700 (MST)
Date: Mon, 28 Oct 2002 22:15:14 +0100
To: Nahkola Mikko <mikko.nahkola@nokia.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] framebuffer depth and other issues ...
Message-ID: <20021028211514.GA4269@solo.franken.de>
References: <20021028112551.GR15137@aurinko.ntc.nokia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021028112551.GR15137@aurinko.ntc.nokia.com>
From: tsbogend@alpha.franken.de (Thomas Bogendoerfer)
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

On Mon, Oct 28, 2002 at 01:25:52PM +0200, Nahkola Mikko wrote:
> I was wondering ... the VIS-EG is about as close to "fully supported" as 
> they get, right?

there are still 2D drawing accelerations possible, hardware cursor,
color recovery and usage of the second color map.

> Is it possible to get more than 8 bpp out of a VIS-EG?

no, VIS-EG is 8 bit color, no way to get more.

> How much of a difference is there between VIS-EG/PCI (A4977A) and 
> VIS-EG/GSC (A4450A) in this regard? I have an A4450A in there at the 
> moment.

no difference in color depth between PCI and GSC cards.

> HP-UX seems to find a whole lot of differences and such ... and I did run 
> GNOME/HP-UX once on a VIS-EG/PCI without running out of colors but then 
> again HP-UX does color recovery and acceleration and all that on those...

I guess the HP-UX Xserver uses the second color map and color recovery.
I've looked a little bit how to use the second color map and I haven't
found a simple to way to add support to XFree for it. It's a nice way
to have 256 color for the desktop and 256 independant colors for the
application with focus. Maybe some XFree86 guru could give me a hint how
to implement it.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessary a
good idea.                                 [ Alexander Viro on linux-kernel ]
