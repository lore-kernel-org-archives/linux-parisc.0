From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Sun, 3 Apr 2005 17:53:48 -0700
Message-ID: <20050404005348.GI8921@tausq.org>
References: <20050403143246.GE8921@tausq.org>
	<200504032024.j33KOXcu018402@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504032024.j33KOXcu018402@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

In reference to a message from John David Anglin, dated Apr 03:
> > The test program is in cvs in the userspace repository. It's called
> > thread_test2.c. It creates threads one at a time, and uses condition
> > variables for synchronization. On hppa the program will hang after some
> > time, and ps shows a lot of zombie processes. On x86 the program runs as
> > expected and there are no zombies.
> 
> I see threadfunc uses waitpid.  This is the same syscall that seems
> to cause problems with expect (zombie expect child and parent waiting
> for signal that never comes).

This is very similar to what happens with my test program.

Running this under gdb is kind of amusing. gdb gets quite confused...

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
