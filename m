Return-Path: <alan@lxorguk.ukuu.org.uk>
Received: from dhcp23.swansea.linux.org.uk
	(cpc1-cwma1-5-0-cust4.swan.cable.ntl.com [80.5.120.4])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB6D94856
	for <parisc-linux@lists.parisc-linux.org>;
	Mon, 16 Feb 2004 09:56:31 -0700 (MST)
Received: from dhcp23.swansea.linux.org.uk (localhost.localdomain [127.0.0.1])
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10) with ESMTP id
	i1GGr20r027719; Mon, 16 Feb 2004 16:53:04 GMT
Received: (from alan@localhost)
	by dhcp23.swansea.linux.org.uk (8.12.10/8.12.10/Submit) id
	i1GGr1X7027717; Mon, 16 Feb 2004 16:53:01 GMT
Subject: Re: [parisc-linux] C3000 video options
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Helge Deller <deller@gmx.de>
In-Reply-To: <200402152125.52428.deller@gmx.de>
References: <Pine.GSO.4.44.0402142137500.12861-100000@keymaster>
	<200402151027.59161.deller@gmx.de>
	<1076861208.25542.3.camel@dhcp23.swansea.linux.org.uk>
	<200402152125.52428.deller@gmx.de>
Content-Type: text/plain
Message-Id: <1076950376.27323.4.camel@dhcp23.swansea.linux.org.uk>
Mime-Version: 1.0
Date: Mon, 16 Feb 2004 16:52:57 +0000
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sul, 2004-02-15 at 20:25, Helge Deller wrote:
> Maybe I'm wrong, but I thought it would go up to 1024x768@16bpp only
> if you attached two Voodoo2 cards to each other with the optional
> cable ?

The cards have 2 or 4Mb of memory for frame buffer (texture ram is
seperate). There is a hardware 1024 pixel width limit in the engine.

For 2D you need a front buffer (1024x768x16)
For 3D you need front back and depth (1024x768x16x3)

So 1024x768 2D is fine on a single card but 3D needs SLI
