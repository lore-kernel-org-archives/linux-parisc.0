Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.yashy.com (cpu2119.adsl.bellglobal.com [207.236.3.96])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9F129482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 10 Feb 2002 19:44:03 -0700 (MST)
Received: from yashy (helo=localhost)
	by mail.yashy.com with local-esmtp (Exim 3.33 #1)
	id 16a6SP-000CiF-00
	for parisc-linux@lists.parisc-linux.org; Sun, 10 Feb 2002 21:44:41 -0500
Date: Sun, 10 Feb 2002 21:44:41 -0500 (EST)
From: Yasholomew Yashinski <yashy@mail.yashy.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] B1000
In-Reply-To: <20020210235910.O1173@parcelfarce.linux.theplanet.co.uk>
Message-ID: <20020210213653.O48612-100000@mail.yashy.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

> >  I recently purchased an HP 9000/785/B1000. I tried to use the
> > pasrisc*.iso as I've been using on my 712/*'s, however there appears to be
> > issues using 32-bit as default. Setting up a serial console for this
> > machine will not be a trivial task, due to its location. Is there anyone
>
> Hmm.. this machine should work in both 32 and 64 bit mode.  I suspect
> we don't currently support the graphics card in this machine (I assume
> it has the same problems as the C3000... helge?)

 It appears so. The framebuffer is A4977a Vis EG-PCI.

 If it helps, the errors I receive on the front panel LCD are:
FLT CBF4: SYS BD
bad OS HPMC cksm
FLT CBFC: SYS BD
OS HPMC br err
FLT 500B: SYS BD
bus timeout

> > on the list that has such a beast, I could discuss installation with?
> >  My next attempt will be to setup an install using rbootd, however it
> > appears I will require serial console access.
>
> rbootd is for much older machines (715/Scorpio and earlier).  Everything
> since the 712 uses bootp (or dhcp) and tftp.

 Thanks. It appears I should wait until my framebuffer is supported.

 Cheers,

--
Yashy
