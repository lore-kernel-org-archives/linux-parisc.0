Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc2-hems4-0-cust95.bre.cable.ntl.com [213.107.176.95])
	by dsl2.external.hp.com (Postfix) with ESMTP id 329CE482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 19 Jul 2001 16:09:50 -0600 (MDT)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id A951FB00C; Thu, 19 Jul 2001 23:07:37 +0100 (BST)
Date: Thu, 19 Jul 2001 23:07:37 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: "Laubrock, Ulrich" <Ulrich.Laubrock@t-systems.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Problems with Release 0.9 for PA-RISC
Message-ID: <20010719230737.U30356@linuxcare.com>
References: <Ulrich.Laubrock@t-systems.de> <200107182135.PAA08428@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200107182135.PAA08428@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Wed, Jul 18, 2001 at 03:35:58PM -0600
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Jul 18, 2001 at 03:35:58PM -0600, Grant Grundler wrote:
> > Is there a tool for administration the system after reboot the installation
> >  like "dbootstrap" ?
> 
> Sorry - I don't know dbootstrap.

dbootstrap is part of boot-floppies, it is the program that you
interact with for the first stage of the install.  You can't rerun
that.

After the first reboot, for second stage install, base-config is
running.  You can run that again (/sbin/base-config), if you want
to.  If you are running a serial console, you might find base-config
has been removed, in which case apt-get install base-config.

You can dpkg-reconfigure <pkgname> if there is a particular
pkg you want to reconfigure.

Richard
