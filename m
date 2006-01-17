From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [Fwd: [patch/hppa] Floating point exception
Date: Mon, 16 Jan 2006 21:33:35 -0500 (EST)
Message-ID: <200601170233.k0H2XZMA010928__39959.6159616069$1416623994$gmane$org@hiauly1.hia.nrc.ca>
References: <20060117021853.GA20607@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org,
 debian-hppa@lists.debian.org,
 debian-release@lists.debian.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20060117021853.GA20607@colo.lackof.org> from "Grant Grundler" at
	Jan 16, 2006 07:18:53 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Debian "testing" (etch) is officially using gcc 4.0, right?

The biggest impact is on glibc and code that uses the math "c" routines,
like csqrt () in libm.  I don't have any idea how many packages this
affects, but I doubt it's a lot.  This isn't an issue for hpux since
the HP library doesn't provide complex support under C at the moment.

I'm sorry I didn't spot this before when I worked on fixing the
passing of small structs.  However, you only see this stuff when
you debug related problems.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
