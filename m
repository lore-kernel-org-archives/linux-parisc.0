Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 13ACA482F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 06:47:50 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17XLYO-0002Wz-00; Wed, 24 Jul 2002 13:47:44 +0100
Date: Wed, 24 Jul 2002 13:47:44 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] K-2.5.26-pa0: NCR5380.c ?
Message-ID: <20020724134744.K3052@parcelfarce.linux.theplanet.co.uk>
References: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1027513921.3d3e9e41069a0@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, Jul 24, 2002 at 02:32:01PM +0200
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

On Wed, Jul 24, 2002 at 02:32:01PM +0200, joel.soete@freebel.net wrote:
> In NCR5380.c failled to compile because 'io_request_lock' undeclare.

why are you trying to compile this driver?  do you _really_ have an NCR5380?

-- 
Revolutions do not require corporate support.
