Received: from www.linux.org.uk (IDENT:root@parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id DAA23468
	for <parisc-linux@puffin.external.hp.com>; Tue, 14 Nov 2000 03:27:47 -0700
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 13vdLM-0000fQ-00; Tue, 14 Nov 2000 10:29:36 +0000
Date: Tue, 14 Nov 2000 10:29:36 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: bame@riverrock.org
Cc: parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] kernel merge
Message-ID: <20001114102936.A2062@parcelfarce.linux.theplanet.co.uk>
References: <E13twjn-0004fw-00@noam.fc.hp.com> <m13uLiv-001Vp3C@chalet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m13uLiv-001Vp3C@chalet>; from bame@riverrock.org on Fri, Nov 10, 2000 at 02:28:33PM -0700
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Nov 10, 2000 at 02:28:33PM -0700, bame@riverrock.org wrote:
> fcntl.h acquired a 'struct fcntl64' used with 64-bit offsets, implementing
> fcntl(fd, F_S/GETLK[W]64, ...).  Several other locking-related #defines added.
> 
> We'll need to add the getdents64() and fcntl64() syscall glue. (TODO!!!)

actually, we don't.  Linux/PA-RISC has sufficiently wide data types
already so we don't have the grot required in other ports to support
the appropriate wide data types.

> looks like maybe the get/put_user_ret() functions in asm/uaccess.h are
> obsolete?  (TODO)

yes, they are.  exterminate!  exterminate!

-- 
Revolutions do not require corporate support.
