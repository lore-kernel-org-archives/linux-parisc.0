Return-Path: <randolph@tausq.org>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id 456C74887
	for <parisc-linux@lists.parisc-linux.org>;
	Tue,  6 Apr 2004 09:19:25 -0600 (MDT)
Date: Tue, 6 Apr 2004 08:40:40 -0700
From: Randolph Chung <randolph@tausq.org>
To: James Bottomley <James.Bottomley@steeleye.com>
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux-2.6 jejb
Message-ID: <20040406154040.GD750@tausq.org>
References: <20040405174131.84BF1494194@palinux.hppa>
	<20040406132158.GP26344@baldric.uwo.ca>
	<1081261133.1804.27.camel@mulgrave>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1081261133.1804.27.camel@mulgrave>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
Reply-To: Randolph Chung <randolph@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

> It's possible.  As global flushes get removed any lurking holes in the
> rest of the API will emerge when they stop being covered by the global
> flush.

i also saw a weird problem last night where i suddenly ran out of
memory (1.5G physical + 500MB swap) and the OOM killer killed lots of
apache processes. Earlier I was running a gdb testsuite and had to kill
a bunch of stuck processes (there's some problems in gdb that i'm
debugging...). There are a lot of "protection id trap" messages in my
kernel log. not sure which bit was real and which bit was coincidence
though :(

i'll try this again with an older kernel and see what happens.

randolph
-- 
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
