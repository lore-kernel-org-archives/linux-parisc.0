Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9B36482C
	for <parisc-linux@lists.parisc-linux.org>; Sat, 13 Oct 2001 08:59:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15sQFj-0007o9-00; Sat, 13 Oct 2001 15:59:03 +0100
Date: Sat, 13 Oct 2001 15:59:03 +0100
From: Matthew Wilcox <willy@debian.org>
To: Helge Deller <deller@gmx.de>
Cc: Albert Strasheim <fullung@ilink.nis.za>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] disks not recognized by new 53c700/53c710 driver (was [parisc-linux-cvs] linux rhirst)
Message-ID: <20011013155903.A22395@parcelfarce.linux.theplanet.co.uk>
References: <20011013162103.A3604@dogbert.localdomain> <20011013162718.B3604@dogbert.localdomain> <20011013144307.02B16482B@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011013144307.02B16482B@dsl2.external.hp.com>; from deller@gmx.de on Sat, Oct 13, 2001 at 04:42:27PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 13, 2001 at 04:42:27PM +0200, Helge Deller wrote:
> You should prefer "make menuconfig". That way you won't
> miss such things.

Um?  make oldconfig only prompts you for new options.  it's harder to
miss things with oldconfig than menuconfig, IMO.

-- 
Revolutions do not require corporate support.
