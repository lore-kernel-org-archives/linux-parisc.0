Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A963848A6
	for <parisc-linux@lists.parisc-linux.org>; Mon,  1 Oct 2001 09:33:54 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15o54r-00030l-00; Mon, 01 Oct 2001 16:33:53 +0100
Date: Mon, 1 Oct 2001 16:33:53 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: 'Matthew Wilcox' <willy@debian.org>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Status of hp-ux binary compatibility?
Message-ID: <20011001163353.K28828@parcelfarce.linux.theplanet.co.uk>
References: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F9@umr-mail03.cc.umr.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D7F9@umr-mail03.cc.umr.edu>; from nneul@umr.edu on Mon, Oct 01, 2001 at 08:35:52AM -0500
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 01, 2001 at 08:35:52AM -0500, Neulinger, Nathan wrote:
> IASQ: 00000725 00000725 IAOQ: c0000007 c000000b
>  IIR: e02025b2    ISR: 00000725  IOR: faf0226c
>  CPU:        0   CR30: 2734c000 CR31: 10388000
>  ORIG_R28: 000b8950

Interesting.  It's trying to execute code in userspace at 0xc000'0000 and
up.  This is very strange.  I'll investigate this today.

-- 
Revolutions do not require corporate support.
