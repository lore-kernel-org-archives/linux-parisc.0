Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP
	id 3A50E4854; Thu, 27 Dec 2001 02:47:57 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16JX8k-0008Dp-00; Thu, 27 Dec 2001 09:47:54 +0000
Date: Thu, 27 Dec 2001 09:47:54 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@lists.parisc-linux.org
Cc: parisc-linux-cvs@lists.parisc-linux.org
Message-ID: <20011227094754.B30605@parcelfarce.linux.theplanet.co.uk>
References: <20011226215742.DBB37482F@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20011226215742.DBB37482F@dsl2.external.hp.com>; from tsbogend@dsl2.external.hp.com on Wed, Dec 26, 2001 at 02:57:42PM -0700
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux tsbogend
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

On Wed, Dec 26, 2001 at 02:57:42PM -0700, Thomas Bogendoerfer wrote:
> CVSROOT:	/var/cvs
> Module name:	linux
> Changes by:	tsbogend	01/12/26 14:57:42
> 
> Modified files:
> 	drivers/gsc    : asp.c busdevice.h gsc.c lasi.c wax.c 
> 
> Log message:
> allow the caller of register_busdevice() to povide it's own irq region
> this resolves the problem with dino having a non standard irq region

i'm annoyed you did this rather than simply reorder the code as i said
i had already done in my tree.  please back this out.

-- 
Revolutions do not require corporate support.
