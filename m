Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cdc712-9.cdc.polimi.it (cdc712-9.cdc.polimi.it [131.175.7.49])
	by dsl2.external.hp.com (Postfix) with ESMTP id 626F14829
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Mar 2003 06:14:27 -0700 (MST)
From: alchemist@cdc712-9.cdc.polimi.it
Date: Thu, 27 Mar 2003 14:14:24 +0100
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030327131424.GA251@cdc712-9.cdc.polimi.it>
References: <m18yX9N-00048pC@cdc712-9.cdc.polimi.it>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <m18yX9N-00048pC@cdc712-9.cdc.polimi.it>
Subject: [parisc-linux] bug in fork()
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

 
 Dear sirs,
 
 I keep getting strange crashes in X11R6. Using strace revealed a bug in
 fork(). (machine hangs). Any advice about it ?. I am using 2.4.20-pa32 on a
debian 3.0/testing
