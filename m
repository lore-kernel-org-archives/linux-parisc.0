Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6A378482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 15:35:28 -0700 (MST)
Received: from smtp2.fc.hp.com (smtp2.fc.hp.com [15.15.136.253])
	by atlrel6.hp.com (Postfix) with ESMTP id A2318601411
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 17:35:27 -0500 (EST)
Received: from ob500.cup.hp.com (dhcp66.cup.hp.com [15.8.80.66])
	by smtp2.fc.hp.com (Postfix) with ESMTP id 31DBD37EDF
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 15:35:27 -0700 (MST)
Received: from cup.hp.com (localhost [127.0.0.1])
	by ob500.cup.hp.com (Postfix) with ESMTP id 0793E48DD
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 14:35:13 -0800 (PST)
To: parisc-linux@lists.parisc-linux.org
Date: Tue, 22 Jan 2002 14:35:12 -0800
From: Grant Grundler <grundler@cup.hp.com>
Message-Id: <20020122223513.0793E48DD@ob500.cup.hp.com>
Subject: [parisc-linux] [Linux-ia64] heads-up: don't treat __FUNCTION__ as a constant (fwd)
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

This is worth repeating one more time.
Many of you are probably aware of this since parisc port has
already visited the __FUNCTION__ issue once before.

grant

------- Forwarded Message

From: David Mosberger <davidm@hpl.hp.com>
To: linux-ia64@linuxia64.org
X-URL: http://www.hpl.hp.com/personal/David_Mosberger/
Reply-To: davidm@hpl.hp.com
Subject: [Linux-ia64] heads-up: don't treat __FUNCTION__ as a constant

A heads-up about a change that's forthcoming in gcc3.1: the
__FUNCTION__ macro should no longer be treated as returning a constant
string literal.  gcc3.1 will still allow it, but issue an ugly warning
message.  In later releases, the feature will go away completely.

The reason for deprecating this feature is that ANSI C pretty much
disallows it: string literal concatenation is required to be done in a
phase *before* the name of the current function is known.  The
solution is to change something of the form:

	printk(__FUNCTION__": you lose\n");

into something like this:

	printk("%s: you lose\n", __FUNCTION__);

I did a quick grep over the ia64 code and found the following files
are using __FUNCTION__:

arch/ia64/kernel/efi.c
arch/ia64/kernel/palinfo.c
arch/ia64/kernel/perfmon.c
arch/ia64/kernel/smp.c
arch/ia64/kernel/unaligned.c
arch/ia64/sn/io/pci.c
arch/ia64/sn/io/pci_bus_cvlink.c
arch/ia64/sn/io/pciba.c
arch/ia64/sn/io/pciio.c
arch/ia64/sn/io/sn1/pcibr.c
arch/ia64/sn/io/sn2/ml_SN_intr.c
arch/ia64/sn/io/sn2/pcibr/pcibr_dvr.c

It might be a good idea to clean these up as you're working on it.
It's not urgent, of course, but I wanted to make you aware of this
issue so we can at least avoid writing new code using this construct.

Thanks,

	--david

_______________________________________________
Linux-IA64 mailing list
Linux-IA64@linuxia64.org
http://lists.linuxia64.org/lists/listinfo/linux-ia64


------- End of Forwarded Message
