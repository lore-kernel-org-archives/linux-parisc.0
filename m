Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 3C740482E
	for <parisc-linux@parisc-linux.org>; Thu, 14 Nov 2002 08:13:49 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18CLge-0007Kl-00
	for parisc-linux@parisc-linux.org; Thu, 14 Nov 2002 15:13:44 +0000
Date: Thu, 14 Nov 2002 15:13:44 +0000
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20021114151344.Y30392@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [IMPORTANT] PDC & Mux console major number changed
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

Now that we've been assigned an official major number for Mux, and had
it accepted into 2.5, I've changed 2.4.20-rc1-pa2 to use that number.
So if you're using an E class, a K class or a D/R class with the funky
console thing, before you upgrade from 2.4.19, you MUST rm /dev/ttyB0
and replace it with:

mknod /dev/ttyB0 c 11 0

Yes, breakage like this sucks, but I'd rather do it now than later.

-- 
Revolutions do not require corporate support.
