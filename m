Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id RAA23248
	for <parisc-linux@puffin.external.hp.com>; Wed, 1 Mar 2000 17:34:56 -0700
Received: from endor.fc.hp.com (endor.fc.hp.com [15.1.49.59])
	by palrel1.hp.com (Postfix) with ESMTP id 36CD842
	for <parisc-linux@thepuffingroup.com>; Wed,  1 Mar 2000 15:35:15 -0800 (PST)
To: parisc-linux@thepuffingroup.com
Date: Wed, 01 Mar 2000 16:35:14 -0700
From: Paul Bame <bame@endor.fc.hp.com>
Message-Id: <E12QIeA-0002KV-00@endor.fc.hp.com>
Subject: [parisc-linux] ELF32 kernel
List-ID: <linux-parisc.vger.kernel.org>


It ain't perfect, but the ELF32 kernel booted with an NFS root, ran
sash and fork/exec-ed hellow.  Networking didn't work well on a busy
LAN booting on a B180, dunno why, but it worked great on a c360.  I
checked in a defconfig per willy's suggestion and all the other changes
are in CVS too on the branch ELF_BRANCH.

There's a problem when I enable CONFIG_PROC_FS where devinet_init()
calls register_sysctl_table() with a ctl_table containing a char*
pointer (for ->procname) containing the value 0x20, which eventually
dies in strlen() at a lower level.  The code in devinet_init *may*
be interacting with the __init/__setup stuff we kludged around for SOM.
Maybe a someone who knows this code can take a look at this?

	-Paul Bame
