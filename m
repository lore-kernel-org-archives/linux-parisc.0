Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D81A4843
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Aug 2002 04:22:41 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g7IAMJu6015911;
	Sun, 18 Aug 2002 11:22:20 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g7IAMHvT015909;
	Sun, 18 Aug 2002 11:22:17 +0100
Subject: Re: [parisc-linux] Voodoo3 PCI on C200 experiment pending!
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: "B. Douglas Hilton" <bdhilton@charter.net>,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <20020818044613.0969E4829@dsl2.external.hp.com>
References: <3D5E0430.2000407@charter.net>  
	<20020818044613.0969E4829@dsl2.external.hp.com>
Content-Type: text/plain
Date: 18 Aug 2002 11:22:16 +0100
Message-Id: <1029666136.15858.3.camel@irongate.swansea.linux.org.uk>
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

On Sun, 2002-08-18 at 05:46, Grant Grundler wrote:
> "B. Douglas Hilton" wrote:
> > Any hints or tips would be appreciated :-)
> 
> Search the mail archives.
> Once upon a time (2 years ago?), Alan Cox explained his ideas
> on how to make something like this work. He had an A180 in front
> of him at the time...

I really doubt you will get a Voodoo3 to work this way. XFree have lots
of problems with the Voodoo3 INT10 multihead even on x86 - the ROM seems
to do some quite tricky stuff.

On the other hand a Voodoo2 should work wonderfully because its got no
ROM, doesn't appear to be a video card and Glide2 has full source for
bringing the board up.

XFree86 also supports using it as a 2D device, but not currently (alas
8)) DRI and Xv also. 
