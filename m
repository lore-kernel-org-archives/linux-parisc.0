Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id A8E5C48B4
	for <parisc-linux@lists.parisc-linux.org>; Tue, 16 Jul 2002 09:14:41 -0600 (MDT)
Received: from unknown (HELO pippin.tausq.org) ([64.81.244.94]) (envelope-sender <randolph@tausq.org>)
          by mail14.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <parisc-linux@lists.parisc-linux.org>; 16 Jul 2002 15:14:39 -0000
Date: Tue, 16 Jul 2002 08:17:37 -0700
From: Randolph Chung <randolph@tausq.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.19 merge
Message-ID: <20020716151737.GD641@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020714091619.B1E35483A@dsl2.external.hp.com> <20020715142028.J27706@parcelfarce.linux.theplanet.co.uk> <1026743879.30202.5.camel@irongate.swansea.linux.org.uk> <20020715230306.93501485E@dsl2.external.hp.com> <1026779010.31925.44.camel@irongate.swansea.linux.org.uk> <3D335B27.3060808@neuronet.pitt.edu> <1026815479.1688.18.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1026815479.1688.18.camel@irongate.swansea.linux.org.uk>
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

> Thats the easy 90%. The stuff which doesn't overlap other platforms is
> in there so I have a tree that I can point people back to if we get
> breakage from later merges.

Alan, fwiw I'm playing with some arch-specific things that got missed in
the merge so that we can at least get a basic image that builds. Are 
you doing the same, or should we try to get something that will build
and feed that back to you? In any case I have some questions about some
pieces that I'll post here RSN.

> Some of it like the PCI changes is going to be hard.

What's the best way to proceed on this? I can try to merge Grant's
changes into the tree I'm working on and submit a working set (they
don't apply very cleanly directly on the rc1-ac5 tree)

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
