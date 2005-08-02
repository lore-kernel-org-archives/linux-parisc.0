From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] Re: gdb debugging SIGEV_THREAD threads?
Date: Tue, 2 Aug 2005 11:25:15 -0400
Message-ID: <20050802152508.GE9703@systemhalted.org>
References: <20050802134128.GC9703@systemhalted.org> <42EF86E7.40506@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42EF86E7.40506@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Tue, Aug 02, 2005 at 10:44:55PM +0800, Randolph Chung wrote:
> >Might you have a clue as to why gdb can't debug a SIGEV_THREAD?
> >This test fails with a SIGSEGV in NPTL. The thread is in
> >__deallocate_stack (DSO address check from fault) 
> 
> Not a clue, but I can look into it.

It looks like the breakpoint is placed in the correct location, but gdb
doesn't acknowledge the trap.

It may be difficult to replicate this without my NPTL patches. I'll
check this in so you can build the toolchain too.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
