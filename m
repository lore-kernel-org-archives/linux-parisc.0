Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from einstein.tteng.com.br (unknown [200.203.41.86])
	by dsl2.external.hp.com (Postfix) with ESMTP id 30DF2482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 May 2003 15:55:50 -0600 (MDT)
Received: (from root@localhost)
	by einstein.tteng.com.br (8.11.6/8.11.6) id h4KLthr18769
	for parisc-linux@lists.parisc-linux.org; Tue, 20 May 2003 18:55:43 -0300
Received: from hamilton.tteng.com.br (hamilton.tteng.com.br [192.168.0.100])
	by einstein.tteng.com.br (8.11.6/8.11.6) with ESMTP id h4KLtfP18762
	for <parisc-linux@lists.parisc-linux.org>; Tue, 20 May 2003 18:55:41 -0300
Date: Tue, 20 May 2003 18:55:41 -0300
From: Hamilton Coutinho <hamilton@tteng.com.br>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030520215541.GA11860@hamilton.tteng.com.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] Building glibc (static) with 64 bits toolchain
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

Hello,

I'm trying to figure it out how far we are from the most simple 64 bits
userspace I could think of. I read the list's archive and understand
that this is a subject that was beaten to death already (I'm also aware
of the doubtful usefulness of it). So, I'm planning to annoy you the
least I can :)

I think I have all sorted out (well, most of it, I think): for a simple
"hello world" app I need kernel support for execve, brk, write, mmap
(and a few others), a 64 bits toolchain and a libc (diet or the full
blown glibc :). Sure enough, the libc is the grayest area for me.
