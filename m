Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA13877
	for <parisc-linux@puffin.external.hp.com>; Mon, 29 May 2000 19:59:46 -0600
Received: from milano.cup.hp.com (milano.cup.hp.com [15.8.80.76])
	by palrel1.hp.com (Postfix) with ESMTP id BC8119BF
	for <parisc-linux@thepuffingroup.com>; Mon, 29 May 2000 19:00:10 -0700 (PDT)
Received: (from grundler@localhost) by milano.cup.hp.com (8.8.6 (PHNE_17190)/8.7.3 TIS 5.0.1) id TAA11206 for parisc-linux@thepuffingroup.com; Mon, 29 May 2000 19:01:07 -0700 (PDT)
Date: Mon, 29 May 2000 19:01:07 -0700 (PDT)
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <200005300201.TAA11206@milano.cup.hp.com>
To: parisc-linux@thepuffingroup.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] CONFIG_SYSCTL is not set
List-ID: <linux-parisc.vger.kernel.org>

Hi folks,

By default, CONFIG_SYSCTL is not set.
And I get the following errors when linking:

fs/fs.o: In function `nfs_put_inode':
fs/fs.o(.text+0x399dc): undefined reference to `nfs_debug'
fs/fs.o: In function `L1261':
fs/fs.o(.text.init+0x18fc): undefined reference to `nfs_debug'
net/network.a(sunrpc.o): In function `rpc_create_client':
sunrpc.o(.text+0x360): undefined reference to `rpc_debug'

All of these errors are a result of not having globals defined in
net/sunrpc/sysctl.c.  sysctl.o only gets built when CONFIG_SYSCTL=y.


With CONFIG_SYSCTL=y, I get a different linker error
kernel/kernel.o(.data+0x3b4c): undefined reference to `sysrq_enabled'

(which willy already pointed out...See
http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/05-May/0103.html)

This is very reproducible (going back and forth) in my build tree.
I don't see how willy got around it.

Do we want the build to work with or without CONFIG_SYSCTL?


>From the Documentation/Configure.help:
|  As it is generally a good thing, you should say Y here unless
|  building a kernel for install/rescue disks or your system is very  
|  limited in memory.

Philipp Rumpf wrote:
> I wouldn't really consider this a bug, but if anyone does he should 
> probably report it to whoever is working on that code in 2.3. 

If anyone wants to build x86 install/rescue disks, I think they can't now.
Either the Configure.help is wrong or the code is wrong.
I don't know how to submit a BUG.
Any pointers on where this bug should go?

thanks,
grant
