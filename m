From: Randolph Chung <randolph@tausq.org>
Subject: [parisc-linux] Re: Need help writing register consistency test?
Date: Thu, 16 Sep 2004 12:26:41 -0700
Message-ID: <20040916192641.GG28659@tausq.org>
References: <20040916172131.GF28936@baldric.uwo.ca>
	<200409161919.i8GJJk7v007348@hiauly1.hia.nrc.ca>
Reply-To: Randolph Chung <randolph@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200409161919.i8GJJk7v007348@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I'm not sure that this is a syscall problem although it might be.  There
> weren't any syscalls between the load for r3 and when it was used as far
> as I can tell.  So, if this is a syscall problem, it would have to be a
> syscall that was done in a signal handler.  The difficulty in writing
> a program such as that suggested above is that it has to somehow test
> all the return paths in the kernel for each syscall.

yeah, possibly it's something in one of the interruption paths.

Dave, do you have any comments on this:
http://marc.theaimsgroup.com/?l=linux-ia64&m=109507921717647&w=2

do you think this could be causing problems for us too? (do you do any
stracing/gdb during your tests?)

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
