Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id MAA30399
	for <parisc-linux@puffin.external.hp.com>; Tue, 5 Dec 2000 12:28:24 -0700
Received: from parcelfarce.linux.theplanet.co.uk (HELO www.linux.org.uk) (root@195.92.249.252)
  by mailserv2.iuinc.com with SMTP; 5 Dec 2000 19:30:59 -0000
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 143Nnl-0004KZ-00
	for parisc-linux@thepuffingroup.com; Tue, 05 Dec 2000 19:30:57 +0000
Date: Tue, 5 Dec 2000 19:30:57 +0000
From: Matthew Wilcox <matthew@wil.cx>
To: parisc-linux@thepuffingroup.com
Message-ID: <20001205193057.C12682@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: <willy@www.linux.org.uk>
Subject: [parisc-linux] binary compatibility
List-ID: <linux-parisc.vger.kernel.org>


how much do people care if i break binary compatibility again?  i want
to fix the stack properly, and this will require a new crt0.o.  ok,
it means replacing all the current binaries, but most of them are
crossbuilt anyway.

i suppose the pain of this would be mitigated if there were other changes
to the abi that people wanted to make and we could make them all at the
same time.

ideas?

-- 
Revolutions do not require corporate support.
