Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56E644A19
	for <parisc-linux@parisc-linux.org>; Tue, 13 Feb 2001 14:32:53 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14Sn3v-0007jf-00; Tue, 13 Feb 2001 21:32:39 +0000
Date: Tue, 13 Feb 2001 21:32:39 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Helge Deller <deller@gmx.de>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] small STI patch
Message-ID: <20010213213239.E7969@parcelfarce.linux.theplanet.co.uk>
References: <01021322170500.01835@P100.helgenet.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01021322170500.01835@P100.helgenet.de>; from deller@gmx.de on Tue, Feb 13, 2001 at 10:17:05PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Feb 13, 2001 at 10:17:05PM +0100, Helge Deller wrote:
> I've just committed a small patch, which saves us to copy a whole struct from 
> the STI ROM just to get one value (the ROM size) out of it.

But we leak a kmalloc'd buffer.  you need to remove the prior kmalloc
assigned to raw.

-- 
Revolutions do not require corporate support.
