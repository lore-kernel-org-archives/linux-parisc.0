From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Re: 64-bit long double support.
Date: Fri, 17 Nov 2006 11:48:50 -0500 (EST)
Message-ID: <200611171648.kAHGmorq011765@hiauly1.hia.nrc.ca>
References: <200611170129.45825.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: dave.anglin@nrc.ca,
 parisc-linux@lists.parisc-linux.org
To: vapier@gentoo.org (Mike Frysinger)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200611170129.45825.vapier@gentoo.org> from "Mike Frysinger" at
	Nov 17, 2006 01:29:44 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > It would appear that the adddi3 expander in pa.md isn't used for some
> > reason in the initial code expansion as it would reject the insn.  You
> > are in the best position to determine where the insn is being emitted fro=
> m.
> > It could be being emitted from the generic code or the PA backend.  Try
> > breaks on emit_move_sequence, emit_insn, emit_insn_after or
> > emit_insn_before and see if you can find where the insn is being emitted.
> 
> erm, i've never debugged gcc before ... my experience involves producing=20
> reduced test cases and getting others to verify/fix gcc :)

If you add -v to the gcc command line, the driver will output the
command it uses to run cc1.  This is needed to debug cc1.

GCC is a volunteer based project, so help is always welcome.  I got
involved when similar issues affected the projects that I was working
on.

There's always bugs (e.g., mainline is currently broken for both 32
and 64 bits on hpux).  There are over 50 open PRs for hppa.  There
are more critical issues that need to be resolved for the upcoming
4.2.0 release.  Most people do native builds and the problem doesn't
appear there.  Fixing this requires finding a suitable 64-bit host to
debug it on.

This problem should be relatively easy to fix if we know where and
why the insn is being emitted.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
