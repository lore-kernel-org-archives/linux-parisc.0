From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] spinlock debug
Date: Tue, 13 Jul 2004 22:08:32 -0700
Message-ID: <20040714050832.GN546@tausq.org>
References: <20040714042909.GM546@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: varenet@parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040714042909.GM546@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> 	a = __ldcw_align(lock);
> 	while ((__ldcw(a) == 0))
> 		while ((*a == 0) && --stuck);

There's another race in the code. Suppose stuck becomes 0, so you go
back to the outer loop, and you manage to acquire the lock, then you
will hit the next if:

     52         if (unlikely(stuck <= 0)) {
     53                 printk(KERN_ERR
     54                         "%s:%d: spin_lock(%s/%p) stuck in %s at %p(%d)"
     55                         " owned by %s:%d in %s at %p(%d)\n",
     56                         base_file, line_no, lock->module, lock,
     57                         current->comm, inline_pc, cpu,
     58                         lock->bfile, lock->bline, lock->task->comm,
     59                         lock->previous, lock->oncpu);
     60                 stuck = INIT_STUCK;
     61                 printed = 1;
     62                 goto try_again;
     63         }

so you erroneously detect that the lock was not taken, print an error,
and go back to get the lock again. now you will not be able to acquire
the lock and you are deadlocked.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
