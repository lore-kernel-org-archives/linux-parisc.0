Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E976E4829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 19:15:34 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18AhdH-0005bl-00; Sun, 10 Nov 2002 02:15:27 +0000
Date: Sun, 10 Nov 2002 02:15:27 +0000
From: Matthew Wilcox <willy@debian.org>
To: "J.E.J. Bottomley" <James.Bottomley@steeleye.com>
Cc: "Adam J. Richter" <adam@yggdrasil.com>, andmike@us.ibm.com,
	greg@kroah.com, hch@lst.de, linux-kernel@vger.kernel.org,
	mochel@osdl.org, parisc-linux@lists.parisc-linux.org,
	willy@debian.org
Subject: Re: [parisc-linux] Untested port of parisc_device to generic device interface
Message-ID: <20021110021527.Y12011@parcelfarce.linux.theplanet.co.uk>
References: <adam@yggdrasil.com> <200211100201.gAA21Uv04824@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200211100201.gAA21Uv04824@localhost.localdomain>; from James.Bottomley@steeleye.com on Sat, Nov 09, 2002 at 09:01:29PM -0500
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

On Sat, Nov 09, 2002 at 09:01:29PM -0500, J.E.J. Bottomley wrote:
> Actually, so would I.  I can suspect why there might exist machines like this 
> (say the consistent attribute is settable at the pgd level)

well, there's a limited amount of space available for consistent mappings
on some machines.  it's basically the same as the vmalloc space.  i think
the best way to handle this is simply to fail to initialise if you can't
get the consistent memory you need.

-- 
Revolutions do not require corporate support.
