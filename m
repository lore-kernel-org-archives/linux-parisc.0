Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0EE7F4853
	for <parisc-linux@lists.parisc-linux.org>; Mon, 15 Jul 2002 06:55:51 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17U5OI-0007VO-00; Mon, 15 Jul 2002 13:55:50 +0100
Date: Mon, 15 Jul 2002 13:55:50 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] STI framebuffer and PINE
Message-ID: <20020715135550.H27706@parcelfarce.linux.theplanet.co.uk>
References: <20020714065104.DF333484C@dsl2.external.hp.com> <20020714081241.GC14636@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020714081241.GC14636@charite.de>; from Ralf.Hildebrandt@charite.de on Sun, Jul 14, 2002 at 10:12:41AM +0200
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

On Sun, Jul 14, 2002 at 10:12:41AM +0200, Ralf Hildebrandt wrote:
> > ./build lnx and ./build slx don't work
> 
> What is this?
> 
> > there is an error in PINE
> 
> Then report it using
> 
> reportbug pine
> 
> > before compiling pine, I did apt-get dist-upgrade
> 
> You compiled pine? I though you used apt-get?!

pine is `special'.  That's in the sense of `retarded'.  the license
doesn't permit redistribution of modified versions, so debian distributes
(in non-free) the source code and patches.  you then build it yourself.

-- 
Revolutions do not require corporate support.
