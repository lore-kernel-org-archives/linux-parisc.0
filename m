Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 09F00482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 19 Nov 2001 14:51:51 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 165wKS-0000AQ-00; Mon, 19 Nov 2001 21:51:48 +0000
Date: Mon, 19 Nov 2001 21:51:48 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Neulinger, Nathan" <nneul@umr.edu>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] FW: Porting LWP
Message-ID: <20011119215148.D1835@parcelfarce.linux.theplanet.co.uk>
References: <E8139C9A62384F49A7EBF9CCCD2243C101968B@umr-mail2.umr.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <E8139C9A62384F49A7EBF9CCCD2243C101968B@umr-mail2.umr.edu>; from nneul@umr.edu on Mon, Nov 19, 2001 at 01:44:45PM -0600
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

On Mon, Nov 19, 2001 at 01:44:45PM -0600, Neulinger, Nathan wrote:
> Anyone have any thoughts on this? In particular the question about whether
> setjmp/longjmp preserve the stack. 

It ought to... it's just a function call, IIRC.

> When I try to have the code use ucontext (getcontext/setcontext) instead, it
> gets complaints from glibc about setcontext/getcontext being unimplemented.

Hmm... file a bug against that, please.

> the last time i worked on a parisc system i noted that that the 
> stack grew UP and not down.  parisc might do the same.  the linux
> swp code assumes that the stack grows down (atleast i am pretty sure
> it does)

The code in glibc used to assume that.  It's been fixed since we found
it easier to keep the stack growing up.

-- 
Revolutions do not require corporate support.
