Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cmailg2.svr.pol.co.uk (cmailg2.svr.pol.co.uk [195.92.195.172])
	by dsl2.external.hp.com (Postfix) with ESMTP id C649B4831
	for <parisc-linux@lists.parisc-linux.org>; Fri, 30 Aug 2002 17:40:02 -0600 (MDT)
Received: from modem-149.brown-bird-wrasse.dialup.pol.co.uk ([62.136.242.149] helo=there)
	by cmailg2.svr.pol.co.uk with smtp (Exim 3.35 #1)
	id 17kvMv-0002G4-00
	for parisc-linux@lists.parisc-linux.org; Sat, 31 Aug 2002 00:40:01 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Will Newton <will@misconception.org.uk>
To: parisc-linux@lists.parisc-linux.org
Date: Sat, 31 Aug 2002 00:43:21 +0100
MIME-Version: 1.0
Message-Id: <E17kvMv-0002G4-00.2002-08-31-00-40-01@cmailg2.svr.pol.co.uk>
Subject: [parisc-linux] 64 byte alignment
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

I'm trying to 64 byte align a stack pointer, unfortunately it's not working. 
Here is my code:

        ldi 0x03f,%r21                  ; Load mask (b0111111)
        and,<> %r3,%r21,%r21            ; Check alignment
        addi 64,%r3,%r3                 ; If not aligned round up
        depwi 0x0,31,6,%r3               ; Clear low order bits

Basically the idea is:
 and the low 6 bits with a mask to see if any are set.
 if any are set, add 64 and clear the low order bits

I may be doing something horribly ignorant here, but PA-RISC assembly is not 
the most widely documented of things. :)

Thanks,
