Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C26EF482A
	for <parisc-linux@parisc-linux.org>; Tue,  8 May 2001 18:03:00 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14xHRE-0004rQ-00; Wed, 09 May 2001 01:02:44 +0100
Date: Wed, 9 May 2001 01:02:44 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Andi <andi@fischlustig.de>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] framebuffer drivers, sound
Message-ID: <20010509010244.S4917@parcelfarce.linux.theplanet.co.uk>
References: <3AF878EA.3F043FD7@fischlustig.de> <20010509004136.R4917@parcelfarce.linux.theplanet.co.uk> <3AF8888C.A8AB2BC9@fischlustig.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3AF8888C.A8AB2BC9@fischlustig.de>; from andi@fischlustig.de on Wed, May 09, 2001 at 02:00:12AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, May 09, 2001 at 02:00:12AM +0200, Andi wrote:
> Yeah, the STI docs.... HP should release the hardware level
> docs, this is the only way to implement a full featured fbdev
> driver. A stifb would still be usefull since it is works for

yeah, but right now we're all too busy working on important things
(eg SMP, glibc, etc) to spend time looking for or sanitising this
documentation.

-- 
Revolutions do not require corporate support.
