Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id 58F664829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 21 Aug 2002 09:14:30 -0600 (MDT)
Date: Wed, 21 Aug 2002 17:14:28 +0200
Message-ID: <3D3816EF00005526@ocpmta4.be.tiscali.com>
From: jsoe0708@tiscali.be
To: parisc-linux@lists.parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Subject: [parisc-linux] upgrade evms-1.1.0 -> Kernel at blkpg.c (need help)
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

Hi all,

To investigate in more details the 'unalign access' problem I met with evms,
I need first to upgrade to evms-1.1.0 with kernel 2.4.19.

After this upgarde, all evms tools failled and I got folowing kernel message
at the console:
kernel BUG at blkpg.c:252!                                       
evms: ldev_mgr: error(-28): creating logical disk for device(8,0).      
      

at line 250 of /drivers/block/blkpg.c I read:
...
   return put_user(uulval << 9, (u64 *)arg);
...

In fact, with message '... at blkpg.c:252!', I am awaiting 'printk(... _FUNCTION_)'.
Also I do not understand where this "BUG" is trapped(?) and which can the
actual source of this new evms problem.

Thanks in advance for all advise,
    Joel

PS: I test it on my i386 without encountering this problem.
