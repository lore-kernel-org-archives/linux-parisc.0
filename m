Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id EE744482A
	for <parisc-linux@parisc-linux.org>; Sun, 25 Mar 2001 16:11:56 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14hJfW-0001jH-00; Mon, 26 Mar 2001 00:11:30 +0100
Date: Mon, 26 Mar 2001 00:11:30 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Alan Modra <alan@linuxcare.com.au>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Building packages, problems with printf
Message-ID: <20010326001130.K31126@parcelfarce.linux.theplanet.co.uk>
References: <20010325220223.G31126@parcelfarce.linux.theplanet.co.uk> <Pine.LNX.4.21.0103260855260.3568-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0103260855260.3568-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Mon, Mar 26, 2001 at 09:03:34AM +1000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Mar 26, 2001 at 09:03:34AM +1000, Alan Modra wrote:
> That's cheating!  The real fix is to turn
> 
> printf (foo_string,
> #if SOMETHING
> abc_param
> #else
> xyz_param
> #endif
> );
> 
> into
> 
> #if SOMETHING
> printf (foo_string, abc_param);
> #else
> printf (foo_string, xyz_param);
> #endif
> 
> Earn brownie points sending off proper fixes to package maintainers. :)

Ah, but that doesn't cure netkit-telnet which is c++ and has a method called
printf which gets royally bollixed by this define.

Agreed that's a better solution though for the cases where it applies.

-- 
Revolutions do not require corporate support.
