Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6F71048B7
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Aug 2003 10:50:58 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h7PGokI31194;
	Mon, 25 Aug 2003 12:50:46 -0400
Subject: Re: [parisc-linux] Re: [parisc-linux-cvs] linux carlos
From: James Bottomley <James.Bottomley@steeleye.com>
To: Grant Grundler <grundler@parisc-linux.org>
Cc: Joel Soete <jsoe0708@tiscali.be>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <20030825164553.GB28778@dsl2.external.hp.com>
References: <3F2E2C7700004E38@ocpmta2.freegates.net>
	<20030825164553.GB28778@dsl2.external.hp.com>
Content-Type: text/plain
Date: 25 Aug 2003 11:50:45 -0500
Message-Id: <1061830247.2044.165.camel@mulgrave>
Mime-Version: 1.0
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

On Mon, 2003-08-25 at 11:45, Grant Grundler wrote:
> PAT PDC (L-/N-class and A500) have hard coded numbers for CPUs.
> parisc-linux only uses logical CPU numbers to avoid sparsely populated
> arrays. parisc-linux can get the "Physical CPU #" from PAT PDC.
> See code inside USE_PAT_CPUID in arch/parisc/kernel/processor.c.
> You might hack that code a bit so you can correlate logic to physical
> CPU numbers.

Not for 2.6 we shouldn't.  The beginnings of the hotplug CPU API made
logical CPU numbers deprecated (even for x86, which was the worst
logical vs phsyical number abuser).  We need to move entirely to
physical numbers only for 2.6

James
