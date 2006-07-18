From: "Carlos O'Donell" <carlos@systemhalted.org>
Subject: [parisc-linux] atomic swap parameters in the wrong order?
Date: Mon, 17 Jul 2006 23:19:39 -0400
Message-ID: <119aab440607172019j19fcad72ve8dac529015c2663@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
To: "Randolph Chung" <randolph@tausq.org>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
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

randolph,

I think that ports/sysdeps/hppa/nptl/pthread_* implementations have
the atomic swap parameters in the wrong order...

The files have "lock, 0, 1" but it should be "lock, 1, 0" since it's
"addr, newval, oldval".
They are attempts to acquire a lock.

Whaddaya think?

c.
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
