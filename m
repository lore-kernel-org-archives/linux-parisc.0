From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] c3k panics
Date: Wed, 1 Jun 2005 09:55:22 -0400 (EDT)
Message-ID: <200506011355.j51DtMlE026257@hiauly1.hia.nrc.ca>
References: <4282FEEC00007CF4@mail-2-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4282FEEC00007CF4@mail-2-bnl.tiscali.it> from "Joel Soete" at Jun
	1, 2005 03:11:55 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> > > Ok clear but still confused why 32bit branch doesn't nullify the insn
> > > in delay slot like did 64bit?
> > 
> > it's a bug, but fortunately that copy of the fixup_branch macro (in
> > syscall.S) isn't actually used ;-) I'll remove it.
> > 
> mmm, it seems that I am ongoing to become blind (to miss that ?)
> ah no this the night (no idea where stand this dmaned bug) but I was just
> blind by a pocket torch thinking it would be a star :_(

I believe that there's likely more than one bug.  After working around
the memory management bug, I tried a number of gcc builds.  Two crashes
occurred as previously reported.  I also had a third crash.  In this
one, the TOC IIA Offset value pointed into "userspace".  These all
occurred with only a few hours of running time.

I then switched from vmlinux-2.6.11-pa4-c3000_defconfig to
vmlinux-2.6.8.1-pa11-c3000_defconfig.  This kernel seems ok.  It's
survived one binutils and three full gcc builds.  However, there are
seven fails in the libstdc++ testsuite that don't occur with 2.6.11.
On the otherhand, I'm seeing a few Java processes not terminate with
2.6.11-pa4.  This problem doesn't seem to be present in 2.6.8.1-pa11
and Grant's 64-bit version of 2.6.11-pa4 on gsyprf11.

I'm going to try a few more kernels to see if it's possible to isolate
the change that introduced the problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
