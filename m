Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 211AB49F1
	for <parisc-linux@parisc-linux.org>; Fri,  5 Oct 2001 10:22:23 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15pXjy-0007CW-00
	for parisc-linux@parisc-linux.org; Fri, 05 Oct 2001 17:22:22 +0100
Date: Fri, 5 Oct 2001 17:22:22 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20011005172222.D19206@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] pdc_add_valid
List-ID: <linux-parisc.vger.kernel.org>

The pdc_add_valid function really annoys me.  Or maybe it's just how
it's used:

        if (!pdc_add_valid( (void *)(port+4))) {

Which says to me `if this address is not valid' -- the opposite of what it
does.  It could be rewritten as:

	if (pdc_add_valid((void *)(port+4)) == PDC_OK) {

but this takes more effort.  In my tree, I've added valid_io_addr which
does what it says on the tin:

	if (valid_io_addr(port+4)) {

For the moment, I've put it in <asm/io.h>, since it is for I/O addresses.

+int valid_io_addr(unsigned long addr)
+{
+       return (pdc_add_valid(addr) == PDC_OK);
+}

But maybe we should replace pdc_add_valid with valid_io_addr?  Or a
different function?  Suggestions appreciated.

-- 
Revolutions do not require corporate support.
