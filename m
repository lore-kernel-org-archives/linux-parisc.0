Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id A3DC1482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 18 Dec 2001 18:46:42 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16GVoe-0003I3-00; Wed, 19 Dec 2001 01:46:40 +0000
Date: Wed, 19 Dec 2001 01:46:40 +0000
From: Matthew Wilcox <willy@debian.org>
To: Jochen Friedrich <jochen@scram.de>
Cc: HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] ISA memory access
Message-ID: <20011219014640.D8936@parcelfarce.linux.theplanet.co.uk>
References: <Pine.NEB.4.33.0112181417170.14021-100000@www2.scram.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.NEB.4.33.0112181417170.14021-100000@www2.scram.de>; from jochen@scram.de on Tue, Dec 18, 2001 at 02:22:15PM +0100
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

On Tue, Dec 18, 2001 at 02:22:15PM +0100, Jochen Friedrich wrote:
> is it necessary to perform something similar to eisa_permute for ISA
> memory space? At least on IBM Token Ring cards the driver fails to get
> correct data if (memory & 0x300) == 0:

not from my memories of the mongoose docs.  unfortunately, i don't have
access to those again until jan 10th or so.  how does the driver access
the card?  readb/writeb or dma?

-- 
Revolutions do not require corporate support.
