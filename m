Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7C0D74829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Aug 2002 09:22:57 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17hXJw-0002vz-00; Wed, 21 Aug 2002 16:22:56 +0100
Date: Wed, 21 Aug 2002 16:22:56 +0100
From: Matthew Wilcox <willy@debian.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] upgrade evms-1.1.0 -> Kernel at blkpg.c (need help)
Message-ID: <20020821162256.G29958@parcelfarce.linux.theplanet.co.uk>
References: <3D3816EF00005526@ocpmta4.be.tiscali.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D3816EF00005526@ocpmta4.be.tiscali.com>; from jsoe0708@tiscali.be on Wed, Aug 21, 2002 at 05:14:28PM +0200
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

On Wed, Aug 21, 2002 at 05:14:28PM +0200, jsoe0708@tiscali.be wrote:
> After this upgarde, all evms tools failled and I got folowing kernel message
> at the console:
> kernel BUG at blkpg.c:252!                                       
> evms: ldev_mgr: error(-28): creating logical disk for device(8,0).      
> 
> at line 250 of /drivers/block/blkpg.c I read:
> ...
>    return put_user(uulval << 9, (u64 *)arg);
> ...

Aw, crap.  It now seems to be `legal' to put_user a 64-bit argument on a
32-bit system.  Someone needs to fix this in include/asm-parisc/uaccess.h

-- 
Revolutions do not require corporate support.
