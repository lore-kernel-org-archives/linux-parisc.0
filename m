Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D8594829
	for <parisc-linux@parisc-linux.org>; Fri, 13 Sep 2002 09:02:48 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17pry2-0007TP-00
	for parisc-linux@parisc-linux.org; Fri, 13 Sep 2002 16:02:46 +0100
Date: Fri, 13 Sep 2002 16:02:46 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@parisc-linux.org
Message-ID: <20020913160246.T10583@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Remote access card in D/R class
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

Thanks to Derek Engelhaupt getting me some information, I now feel fairly
certain that Ryan Bradetich's Mux driver will support the D and R class
remote serial card.  So everyone who unplugged their remote serial card
to get their D/R class working should be able to plug it back in and
boot a recent kernel using `console=ttyB0' to get output on their remote
serial port.  Feedback from anyone who can test this feature appreciated.

I'm now scheming to see if we can reclaim Lasi's serial port, even
though firmware's disabled it.  Because you can never have too many
serial ports, right?  :-)

-- 
Revolutions do not require corporate support.
