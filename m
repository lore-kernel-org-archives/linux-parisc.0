From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] expect hang with 2.6.7-pa14 #1
Date: Mon, 26 Jul 2004 15:18:56 -0700
Message-ID: <20040726221856.GW546@tausq.org>
References: <200407262204.i6QM4J8B014889@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200407262204.i6QM4J8B014889@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

In reference to a message from John David Anglin, dated Jul 26:
> I tried 2.6.7-pa14 on a c3750.  There is a problem with expect running
> the gcc testsuite.  It apparently hangs waiting for a signal:

dunno about this, but i'm interested in:

> #7  0x4068a77c in expErrnoMsgSet () from /usr/lib/libexpect5.41.so.1
> #8  0x4068a77c in expErrnoMsgSet () from /usr/lib/libexpect5.41.so.1
> Previous frame identical to this frame (corrupt stack?)
> 
> I seen the same backtrace in two separate hangs.

is this from latest gdb cvs? if so i am interested in investigating why
the backtrace seems to be corrupted....

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
