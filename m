Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CDBDF482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 22 Oct 2001 07:39:45 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15vfIt-0004Ko-00; Mon, 22 Oct 2001 14:39:43 +0100
Date: Mon, 22 Oct 2001 14:39:43 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Brian S. Julin" <bri@mojo.calyx.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] upgrade
Message-ID: <20011022143943.A15967@parcelfarce.linux.theplanet.co.uk>
References: <Pine.BSO.4.33.0110220918010.26163-100000@mojo.calyx.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSO.4.33.0110220918010.26163-100000@mojo.calyx.net>; from bri@mojo.calyx.net on Mon, Oct 22, 2001 at 09:20:04AM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 22, 2001 at 09:20:04AM -0400, Brian S. Julin wrote:
> Haven't touched my PA-RISC box in 6 months or so... should I
> expect a smooth upgrade with APT and a CVS update of the kernel,
> or should I wait for something (what?) before attempting it --
> or am I hopelessly crusty and I should plan for a full re-install?

Should work well.  You should upgrade your kernel before you upgrade
glibc, but aprt from that I can't think of any other problems.  Beware
that the current CVS kernel is probably broken for just about everyone
except rbrad :-)

-- 
Revolutions do not require corporate support.
