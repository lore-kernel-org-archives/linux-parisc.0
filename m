Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C5AE74829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  6 Dec 2002 07:30:44 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18KJV1-0002g7-00; Fri, 06 Dec 2002 14:30:39 +0000
Date: Fri, 6 Dec 2002 14:30:39 +0000
From: Matthew Wilcox <willy@debian.org>
To: jsoe0708@tiscali.be
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] superio.c -BUG
Message-ID: <20021206143039.D10368@parcelfarce.linux.theplanet.co.uk>
References: <3DED9B890000084D@ocpmta6.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DED9B890000084D@ocpmta6.freegates.net>; from jsoe0708@tiscali.be on Fri, Dec 06, 2002 at 03:10:01PM +0100
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

On Fri, Dec 06, 2002 at 03:10:01PM +0100, jsoe0708@tiscali.be wrote:
> Never the less, I would go further and notice that:
>  results = inb(IC_PCI1+0);
> 
> I well find the declaration of inb as extern unsigned char inb(int addr);
> (in io.h) but can somebody explain me where this function is defined (I
> scan all .c .h .s and do not find)?

arch/parisc/kernel/pci.c, starting at line 82

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
