Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3BC17482A
	for <parisc-linux@parisc-linux.org>; Fri,  4 May 2001 14:18:52 -0600 (MDT)
Message-Id: <200105042018.QAA06091@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] glibc 2.2.3: setjmp/longjmp
To: matthew@wil.cx (Matthew Wilcox)
Date: Fri, 4 May 2001 16:18:42 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20010504210518.G32445@parcelfarce.linux.theplanet.co.uk> from "Matthew Wilcox" at May 4, 2001 09:05:18 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

> i think i've traced the problem down to setjmp/longjmp not working.

My first guess would be the pic offset table register is not being
restored in longjmps into PIC code.  This must be done either in the
receiver or just before the longjmp.  Of course, the longjmp can come
from non-PIC code.  I am just about to submit a patch to fix a similar
problem with gcc's builtin_setjmp/longjmp on the PA for the 3.0 branch.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6605)
