Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1AD68482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 02:47:41 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 7DCD6B00C; Wed, 11 Jul 2001 09:46:24 +0100 (BST)
Date: Wed, 11 Jul 2001 09:46:24 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Charles Boone <ccboone@yahoo.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problem installing .9 iso image on C240
Message-ID: <20010711094624.F18375@linuxcare.com>
References: <ccboone@yahoo.com> <200107110545.XAA31374@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107110545.XAA31374@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Tue, Jul 10, 2001 at 11:45:15PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Jul 10, 2001 at 11:45:15PM -0600, Grant Grundler wrote:
> Charles Boone wrote:
> ...
> > I do have one question, why
> > would it not try to install the 64bit version? I was
> > pretty sure that a C240 is a 64bit system.
> 
> PDC on the C240 (and similar C-models of that generation) only
> support PDC calls in "narrow" (ie 32-bit) mode. Sounds like the decision
> to install 32 vs 64-bit depends on the PDC capabilities bit.
> Can anyone offhand confirm/deny?

Hmm, our installer installs either a 32 bit kernel or a 64 bit one
which does wide PDC calls.  So, I guess we will always install a
32 bit kernel on Cxx.  Installing a 64 bit kernel with narrow PDC
calls later would be an option (once it works).  Do we leave building
that kernel as an exercise for the user, or or do we have one packaged
in the archive?

Richard
