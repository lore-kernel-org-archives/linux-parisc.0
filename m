Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.gmx.net (mail.gmx.net [213.165.65.60])
	by dsl2.external.hp.com (Postfix) with SMTP id C8922482B
	for <parisc-linux@parisc-linux.org>; Wed,  1 Jan 2003 17:12:20 -0700 (MST)
From: Helge Deller <deller@gmx.de>
To: parisc-linux@parisc-linux.org
Date: Thu, 2 Jan 2003 01:11:47 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Message-Id: <200301020111.48011.deller@gmx.de>
Subject: [parisc-linux] modules and 2.5.5X
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

kernel module support for the 2.5 kernel on hppa seems broken due to some missing 
support for this architecture in the new modutils and module-init-tools debian packages.

Maybe someone with somewhat more expirience than me with the ELF file format and 
runtime symbol relocation functions could look into this ? 

Thanks,
Helge
