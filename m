From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] (hppa glibc 2.3.3 exp.) Recompile expect, then run
Date: Sat, 25 Sep 2004 11:16:38 -0400 (EDT)
Message-ID: <200409251516.i8PFGcog005801@hiauly1.hia.nrc.ca>
References: <20040925123745.GZ27033@baldric.uwo.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@parisc-linux.org
To: carlos@baldric.uwo.ca (Carlos O'Donell)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040925123745.GZ27033@baldric.uwo.ca> from "Carlos O'Donell" at
	Sep 25, 2004 08:37:54 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > if i run the "as" command manually it seems to work.
> 
> I think something is broken with expect. Kernel builds seem to progress
> well. I'm running a glibc build right now to see if we pickup any
> regressions.

Actually, I think this is the register corruption issue that I've
mentioned before.  I've seen it affect expect, sh, make, and gcj.
I had a gdb testsuite die two days ago with a SEGV in expect that
looked as if r19 had been clobbered.  It was 0 in a shared library.
I don't know how it got to be 0 though.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
