Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from webmail.tiscalinet.be (unknown [212.35.2.201])
	by dsl2.external.hp.com (Postfix) with ESMTP id C36AF482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 07:46:13 -0600 (MDT)
To: Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] K-2.5.26-pa0: NCR5380.c ?
Message-ID: <1027518368.3d3eafa051fc1@webmail.tiscalinet.be>
Date: Wed, 24 Jul 2002 15:46:08 +0200 (CEST)
From: joel.soete@freebel.net
Cc: joel.soete@freebel.net, parisc-linux@lists.parisc-linux.org
References: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be> <20020724134744.K3052@parcelfarce.linux.theplanet.co.uk>
In-Reply-To: <20020724134744.K3052@parcelfarce.linux.theplanet.co.uk>
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

Quoting Matthew Wilcox <willy@debian.org>:

> On Wed, Jul 24, 2002 at 02:32:01PM +0200, joel.soete@freebel.net wrote:
> > In NCR5380.c failled to compile because 'io_request_lock' undeclare.
> 
> why are you trying to compile this driver?  do you _really_ have an
> NCR5380?
> 
> -- 
> Revolutions do not require corporate support.
> 
inheritance from config-2.4.17-32 (of Debian kernel image of this time) :)

Too lasy to analyse exactly what I need for my 712, b180, b2000 I continue to
use it.

Joel


-------------------------------------------------
This mail sent through Tiscali Webmail (http://webmail.tiscali.be)
