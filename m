Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58B36482A
	for <parisc-linux@parisc-linux.org>; Mon, 23 Apr 2001 14:37:36 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14rn5K-00022C-00; Mon, 23 Apr 2001 21:37:26 +0100
Date: Mon, 23 Apr 2001 21:37:26 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] gcc -print-file-name=cpp
Message-ID: <20010423213726.H18464@parcelfarce.linux.theplanet.co.uk>
References: <20010423210120.F18464@parcelfarce.linux.theplanet.co.uk> <200104232022.QAA22918@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200104232022.QAA22918@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Mon, Apr 23, 2001 at 04:22:46PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Apr 23, 2001 at 04:22:46PM -0400, John David Anglin wrote:
> Try `gcc -print-search-dirs' and see if for some strange reason /lib isn't
> in the library search path.

/lib is indeed in the library search path, although not the programs.

-- 
Revolutions do not require corporate support.
