Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4BEF4904
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 07:32:25 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15pV5R-0003q3-00; Fri, 05 Oct 2001 14:32:21 +0100
Date: Fri, 5 Oct 2001 14:32:21 +0100
From: Matthew Wilcox <willy@debian.org>
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] a todo entry
Message-ID: <20011005143221.B19206@parcelfarce.linux.theplanet.co.uk>
References: <200110050903.DAA15266@udlkern.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200110050903.DAA15266@udlkern.fc.hp.com>; from jsm@udlkern.fc.hp.com on Fri, Oct 05, 2001 at 03:03:25AM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Oct 05, 2001 at 03:03:25AM -0600, John Marvin wrote:
>     1) Set sr2 to 0 when the argument to set_fs is KERNEL_DS, and KERNEL_DS
>     must be defined as 0 (it is currently). Set sr2 to sr3 when the
>     argument is any non-zero value. get_fs can then return the value of
>     sr2.
> 
>     2) Set sr2 to 0 when the argument to set_fs is KERNEL_DS. Set sr2
>     to sr3 when the argument is USER_DS. get_fs should return KERNEL_DS
>     if sr2 is 0. get_fs should return USER_DS otherwise. I prefer this.

I was thinking along the lines of:

#define KERNEL_DS 0
#define USER_DS mfsp(3)
#define get_ds() (KERNEL_DS)
#define get_fs() mfsp(2)
#define set_fs(x) mtsp(x, 3)

except that the first argument to mtsp needs to be a register, not a
value, but that's solvable, I think.

-- 
Revolutions do not require corporate support.
