Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 811C5482A
	for <parisc-linux@parisc-linux.org>; Wed, 11 Apr 2001 16:51:08 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14nTS4-00058h-00; Wed, 11 Apr 2001 23:51:04 +0100
Date: Wed, 11 Apr 2001 23:51:04 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Jes Sorensen <jes@linuxcare.com>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] FB cleanups
Message-ID: <20010411235104.A19570@parcelfarce.linux.theplanet.co.uk>
References: <20010411211337.C26010@parcelfarce.linux.theplanet.co.uk> <d366gbrxgu.fsf@lxplus015.cern.ch> <20010411213458.D26010@parcelfarce.linux.theplanet.co.uk> <d31yqzrwtz.fsf@lxplus015.cern.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <d31yqzrwtz.fsf@lxplus015.cern.ch>; from jes@linuxcare.com on Wed, Apr 11, 2001 at 10:43:52PM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Apr 11, 2001 at 10:43:52PM +0200, Jes Sorensen wrote:
> Point is that readb/writeb are *only* defined for PCI and PCI
> look-alike devices, even for ISA you're supposed to use
> isa_readb/isa_writeb

No, you're wrong.  isa_* are due to go away in 2.5.  After you've
called ioremap(), you can call readb/writeb on the returned address.
You might want to refer to Documentation/IO-mapping.txt and/or
Documentation/DocBook/deviceiobook.* (only in Alan's tree right now).

-- 
Revolutions do not require corporate support.
