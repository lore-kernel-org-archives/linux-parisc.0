Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CCEB54863
	for <parisc-linux@lists.parisc-linux.org>; Wed, 19 Jun 2002 08:17:59 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17KgHT-0004tn-00; Wed, 19 Jun 2002 15:17:55 +0100
Date: Wed, 19 Jun 2002 15:17:55 +0100
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] hppa64-linux-gcc not in gcc dpkg?
Message-ID: <20020619151755.L9435@parcelfarce.linux.theplanet.co.uk>
References: <1024493288.3d1086e89dfd2@webmail.tiscalinet.be> <20020619143627.K9435@parcelfarce.linux.theplanet.co.uk> <1024495623.3d109007598b2@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1024495623.3d109007598b2@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, Jun 19, 2002 at 04:07:03PM +0200
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

On Wed, Jun 19, 2002 at 04:07:03PM +0200, joel.soete@freebel.net wrote:
> May I am wrong (I thought that the PDC of the b2000 was not a 64bits one; I will
> check )

ah, you relied on memory rather than reading the help text then?

32-bit PDC
CONFIG_PDC_NARROW
  Saying Y here will allow developers with a C180, C200, C240, C360,
  J200, J210, and/or a J2240 to test 64-bit kernels by providing a
  wrapper for the 32-bit PDC calls.  Since the machines which require
  this option do not support over 4G of RAM, this option is targeted
  for developers of these machines wishing to test changes on both
  32-bit and 64-bit configurations.

  If unsure, say N.

b2000 and similar machines have firmware which supports both 32 and 64
bit PDC calls.

-- 
Revolutions do not require corporate support.
