Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0E16A482A
	for <parisc-linux@lists.parisc-linux.org>; Sun, 21 Oct 2001 01:57:16 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15vDTu-00071r-00
	for parisc-linux@lists.parisc-linux.org; Sun, 21 Oct 2001 08:57:14 +0100
Date: Sun, 21 Oct 2001 08:57:14 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20011021085714.E31505@parcelfarce.linux.theplanet.co.uk>
References: <200110210249.UAA22545@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110210249.UAA22545@puffin.external.hp.com>; from tausq@puffin.external.hp.com on Sat, Oct 20, 2001 at 08:49:40PM -0600
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux tausq
List-ID: <linux-parisc.vger.kernel.org>

On Sat, Oct 20, 2001 at 08:49:40PM -0600, Randolph Chung wrote:
> - adds support for /dev/perf (major 10, minor 146)
> supports the same ioctls and write formats as the hpux equiv
> TLB patching code is not yet done
> only enabled for 64-bit kernels

umm..

                146 = /dev/graphics     Linux/SGI graphics device

could you try getting a minor number assigned by lanana.org pleases?

-- 
Revolutions do not require corporate support.
