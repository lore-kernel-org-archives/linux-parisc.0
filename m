From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Hanging processes in T state
Date: Thu, 23 Sep 2004 17:06:46 -0700
Message-ID: <20040924000646.GZ22642@tausq.org>
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

pa,

Using 2.6.9-rc2 kernels, i see a lot of hanging processes when running
the gdb testsuite. I checked in one fix to arch/parisc/kernel/ptrace.c
that fixes most of them, but i still see some:

e.g.:
 6273 ?        T      0:00 /home/tausq/gdb/build-cvs/gdb/testsuite/gdb.mi/mi-pth
 6272 ?        T      0:00 /home/tausq/gdb/build-cvs/gdb/testsuite/gdb.mi/mi-pth
 6271 ?        T      0:00 /home/tausq/gdb/build-cvs/gdb/testsuite/gdb.mi/mi-pth

all the ones that are hanging seem to be using pthreads. anyone else see
this? anyway want to do some debugging? :)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
