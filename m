Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 56CDA482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 06:32:02 -0600 (MDT)
Received: from www-data by webmail.tiscalinet.be with local (Tiscali)
	id 17XLJB-0007x2-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 14:32:01 +0200
To: parisc-linux@lists.parisc-linux.org
Message-ID: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be>
Date: Wed, 24 Jul 2002 14:32:01 +0200 (CEST)
From: joel.soete@freebel.net
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Subject: [parisc-linux] K-2.5.26-pa0: NCR5380.c ?
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

In NCR5380.c failled to compile because 'io_request_lock' undeclare.

'&io_request_lock' seems to became 'q->queue_lock' (include/linux/nbd.h)(with
request_queue_t *q).
Is it right?

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
