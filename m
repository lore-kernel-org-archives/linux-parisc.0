From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: [parisc-linux] "If futex's were mutex's we'd have a fish fry!" or
	"Why we need LWS on hppa"
Date: Wed, 11 Aug 2004 15:57:31 -0400
Message-ID: <20040811195731.GK29662@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
To: parisc-linux@lists.parisc-linux.org,
 James Bottomley <James.Bottomley@steeleye.com>,
 Randolph Chung <tausq@debian.org>,
 John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
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


fellow hackers,

I continue to work on the light-weight-syscalls infrastructure, and it
seems to be going well. I have to continually rethink what is "correct"
and what is "practical" in terms of an implementation.

I asked for some help on IRC, in particular with some specific topics
regarding unaligned loads and other ugly things. The corner cases are
not so pretty.

It was suggested that CAS could be implemented by:

a. Blocking all blockable signals.
b. Using futex's to create a mutex around the CAS code.

(Thanks James!)

I was excited by the idea, but after reading:
http://people.redhat.com/drepper/futex.pdf

It became apparnet that (b) cannot be acomplished without having
hardware support for "compare and exchange" or "load lock/store"
primities in hardware. Even a broken mutex implementation requires
"atomic increment" which we don't have and is a prime target for
conversion to a LWS.

If you can show me wrong somewhere, please do, otherwise it seems like
we won't get working futex mutex support without having LWS working
first.

Cheers,
Carlos.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
