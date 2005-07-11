From: Carlos O'Donell <carlos@systemhalted.org>
Subject: [parisc-linux] [RFC] Deferred lock init or lock cookies (hppa
	spinlock requirements)
Date: Mon, 11 Jul 2005 09:54:49 -0400
Message-ID: <20050711135449.GH5314__1025.46321363679$1416623841$gmane$org@systemhalted.org>
References: <20050628031928.GP5269@systemhalted.org>
	<42D19A1B.2060409@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: libc-alpha <libc-alpha@sources.redhat.com>,
 parisc-linux@lists.parisc-linux.org
To: Ulrich Drepper <drepper@redhat.com>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <42D19A1B.2060409@redhat.com>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Jul 10, 2005 at 02:58:51PM -0700, Ulrich Drepper wrote:
> I checked in a little bit cleaned up version.

Thanks.

Perhaps I can get your academic opinion on the following?

We are prototyping an NPTL port for hppa. We want to touch as little
core code as possible, and we are thinking of deferred lock
initialization, or scalar cookies.

Deferred Locks:
The core idea is to let the lock acquire fail. On the spin we check to
see if the lock was initialized. Having four lock words means that an
"all zero" lock had been memset to zero, in this case we use a
light-weight-syscall to initialize the lock. The lock held case is
similar.

This saves us from making core code changes that setup the lock to a
different value. It still doesn't save us from using a structure for a
lock word.

Scalar Cookies:
A completely alternative implementation involves using an int lock as a
cookie. The cookies are created dynamically and a lock is materialized
for the cookie.

We have a prototype design using cookies, but we have a couple of issues:

Cookies that are serialized and later reloaded.
	= Requires lock rematerialization.
	= Non-trivial.

Cookies placed in shared memory would need to look at the pshared == 1
case, and place locks into a known named posix shared memory segment.

I know you've had experience with these issue, and I was curious about
your opinion.

c.

NOTE: There is a third alternative, and that is to use the
light-weight-syscall "compare and swap" to do the entire lock
implementation. Performance has not been measured for this case. AFAIK
this is the route HPUX took.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
