Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7E2E5482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 15:38:35 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14vnHN-0007CO-00; Fri, 04 May 2001 22:38:25 +0100
Date: Fri, 4 May 2001 22:38:25 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <matthew@wil.cx>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
Message-ID: <20010504223825.J32445@parcelfarce.linux.theplanet.co.uk>
References: <20010504220214.I32445@parcelfarce.linux.theplanet.co.uk> <200105042131.RAA15852@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200105042131.RAA15852@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Fri, May 04, 2001 at 05:31:30PM -0400
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, May 04, 2001 at 05:31:30PM -0400, John David Anglin wrote:
> Doesn't look like _setjmp comes back at all.  Put a break on ea18
> and start stepping.  It might help to do a static link.

this code is in the dynamic linker :-))

-- 
Revolutions do not require corporate support.
