Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A7A8F482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 14:01:36 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14rmWO-0001LC-00; Mon, 23 Apr 2001 21:01:20 +0100
Date: Mon, 23 Apr 2001 21:01:20 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc -print-file-name=cpp
Message-ID: <20010423210120.F18464@parcelfarce.linux.theplanet.co.uk>
References: <20010423195239.D18464@parcelfarce.linux.theplanet.co.uk> <200104231904.PAA20313@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200104231904.PAA20313@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Mon, Apr 23, 2001 at 03:04:10PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 23, 2001 at 03:04:10PM -0400, John David Anglin wrote:
> Is there a library file with the name `cpp' on your system?

There's /lib/cpp and /usr/bin/cpp which are both symlinks to
/usr/bin/cpp-3.0.  There's also /usr/lib/gcc-lib/hppa-linux/3.0/tradcpp0
and /usr/lib/gcc-lib/hppa-linux/3.0/cpp0, neither of which are links
to anything.

-- 
Revolutions do not require corporate support.
