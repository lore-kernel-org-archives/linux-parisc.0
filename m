Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from front.linuxcare.com.au (linuxcare.com.au [203.29.91.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0D912482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  3 Apr 2001 06:23:09 -0600 (MDT)
Received: from localhost (alan@localhost)
	by front.linuxcare.com.au (8.9.3/8.9.3/Debian 8.9.3-21) with ESMTP id WAA27466;
	Tue, 3 Apr 2001 22:22:42 +1000
Date: Tue, 3 Apr 2001 22:22:42 +1000 (EST)
From: Alan Modra <alan@linuxcare.com.au>
To: Markus Werle <markus@lufmech.rwth-aachen.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] cvs-gcc: howto build a 64-bit version?
In-Reply-To: <3AC9A2B8.DE0DE5A6@lufmech.rwth-aachen.de>
Message-ID: <Pine.LNX.4.21.0104032119230.6476-100000@front.linuxcare.com.au>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
List-ID: <linux-parisc.vger.kernel.org>

On Tue, 3 Apr 2001, Markus Werle wrote:

> problems, but the 64-bit bootstrap
> fails. Any help for creating a 64-bit version of g++ appreciated.

I see you're trying to build for HPUX.  You will probably be better off
tracking sourceware gcc, although I understand you've had some trouble
there too.  :-(  Since we don't have glibc for hppa64-linux, I really
only support --languages=c for the 64 bit compiler at the moment.

Alan
-- 
Linuxcare
