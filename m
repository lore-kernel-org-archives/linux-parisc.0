From: Roland McGrath <roland@redhat.com>
Subject: [parisc-linux] Re: [PATCH] fix masking error in fesetround() on hppa
Date: Mon, 2 Dec 2002 18:51:46 -0800
Message-ID: <200212030251.gB32pk213186__20284.8151945092$1416621987$gmane$org@magilla.sf.frob.com>
References: <20021203024358.GA5487@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: libc-alpha@sources.redhat.com, debian-glibc@lists.debian.org,
	parisc-linux@lists.parisc-linux.org
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: Carlos O'Donell's message of  Monday, 2 December 2002 21:43:58 -0500 <20021203024358.GA5487@systemhalted>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

I've put that fix in.  I'm not quite sure what you are suggesting for a new
test, but test cases that fail on known bug regressions (i.e. one that
fails before your fix and works after it) are always welcome.


Thanks,
Roland
