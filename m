Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B10A7482A
	for <parisc-linux@parisc-linux.org>; Sun, 25 Mar 2001 16:44:54 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14hKBc-0002E1-00; Mon, 26 Mar 2001 00:44:40 +0100
Date: Mon, 26 Mar 2001 00:44:40 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: Alan Modra <alan@linuxcare.com.au>,
	Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building packages, problems with printf
Message-ID: <20010326004440.O31126@parcelfarce.linux.theplanet.co.uk>
References: <Pine.LNX.4.21.0103260855260.3568-100000@front.linuxcare.com.au> <E14hK9p-0000hh-00@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14hK9p-0000hh-00@the-village.bc.nu>; from alan@lxorguk.ukuu.org.uk on Mon, Mar 26, 2001 at 12:42:46AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Mar 26, 2001 at 12:42:46AM +0100, Alan Cox wrote:
> > Earn brownie points sending off proper fixes to package maintainers. :)
> 
> Most package maintainers wont bother. printf as a macro breaks too much code
> to be 'interesting' to fix. Many people take the address of printf for 
> passing to functions using multiple I/O output methods

you can still do that.  it's still an external function, but for
`optimisation' purposes calls to it go to fprintf.  i think this is a
worthless optimisation myself.

perhaps you can convince drepper of this?  :-)

-- 
Revolutions do not require corporate support.
