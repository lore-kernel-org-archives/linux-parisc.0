Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 98A78483A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 Aug 2002 15:15:10 -0600 (MDT)
Date: Thu, 22 Aug 2002 10:25:29 +0200
Message-ID: <3D3816EF000058D4@ocpmta4.be.tiscali.com>
In-Reply-To: <20020821162256.G29958@parcelfarce.linux.theplanet.co.uk>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] upgrade evms-1.1.0 -> Kernel at blkpg.c (need help)
To: "Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

>
>
>On Wed, Aug 21, 2002 at 05:14:28PM +0200, jsoe0708@tiscali.be wrote:
>> After this upgarde, all evms tools failled and I got folowing kernel message
>> at the console:
>> kernel BUG at blkpg.c:252!                                       
>> evms: ldev_mgr: error(-28): creating logical disk for device(8,0).   

> 
>> 
>> at line 250 of /drivers/block/blkpg.c I read:
>> ...
>>    return put_user(uulval << 9, (u64 *)arg);
>> ...
>
>Aw, crap.  It now seems to be `legal' to put_user a 64-bit argument on a
>32-bit system.  Someone needs to fix this in include/asm-parisc/uaccess.h
>
Thanks willy,

I have a look but definitely asm is not for me (sorry).
I will so wait the fix.

Joel
