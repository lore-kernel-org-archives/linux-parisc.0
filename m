Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CBFB2482A
	for <parisc-linux@lists.parisc-linux.org>; Mon,  2 Jul 2001 13:12:14 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15H976-0000Us-00; Mon, 02 Jul 2001 20:12:04 +0100
Date: Mon, 2 Jul 2001 20:12:04 +0100
From: Matthew Wilcox <willy@debian.org>
To: Al Budriunas <budriuna@cacr.caltech.edu>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] telnetd binary
Message-ID: <20010702201204.D15311@parcelfarce.linux.theplanet.co.uk>
References: <Pine.SOL.4.10.10107021131370.13925-100000@lugh.cacr.caltech.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.SOL.4.10.10107021131370.13925-100000@lugh.cacr.caltech.edu>; from budriuna@cacr.caltech.edu on Mon, Jul 02, 2001 at 11:38:39AM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Jul 02, 2001 at 11:38:39AM -0700, Al Budriunas wrote:
> 
> telnetd and ftpd were not included with the June 1 ISO image. The only
> telnetd and ftpd I did find on the Debian site is for i386.  
> 
> Is there a PARISC depot somewhere?

`apt-get install telnetd' will work if you've added the appropriate
lines to your /etc/apt/sources.list file; something like

deb http://ftp.us.debian.org/debian unstable main non-free contrib

should work.

-- 
Revolutions do not require corporate support.
