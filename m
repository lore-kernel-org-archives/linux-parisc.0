Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id A3E4E4852
	for <parisc-linux@lists.parisc-linux.org>; Wed,  3 Dec 2003 22:01:28 -0700 (MST)
Received: from carlos by baldric with local (Exim 3.35 #1 (Debian))
	id 1ARlW6-0004bg-00
	for <parisc-linux@lists.parisc-linux.org>; Wed, 03 Dec 2003 23:55:06 -0500
Date: Wed, 3 Dec 2003 23:55:06 -0500
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] shmem 2.6 kernel bug?
Message-ID: <20031204045506.GD17292@systemhalted>
References: <20031204040026.GB17292@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031204040026.GB17292@systemhalted>
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

On Wed, Dec 03, 2003 at 11:00:26PM -0500, Carlos O'Donell wrote:
> 
> pa,
> 
> When I ssh into my box I see:
> ---
> kernel BUG at mm/shmem.c:585!
> Kernel addresses on the stack:
>  [<000000001016f338>] unmap_page_range+0xa0/0x290
>  [<0000000010126e78>] sys32_rt_sigaction+0x90/0x118
>  [<000000001011313c>] sys_mmap2+0x14/0x20
>  [<000000001010ce4c>] syscall_exit+0x0/0x14
>  [<000000001010c094>] intr_check_sig+0x0/0xc
> ---

kernel BUG at mm/shmem.c:585!
Kernel addresses on the stack:
 [<00000000101a15d4>] dput+0x13c/0x240
 [<0000000010141900>] do_group_exit+0x50/0x108
 [<00000000101419cc>] sys_exit_group+0x14/0x20
 [<000000001010ce4c>] syscall_exit+0x0/0x14
 [<000000001010c094>] intr_check_sig+0x0/0xc

c.
