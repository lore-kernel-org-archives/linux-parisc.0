Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from palrel12.hp.com (palrel12.hp.com [156.153.255.237])
	by dsl2.external.hp.com (Postfix) with ESMTP id E1DE74829
	for <parisc-linux@parisc-linux.org>; Fri, 10 Jan 2003 15:30:41 -0700 (MST)
Reply-To: <jim.hull@hp.com>
From: "Jim Hull" <jim.hull@hp.com>
To: "'John David Anglin'" <dave@hiauly1.hia.nrc.ca>
Cc: <randolph@tausq.org>, <parisc-linux@parisc-linux.org>
Subject: RE: [parisc-linux] Re: floating point exception error
Date: Fri, 10 Jan 2003 14:30:39 -0800
Message-ID: <005c01c2b8f7$e79cc8c0$6763f40f@cup.hp.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
In-Reply-To: <200301101848.h0AImToB004181@hiauly1.hia.nrc.ca>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

David, you wrote:

> I looked at the assembly code.  The original test was done under hpux.
> I see that the call to ull2dbl has been optimized out of the loop.  It
> is just called once.  So, the code probably is trapping there as well.

Ok, that's good to hear.  Your info, along with Randolph's info that it
traps on the 8500, 8600, and 8700 CPUs, leads me to the same conclusion
as Randolph came to.  It looks like there's something wrong with the
fcnv emulation in the linux kernel's emulation handler, even though it
was derived from the hpux handler, where everything appears to work
fine.

 -- Jim
