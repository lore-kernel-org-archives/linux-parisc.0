Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.maybe.net (sub27-133.member.dsl-only.net [63.105.27.133])
	by dsl2.external.hp.com (Postfix) with SMTP id C04F84829
	for <parisc-linux@parisc-linux.org>; Wed, 14 Aug 2002 10:13:07 -0600 (MDT)
Date: Wed, 14 Aug 2002 09:13:06 -0700
From: Chris Jantzen <chris@maybe.net>
To: parisc-linux@parisc-linux.org
Message-ID: <20020814161306.GA1277@maybe.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] 3c597/EISA status?
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

I read in the mailing list (*after* I bought the cards <kicks self in
shin>) that EISA support is probably not all their vis-a-vis a bus
master card like the 3c597. What's the current status? Where can I help?
I have a C180 with a couple 3c597's. Here's the relevant boot message:

---
Wax at 0xffe00000 found.
Wax: HIL Keyboard-NMI registered.
Wax EISA Adapter found at 0xfc000000
EISA EEPROM at 0xffc88000
Enumerating EISA bus
EISA slot 1 a configured board was not detected ( expected ___FFFF)
Dino version 2.1 found at 0xf2000000
The GSCtoPCI (Dino hrev 1) bus converter found may exhibit
data corruption.  See Service Note Numbers: A4190A-01, A4191A-01.
Systems shipped after Aug 20, 1997 will not exhibit this problem.
Models affected: C180, C160, C160L, B160L, and B132L workstations.

Dino: No PCI devices enabled.
---

And I seem to get a kernel panic any time I probe the driver module...

-- 
chris jantzen kb7rnl =->         __O
Insert witty comment here.     _`\<,_
http://www.maybe.net/         (*)/ (*)
