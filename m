Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id C0913488F
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Jul 2002 03:21:03 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6GAVKu6001994;
	Tue, 16 Jul 2002 11:31:21 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6GAVJE7001992;
	Tue, 16 Jul 2002 11:31:19 +0100
Subject: Re: [parisc-linux] 2.4.19 merge
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <3D335B27.3060808@neuronet.pitt.edu>
References: 
	<20020714091619.B1E35483A@dsl2.external.hp.com>	<20020715142028.J27706@parce
	 lfarce.linux.theplanet.co.uk>
	<1026743879.30202.5.camel@irongate.swansea.linux.org.uk>
	<20020715230306.93501485E@dsl2.external.hp.com>
	<1026779010.31925.44.camel@irongate.swansea.linux.org.uk>
	<3D335B27.3060808@neuronet.pitt.edu>
Content-Type: text/plain
Date: 16 Jul 2002 11:31:19 +0100
Message-Id: <1026815479.1688.18.camel@irongate.swansea.linux.org.uk>
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

On Tue, 2002-07-16 at 00:30, Rafael E. Herrera wrote:
> Seems like the merge already begun:
> 
> http://linuxtoday.com/news_story.php3?ltsn=2002-07-15-015-26-NW-KN-DV

Thats the easy 90%. The stuff which doesn't overlap other platforms is
in there so I have a tree that I can point people back to if we get
breakage from later merges.

Some of it like the PCI changes is going to be hard.
