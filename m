Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D217E48C5
	for <parisc-linux@lists.parisc-linux.org>; Mon,  8 Oct 2001 19:33:44 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15qllz-0002lL-00; Tue, 09 Oct 2001 02:33:31 +0100
Date: Tue, 9 Oct 2001 02:33:31 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] bad loopback error msg
Message-ID: <20011009023331.D25819@parcelfarce.linux.theplanet.co.uk>
References: <200110090020.SAA01264@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110090020.SAA01264@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Oct 08, 2001 at 06:20:15PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Oct 08, 2001 at 06:20:15PM -0600, Grant Grundler wrote:
> This B180 is up-to-date but still running 2.4.0-32 vmlinux
> (original kernels from 0.9.2 I think).

Um, I think that's fatal.  You should upgrade the kernel before upgrading
glibc, or you may run into problems.

-- 
Revolutions do not require corporate support.
