From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] pthread problems - test program
Date: Sun, 3 Apr 2005 07:32:46 -0700
Message-ID: <20050403143246.GE8921@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

While testing out some stuff today, I ran across a threaded
program that will hang randomly when run. I tried to create a test case
to simulate what the larger program is doing. It also hangs, although
perhaps for different reasons (not sure yet)

The test program is in cvs in the userspace repository. It's called
thread_test2.c. It creates threads one at a time, and uses condition
variables for synchronization. On hppa the program will hang after some
time, and ps shows a lot of zombie processes. On x86 the program runs as
expected and there are no zombies.

I don't know if this is related to some of the hanging problems Dave and
doko have seen sometimes during gcc testing.... but our pthreads
definitely seem to be a bit buggy :(

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
