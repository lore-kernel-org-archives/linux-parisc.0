Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (webmail2.tiscali.be [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id C440C486C
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 11:16:03 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 17T41T-0007kB-00
	for <parisc-linux@parisc-linux.org>; Fri, 12 Jul 2002 19:16:03 +0200
To: parisc-linux@parisc-linux.org
Message-ID: <1026494163.3d2f0ed30891a@webmail.tiscalinet.be>
Date: Fri, 12 Jul 2002 19:16:03 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] pa54  process in D stat problem
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

On my b2000 with kernel pa44 I build tool chain without problem.

I upgrade this kernel to pa54 (in holliday for some days I could not do it step
by step).

Now when I try to rebuild toolchain it takes a long time and I notice (with top
and gkrellm) that some process went to D stat (uninterruptible sleep)during long
time (some time seems for ever: some find of updatedb).

Am I alone? What could I do?

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
