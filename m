Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 057994A19
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Feb 2001 08:39:52 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14SL4k-00029k-00; Mon, 12 Feb 2001 15:39:38 +0000
Date: Mon, 12 Feb 2001 15:39:38 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: penfold@customware.com.au
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] tar, spinlocks and 715 and 720
Message-ID: <20010212153938.A7969@parcelfarce.linux.theplanet.co.uk>
References: <200102110753.SAA15254@customware.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200102110753.SAA15254@customware.com.au>; from penfold@customware.com.au on Sun, Feb 11, 2001 at 06:50:42PM +1100
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Sun, Feb 11, 2001 at 06:50:42PM +1100, penfold@customware.com.au wrote:
> I there was discussion about tar locking up on 715 and the consesus was
> that it was spinlock related and due to an alignment issue.
> 
> Was this fixed?

not entirely, yet.

> Is/Was it a kernel or glibc problem?

glibc.  it's a `pthreads' problem.

-- 
Revolutions do not require corporate support.
