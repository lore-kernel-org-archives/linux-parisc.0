From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] 2.6.10-rc1-pa11 profile data
Date: Thu, 11 Nov 2004 12:39:01 -0500
Message-ID: <20041111173901.GX2639@baldric.uwo.ca>
References: <20041111075431.GB9768@colo.lackof.org>
	<20041111081154.GR15714@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041111081154.GR15714@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> - can we improve kernel entry time for interrupts (and syscalls) by
>   being smarter about what we save on the stack? (i.e. only callee-save
>   registers and not all the registers?)
> 
> volunteers? :)

I have been stewing over the following:

Leave the existing syscall save everything code in place.

Create a branch infront of the syscall save everything code that
branches on the value of "enable_fast_syscall"

The variable is set via some mechanism. What's the currently accepted
way? /proc twiddle?

The branched code path contains the fast callee-save only register.

Allow a compile time option to switch kernel syscalls to the 'fast'
function call ABI method for people that know they are installing 
on a recent glibc.

That's much later on my todo list, but because sometimes I get
frustrated with binutils I go to work on other things for a break :)

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
