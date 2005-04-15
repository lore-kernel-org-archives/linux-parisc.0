From: Carlos O'Donell <carlos@baldric.uwo.ca>
Subject: Re: [parisc-linux] pthread problems - test program
Date: Fri, 15 Apr 2005 10:16:12 -0400
Message-ID: <20050415141611.GI26980@baldric.uwo.ca>
References: <20050409063750.GQ1833@baldric.uwo.ca>
	<200504092344.j39NiNMM024348@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: tausq@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200504092344.j39NiNMM024348@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sat, Apr 09, 2005 at 07:44:22PM -0400, John David Anglin wrote:
> I number of other things to note.  If the signal handler uses
> _exit() or _Exit(), the program doesn't hang.  If exit() is called
> twice, the behavior is undefined.  I would argue that we don't call
> exit twice but that's timing depend with the current testcase.
> exit() isn't listed as async-signal-safe, so it's probably not
> legit to call it from a signal handler.  Thus, this isn't a bug.

Bugger. Then our testcase is undefined. Removing exit() fixes the
problem.

Randolph's SIGILL's are still an interesting problem.

c.

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
