Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from guinness.internal.neep.com.au (unknown [203.13.164.118])
	by dsl2.external.hp.com (Postfix) with ESMTP id 616854829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 05:13:50 -0700 (MST)
Received: (from andrew@localhost)
	by guinness.internal.neep.com.au (8.9.3/8.9.3/Debian/GNU) id UAA24924
	for parisc-linux@lists.parisc-linux.org; Fri, 8 Nov 2002 20:13:36 +0800
Date: Fri, 8 Nov 2002 20:12:05 +0800
From: Andrew Shugg <andrew@neep.com.au>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [Trap 26 -> EXT3?][If you feel bored, test these 2.5 changes...]
Message-ID: <20021108201200.K28523@neep.com.au>
References: <20021107135222.GD4465@systemhalted> <3DA3DE6600004657@ocpmta4.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DA3DE6600004657@ocpmta4.be.tiscali.com>; from jsoe0708@tiscali.be on Thu, Nov 07, 2002 at 04:39:33PM +0100
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

jsoe0708@tiscali.be said:
> Back to 2.5.46-pa1, I revert the patch and rebuild the kernel and the kernel
> won't boot more. So it seems that problem comes from ext3 usage.
> How may I come back to ext2 (tune2fs -O ^has_journal /dev/md0 [my boot partition]
> ) I nerver do it and a bit affraid to loose my system :(
> 
> Joel

It should be as simple as changing your root fs type from 'ext3' or
'auto' to 'ext2' in /etc/fstab.

Andrew.

-- 
Andrew Shugg <andrew@neep.com.au>                   http://www.neep.com.au/

"Just remember, Mr Fawlty, there's always someone worse off than yourself."
"Is there?  Well I'd like to meet him.  I could do with a good laugh."
