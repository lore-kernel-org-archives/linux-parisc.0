From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: syscall restart block.
Date: Sun, 12 Sep 2004 17:05:11 -0700
Message-ID: <20040913000511.GU28659@tausq.org>
References: <20040912184553.GT1854@baldric.uwo.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: James Bottomley <James.Bottomley@steeleye.com>,
 parisc-linux@lists.parisc-linux.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040912184553.GT1854@baldric.uwo.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> If we move stack trampolines to the gateway pagethen signals can't be
> delivered to the returning process during the trampoline walk (signals
> are not allowed to be delivered for processes on the gateway page). So
> it fixes our hole too.
> 
> It also allows us to interpret PT_GNU_STACK properly, since the kernel
> no longer needs to execute a trampoline on the users stack. The
> toolchain can now correctly mark the stack as non-exec.
> 
> I only just realized we still had this hole and it might manifest itself
> under heavy signal load.

i think the analysis is correct, but i don't like the solution! :-)

various pieces of software (gcc, gdb) need to be able to read and
analyze the signal trampoline for unwinding. putting the trampoline 
onto the gateway page will break these applications, because the 
gateway page is not readable by the user.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
