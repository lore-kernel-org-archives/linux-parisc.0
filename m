Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cmailg7.svr.pol.co.uk (cmailg7.svr.pol.co.uk [195.92.195.177])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA9A34829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 31 Aug 2002 12:58:03 -0600 (MDT)
Received: from modem-58.draugluin.dialup.pol.co.uk ([62.136.158.58] helo=there)
	by cmailg7.svr.pol.co.uk with smtp (Exim 3.35 #1)
	id 17lDRZ-00055c-00
	for parisc-linux@lists.parisc-linux.org; Sat, 31 Aug 2002 19:58:01 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Will Newton <will@misconception.org.uk>
To: parisc-linux@lists.parisc-linux.org
Date: Sat, 31 Aug 2002 20:01:00 +0100
MIME-Version: 1.0
Message-Id: <E17lDRZ-00055c-00.2002-08-31-19-58-01@cmailg7.svr.pol.co.uk>
Subject: [parisc-linux] Debugging assembly
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

I'm having trouble getting gas to output debugging information for an 
assembly file. as -g gives a warning about -g being ambiguous, as --gdwarf2 
reults in objdump saying "no recognized debugging information", and as 
--gstabs results in stuff like this:

/* file file.S line x addr 0x0000000000000000 */

Any ideas?
