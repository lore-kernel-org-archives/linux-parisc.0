Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 745214895
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 07:41:22 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15o3Jx-0000ex-00; Mon, 01 Oct 2001 14:41:21 +0100
Date: Mon, 1 Oct 2001 14:41:21 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: 'Matthew Wilcox' <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Status of hp-ux binary compatibility?
Message-ID: <20011001144121.G28828@parcelfarce.linux.theplanet.co.uk>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F8@umr-mail03.cc.umr.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F8@umr-mail03.cc.umr.edu>; from nneul@umr.edu on Mon, Oct 01, 2001 at 08:31:07AM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 01, 2001 at 08:31:07AM -0500, Neulinger, Nathan wrote:
> But for testing, I've just tried very simple programs - cal, yes, echo, and
> a staticly linked hello world. All of them segfault right after execution. 

It'd be useful to know what address they segfault at.  My current
suspicion is the stack position changes have broken it, but it may be
something completely different.

-- 
Revolutions do not require corporate support.
