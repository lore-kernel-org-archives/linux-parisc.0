Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8B6CD4832
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Mar 2002 07:35:48 -0700 (MST)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 16l9rs-0001M6-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Mar 2002 15:36:40 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1016030200.3c8f63f89a0ff@webmail.tiscali.be>
Date: Wed, 13 Mar 2002 15:36:40 +0100 (CET)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] evms-0.9.2 build utilities problem
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

The original way to build some evms utilities as evms_devnode_fixup is:

...
gcc -Wall -fPIC -O2 -I/tools/evms-dpkg/evms-0.9.2/engine/include
-I/tools/evms-dpkg/evms-0.9.2/engine/dlist
-I/tools/evms-dpkg/evms-0.9.2/kernel-headers/include -I/usr/include
-I/usr/local/include -DPluginDirectory=\"/lib/evms\" -DEVMS_DEBUG -DPARANOID
-DMAJOR_VERSION=1 -DMINOR_VERSION=0 -DPATCH_LEVEL=0 -DVERSION=\"1.0.0\"
-DDATE=\"03/13/02\" -c -o evms_devnode_fixup.o evms_devnode_fixup.c
...
gcc -L/tools/evms-dpkg/evms-0.9.2/engine/Engine
-L/tools/evms-dpkg/evms-0.9.2/engine/dlist  -static -o evms_devnode_fixup
evms_devnode_fixup.o -levms -ldlist -lpthread -ldl

...
Well launch it made an immidiate Segmentation fault.

Now I recompile without "-fPIC" and it works fine.

Any idea on what is wrong?

Thanks in advance for help,
    Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
