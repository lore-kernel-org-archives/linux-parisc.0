Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id ADF80482A
	for <parisc-linux@lists.parisc-linux.org>; Wed,  4 Apr 2001 11:05:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14kqic-0007P6-00; Wed, 04 Apr 2001 18:05:18 +0100
Date: Wed, 4 Apr 2001 18:05:18 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Christoph Plattner <christoph.plattner@alcatel.at>
Cc: Matthew Wilcox <matthew@wil.cx>,
	Richard Hirst <rhirst@linuxcare.com>,
	Christoph Plattner <christoph.plattner@dot.at>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] New kernel on 720 + Pa-Linux-0.5: Breakpoint ?
Message-ID: <20010404180518.C11435@parcelfarce.linux.theplanet.co.uk>
References: <3AC90274.4687ED7C@dot.at> <20010403001743.G9198@linuxcare.com> <3AC973D3.F1453A4C@alcatel.at> <20010403223441.A11435@parcelfarce.linux.theplanet.co.uk> <3ACAC867.25327463@alcatel.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3ACAC867.25327463@alcatel.at>; from christoph.plattner@alcatel.at on Wed, Apr 04, 2001 at 09:08:23AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 04, 2001 at 09:08:23AM +0200, Christoph Plattner wrote:
> > have you looked at all the followups to the esiee announcement noting
> > the problems with it?  i suspect it's switching to STI console.
> 
> Although I definitely write
> 
> 	console=ttyS0
> 
> as kernel parameter ?

yes.  they symlinked /dev/console to tty0 instead of leaving it as a
char device.  the kernel can't help you out here, you have to change
that symlink :-(

-- 
Revolutions do not require corporate support.
