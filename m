Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 96ACA482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Oct 2001 11:15:09 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15w4rU-0008HI-00; Tue, 23 Oct 2001 17:57:08 +0100
Date: Tue, 23 Oct 2001 17:57:08 +0100
From: Matthew Wilcox <willy@debian.org>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: "Griffin, Aubrey, BMCIO" <aubreygriffin@att.com>,
	"'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] X window refresh problem
Message-ID: <20011023175708.A9620@parcelfarce.linux.theplanet.co.uk>
References: <5360C45FAB301541AEB3C6A45A6B6A02706831@ocst09.ugd.att.com> <20011023173025.K11105@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011023173025.K11105@linuxcare.com>; from rhirst@linuxcare.com on Tue, Oct 23, 2001 at 05:30:25PM +0100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Tue, Oct 23, 2001 at 05:30:25PM +0100, Richard Hirst wrote:
> I think you are advised to upgrade the rest of your system first, if
> you havn't done so recently (apt-get update; apt-get upgrade).

No, install the new kernel first.  Newer glibcs fix a bug which exposes a
kernel bug, which prevents you ssh'ing in... so upgade the kernel first
nd you'll be fine.

-- 
Revolutions do not require corporate support.
