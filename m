From: Mike Frysinger <vapier@gentoo.org>
Subject: [parisc-linux] _syscall0() and gettid()
Date: Sat, 25 Dec 2004 02:17:28 -0500
Message-ID: <200412250217.28635.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
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

i was debugging a DirectFB build failure when i noticed that _syscall0() 
doesnt seem to be quite right ...

going by this little bit of code (see gettid(2) for info):
#include <sys/types.h>
#include <linux/unistd.h>
#include <errno.h>
_syscall0(pid_t,gettid)
pid_t gettid(void);
int main() { return 0; }

it fails to compile :(
gettid.c: In function `gettid':
gettid.c:5: error: parse error before ')' token

tried with gcc-3.3.5 and gcc-3.4.3 ...
using linux-2.6.8.1 headers here, but the define for _syscall0() doesnt seem 
to be different in 2.4 or 2.6 ... so what am i missing here ? :)
-mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
