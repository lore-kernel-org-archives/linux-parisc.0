Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from irongate.swansea.linux.org.uk (pc2-cwma1-5-cust12.swa.cable.ntl.com [80.5.121.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 1602B482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 06:42:28 -0600 (MDT)
Received: from irongate.swansea.linux.org.uk (localhost [127.0.0.1])
	by irongate.swansea.linux.org.uk (8.12.2/8.11.6) with ESMTP id g6ODtdu6006753;
	Wed, 24 Jul 2002 14:55:39 +0100
Received: (from alan@localhost)
	by irongate.swansea.linux.org.uk (8.12.2/8.12.2/Submit) id g6ODtZbD006751;
	Wed, 24 Jul 2002 14:55:35 +0100
Subject: Re: [parisc-linux] K-2.5.26-pa0: NCR5380.c ?
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be>
References: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be>
Content-Type: text/plain
Date: 24 Jul 2002 14:55:35 +0100
Message-Id: <1027518935.6517.30.camel@irongate.swansea.linux.org.uk>
Mime-Version: 1.0
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

On Wed, 2002-07-24 at 13:32, joel.soete@freebel.net wrote:
> In NCR5380.c failled to compile because 'io_request_lock' undeclare.
> 
> '&io_request_lock' seems to became 'q->queue_lock' (include/linux/nbd.h)(with
> request_queue_t *q).
> Is it right?

In the general case for NCR5380 no. There is a lot more that needs to be
fixed to make that driver work on 2.5
