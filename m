Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id A3141482B
	for <parisc-linux@lists.parisc-linux.org>; Sun, 18 Aug 2002 12:53:54 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g7IIrIu6017202;
	Sun, 18 Aug 2002 19:53:19 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g7IIrHgB017200;
	Sun, 18 Aug 2002 19:53:17 +0100
Subject: Re: [parisc-linux] Voodoo3 PCI on C200 experiment pending!
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: weasel@cs.stanford.edu
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <m2wuqoqfa0.fsf@meer.net>
References: <3D5E0430.2000407@charter.net>
	<20020818044613.0969E4829@dsl2.external.hp.com>
	<1029666136.15858.3.camel@irongate.swansea.linux.org.uk>
	<m2wuqoqfa0.fsf@meer.net>
Content-Type: text/plain
Date: 18 Aug 2002 19:53:17 +0100
Message-Id: <1029696797.16822.12.camel@irongate.swansea.linux.org.uk>
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

On Sun, 2002-08-18 at 17:53, d p chang wrote:
> yup, no 2d on voodoo2, but sort of lame just as a framebuffer device
> (well, if you want to use the command transport bits)

XFree86 supports it nicely as a 2D card nowdays. True its not exactly
accelerated but it works. I use a couple for debugging displays
