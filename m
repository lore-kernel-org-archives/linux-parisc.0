Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B397483A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Aug 2002 14:59:18 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5) with ESMTP id g7MIGv72003410;
	Thu, 22 Aug 2002 19:16:58 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.5/8.12.5/Submit) id g7MIGsvc003408;
	Thu, 22 Aug 2002 19:16:54 +0100
Subject: Re: [parisc-linux] Voodoo2 PCI as XFree86 2D board on HP9000 C200
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "B. Douglas Hilton" <bdhilton@charter.net>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D644497.7090709@charter.net>
References: <3D5E0430.2000407@charter.net>
	<20020818044613.0969E4829@dsl2.external.hp.com>
	<1029666136.15858.3.camel@irongate.swansea.linux.org.uk>
	<3D644497.7090709@charter.net>
Content-Type: text/plain
Date: 22 Aug 2002 19:16:53 +0100
Message-Id: <1030040213.3090.39.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Thu, 2002-08-22 at 02:55, B. Douglas Hilton wrote:
> I used to have a V2 running in Linux several years ago, before
> the Banshee, before the Geforce. It really did kick butt and
> Quake and Quake2 were super nifty with it. I had my own version
> of Mesa compiled with Voodoo2 support and was the envy of my
> Linux buddies :-)

You'll need to rebuild glide2 and get it going on the box first, so that
is actually a good starting point anyway. 

> What do I do, just use the jumper cable to link the
> Visualize-EG to the voodoo2, and start up X? Obviously
> I will need the glide libs, but will I also need /dev/tdfx?
> Can the Voodoo2 tdfx module be compiled for a 2.4.19-pa3 kernel?

You can do that, or you can run dual head

> What about console switching? If X is running on the Voodoo2,
> and I hit Alt-F2, will it switch back to the Visualize-EG like
> it should?

It does on x86 ... There is also sstfb which is a frame buffer/console
text driver for the voodoo1/2. That might need some endianisation. I'm
wondering if a USB card and a voodoo2 can turn even an A180 into a
desktop ;)
