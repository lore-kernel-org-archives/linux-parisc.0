Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7D51482A
	for <parisc-linux@parisc-linux.org>; Sun, 25 Mar 2001 16:46:24 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 14hK0W-00022S-00; Mon, 26 Mar 2001 00:33:12 +0100
Date: Mon, 26 Mar 2001 00:33:12 +0100
From: Matthew Wilcox <matthew@wil.cx>
To: Matthew Wilcox <willy@ldl.fc.hp.com>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Keyboard cleanup
Message-ID: <20010326003312.N31126@parcelfarce.linux.theplanet.co.uk>
References: <E14fxTj-00036B-00@chrysl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E14fxTj-00036B-00@chrysl>; from willy@ldl.fc.hp.com on Wed, Mar 21, 2001 at 10:17:43PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Wed, Mar 21, 2001 at 10:17:43PM -0700, Matthew Wilcox wrote:
> and it seems to be because the array we're initialising is of size 0
> (128 - SC_LIM).  the following patch seems to DTRT, but i would appreciate
> someone who has a (non-HIL) keyboard testing it and confirming it works.

If no-one comes back to me by next weekend and says `no it doesn't work',
i'm going to commit this anyway and be unsympathetic if it has broken.

-- 
Revolutions do not require corporate support.
