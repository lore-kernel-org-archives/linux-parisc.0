Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4CA52482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 07:50:47 -0600 (MDT)
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: Re: [parisc-linux] K-2.5.26-pa0: NCR5380.c ?
Message-ID: <1027518637.3d3eb0ad8a234@webmail.tiscalinet.be>
Date: Wed, 24 Jul 2002 15:50:37 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be> <1027518935.6517.30.camel@irongate.swansea.linux.org.uk>
In-Reply-To: <1027518935.6517.30.camel@irongate.swansea.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
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

Quoting Alan Cox <alan@lxorguk.ukuu.org.uk>:

> On Wed, 2002-07-24 at 13:32, joel.soete@freebel.net wrote:
> > In NCR5380.c failled to compile because 'io_request_lock' undeclare.
> > 
> > '&io_request_lock' seems to became 'q->queue_lock'
> (include/linux/nbd.h)(with
> > request_queue_t *q).
> > Is it right?
> 
> In the general case for NCR5380 no. There is a lot more that needs to
> be
> fixed to make that driver work on 2.5
> 
> 

Well it seems that I do not realy need it right now. So I will simply try to use
make oldconfig (just a test).

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
