Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id NAA12496
	for <parisc-linux@puffin.external.hp.com>; Thu, 21 Dec 2000 13:54:29 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 21 Dec 2000 20:57:30 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 149CmB-0005ie-00; Thu, 21 Dec 2000 20:57:23 +0000
Date: Thu, 21 Dec 2000 20:57:23 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: Richard Hirst <rhirst@linuxcare.com>
Cc: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] parisc64 kernel and ret1 (gr29) setup
Message-ID: <20001221205723.A21472@parcelfarce.linux.theplanet.co.uk>
References: <20001221160006.W2554@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20001221160006.W2554@linuxcare.com>; from rhirst@linuxcare.com on Thu, Dec 21, 2000 at 04:00:06PM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Dec 21, 2000 at 04:00:06PM +0000, Richard Hirst wrote:
> At the moment we set up sp with "ldo TASK_SZ_ALGN+64(%r1),%r30" on syscall
> entry.  For 64 bit presumably we should do something like:
> 
> 	ldo     TASK_SZ_ALGN+80(%r1),%r30
> 	ldo	-16(%r30),%r29
> 
> Which gives 64 bytes for parameter saves, plus 16 bytes for rp+sp, and
> initialises ret1.
> 
> Does that sound right?

does the 64-bit ABI relax the requirement for the stack to be 64-byte aligned?
if not, it should be ldo TASK_SZ_ALIGN+128(%r1), %r30

-- 
Revolutions do not require corporate support.
