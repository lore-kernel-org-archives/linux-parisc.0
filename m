Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 62E9F482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Sep 2001 05:25:44 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15jJ0Y-00056b-00; Tue, 18 Sep 2001 12:25:42 +0100
Date: Tue, 18 Sep 2001 12:25:42 +0100
From: Matthew Wilcox <willy@debian.org>
To: thunder7@xs4all.nl
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] nmap -O -> kernel panic on 712
Message-ID: <20010918122542.V26658@parcelfarce.linux.theplanet.co.uk>
References: <20010917165501.B17483@gollum.intranet.nimag.net> <20010917203312.A6109@middle.of.nowhere> <20010918002427.C17483@gollum.intranet.nimag.net> <20010918073855.A11627@middle.of.nowhere>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010918073855.A11627@middle.of.nowhere>; from thunder7@xs4all.nl on Tue, Sep 18, 2001 at 07:38:55AM +0200
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Sep 18, 2001 at 07:38:55AM +0200, thunder7@xs4all.nl wrote:
> Am I correct in assuming those are all suspects and this is just another
> example of the missing unaligned access trap haunting us?

that's right; this is exactly what andi kleen & davem were talking about
last week.

-- 
Revolutions do not require corporate support.
