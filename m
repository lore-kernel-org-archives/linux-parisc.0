Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id F162E482A
	for <parisc-linux@parisc-linux.org>; Thu, 16 Aug 2001 23:55:09 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15Xcb5-00072o-00; Fri, 17 Aug 2001 06:55:07 +0100
Date: Fri, 17 Aug 2001 06:55:07 +0100
From: Matthew Wilcox <willy@debian.org>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4.9 merge
Message-ID: <20010817065507.I25133@parcelfarce.linux.theplanet.co.uk>
References: <20010817013014.H25133@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010817013014.H25133@parcelfarce.linux.theplanet.co.uk>; from willy@debian.org on Fri, Aug 17, 2001 at 01:30:14AM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Aug 17, 2001 at 01:30:14AM +0100, Matthew Wilcox wrote:
> 
> A few conflicts:

Conflicts resolved...

2.4.9 adds the new kbd_rate method.  Currently this is defined as a
dummy op.  If you want to define it in your keyboard driver, go ahead.
I have 2.4.9-pa1 compiled; if it boots, I will commit it.

-- 
Revolutions do not require corporate support.
