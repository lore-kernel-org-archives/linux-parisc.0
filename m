From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [RFC] Optimi[zs]e copy_*_user routines
Date: Thu, 9 Sep 2004 17:15:57 -0700
Message-ID: <20040910001557.GK28659@tausq.org>
References: <20040910000032.GJ28659@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040910000032.GJ28659@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

In reference to a message from Randolph Chung, dated Sep 09:
> This has been on my todo list for sometime -- the parisc kernel
> currently uses a one-byte-at-a-time implementation for
> copy_{to,from,in}_user. Obviously there is much room for improvement.
> Here's an attempt at a more optimal version.

A few more addon questions/RFCs:

- this patch relies on using fp regs for copy operations. In our current
  kernel we actually have -mdisable-fpregs, but i was not able to
  ascertain why. we don't currently have fp lazy state saving. there's
  been some talk about doing this, but it requires some help from gcc.
  is this ok? 

- i have a test suite for testing the copy routine in userspace, so
  memcpy.c is written in a way to make it easily sharable between
  userspace and kernel. is that ok to include the userspace support code
  in the kernel?

- this is the first time the kernel has had to change sr2 in the kernel
  (thus Carlos' earlier patch to restore it in the syscall path).
  Arguably we should not do the sr2 save/restore in the syscall path and
  instead do it in the copy routines, in order to make syscall as fast
  as possible. Thoughts?

  Alternatively, if we play some tricks with the preprocessor we can get
  away with only using sr1, but having 3 copies of the copy routines in
  the code. I actually tried this, but found the hacks required to do it
  to be rather ugly.

- gcc gurus (Dave :) might think what I'm doing with exceptions to be
  too ugly^Wfragile. are there better ways to do it? :)

  this is a somewhat compelling reason to write the whole thing in
  assembly (which will also allow for a few more small optimizations).
  do you think the advantages of maintaining C code outweigh the
  slight performance penality and hacks required?

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
