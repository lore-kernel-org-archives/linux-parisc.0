Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id D600F482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  5 Sep 2002 07:30:16 -0600 (MDT)
Date: Thu, 5 Sep 2002 15:30:13 +0200
Message-ID: <3D53B3B70000BC9B@ocpmta1.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
Cc: willy@debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] upgrade evms-1.1.0 -> Kernel bug at blkpg.c (need help)
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

Hi Willy,

Do you remember this.

> On Wed, Aug 21, 2002 at 05:14:28PM +0200, jsoe0708@tiscali.be wrote:
> > After this upgarde, all evms tools failled and I got folowing kernel
message
> > at the console:
> > kernel BUG at blkpg.c:252!                                       
> > evms: ldev_mgr: error(-28): creating logical disk for device(8,0).  
   
> > 
> > at line 250 of /drivers/block/blkpg.c I read:
> > ...
> >    return put_user(uulval << 9, (u64 *)arg);
> > ...
>
> Aw, crap.  It now seems to be `legal' to put_user a 64-bit argument on
a
> 32-bit system.  Someone needs to fix this in include/asm-parisc/uaccess.h

May I suggest a trivial sol:
in put_user, case 8 uses something like as:
__put_user_asm("stw",(unsigned int)(x >> 32), (unsigned int) ptr);__put_user_asm("stw",(unsigned
int) x, (unsigned int) (ptr+1) );

or is it in the contrary order (I am not familiar with SE and BE conversion)

Thanks for attention,
    Joel



Big Brother Anders  - With Tiscali you will see it all !  Check it up on
 www.tiscali.be/bigbrother
