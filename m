Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from colo.lackof.org (colo.lackof.org [198.49.126.79])
	by dsl2.external.hp.com (Postfix) with ESMTP id E56F54840
	for <parisc-linux@lists.parisc-linux.org>; Thu, 20 Nov 2003 10:42:18 -0700 (MST)
Date: Thu, 20 Nov 2003 10:42:17 -0700
From: Grant Grundler <grundler@parisc-linux.org>
To: CrazyCat from CPF <crazycat@c-p-f.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Trouble whith hp-pa 712/80
Message-ID: <20031120174217.GA7392@colo.lackof.org>
References: <01b201c3af59$fa8d72f0$65c0a8c0@directannonces.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <01b201c3af59$fa8d72f0$65c0a8c0@directannonces.com>
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

On Thu, Nov 20, 2003 at 12:32:28PM +0100, CrazyCat from CPF wrote:
> And after, I try to initialise partition sda5 (sda1 to sda3 are allready
> initialised).
> And the system blocks when writing superblocks....

Is this using a 2.4.22 kernel?
Can you try a newer kernel?

auto-built 2.4.22 kernels are available from:
	http://cvs.parisc-linux.org/download/linux-2.4/autobuild/32

or use a 2.6 kernel if you have serial console:
	http://cvs.parisc-linux.org/download/linux-2.6/autobuild/32

I have no clue why writing superblocks is fast at first and then
slows down dramatically. Feels like the buffer cache get filled
and the VM starts thrashing the disk. Waiting 5 or 10 minutes for
it to complete might be suficient.

grant
