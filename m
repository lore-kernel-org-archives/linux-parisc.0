Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.maybe.net (12-231-156-39.client.attbi.com [12.231.156.39])
	by dsl2.external.hp.com (Postfix) with SMTP id 70EBC483A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 24 Jun 2002 02:01:00 -0600 (MDT)
Date: Mon, 24 Jun 2002 01:00:59 -0700
From: Chris Jantzen <chris-parisc@maybe.net>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020624080059.GA31627@maybe.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] C180 questions
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

So I have a new (to me) C180 and nearly everything is hunky-dory. Huge grats
to all the kernel/debian hackers! I have a few questions, though.

When I insert a PCI card, I get the dreaded firmware halt. The serial number
on this box is low enough that it could have PCI bugs that I've read about
on the net. Is this still repairable? Can it be worked around in software/
firmware? (Firmware 5.2, FWIW) I'm assuming that not only is the original
warranty long expired, that it wouldn't have transferred anyways. I have
a request in to HP support, I was just curious if this has been
encountered by anyone here before/recently.

I apologize that this is not directly Linux-related. This seems to be the
most active group working on machines near this vintage, and I fear
HP may reject my request for support based on not running HP-UX. Thanks
for any input! (And thanks again for a smashing job on the arch port. I've
got sparc, mips, powerpc, and ia32 all lying around the house, and I must
say the hppa install was the cleanest yet.)

BTW-Probably a FAQ and not that I intend to run it any time soon, but
how mature is the 64-bit in 32-bit firmware configuration? Does it
require a slightly different toolchain, or does binutils-hppa build
32 and 64-bit without a hitch?

-- 
chris jantzen kb7rnl =->         __O
Insert witty comment here.     _`\<,_
http://www.maybe.net/         (*)/ (*)
