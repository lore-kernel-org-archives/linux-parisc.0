Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id 95436482A
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 12:59:05 -0700 (MST)
Received: from ldl.fc.hp.com (ldl.fc.hp.com [15.1.50.190])
	by atlrel6.hp.com (Postfix) with ESMTP id A166C6008EE
	for <parisc-linux@lists.parisc-linux.org>; Tue, 22 Jan 2002 14:59:04 -0500 (EST)
To: Grant Grundler <grundler@dsl2.external.hp.com>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] vmlinux header for savecrash.
In-Reply-To: Your message of "Sun, 06 Jan 2002 20:46:15 MST."
             <20020107034615.9BFD64839@dsl2.external.hp.com>
References: <15417.3793.688638.629130@gargle.gargle.HOWL>  <20020107034615.9BFD64839@dsl2.external.hp.com> 
Date: Tue, 22 Jan 2002 12:59:03 -0700
From: Paul Bame <bame@fc.hp.com>
Message-Id: <E16T74R-0002Ko-00@noam.fc.hp.com>
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

palo removes the "3/vmlinux" parameter (and the initrd= one too) before
passing command line to the kernel which is consistent with x86 I think.
Would it be helpful to add a kernel parameter like "palo_kernel=3/vmlinux"
which you could then retrieve from /proc/cmdline?  I know it's a pain
to turn 3/vmlinux into /boot/vmlinux but 3/vmlinux is all palo knows.

	-P
