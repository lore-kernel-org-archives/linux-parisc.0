Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E7DA84852
	for <parisc-linux@parisc-linux.org>; Fri,  3 Oct 2003 06:12:44 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A5Onb-0006BS-1f
	for parisc-linux@parisc-linux.org; Fri, 03 Oct 2003 13:12:43 +0100
Received: from master.debian.org ([146.82.138.7]:50855)
	by www.linux.org.uk with esmtp (Exim 4.22)
	id 1A5ORi-00062v-BT
	for willy@ftp.uk.linux.org; Fri, 03 Oct 2003 12:50:06 +0100
Received: from parcelfarce.linux.theplanet.co.uk (www.linux.org.uk) [195.92.249.252]
	by master.debian.org with esmtp (Exim 3.35 1 (Debian))
	id 1A5ORe-0006Pl-00; Fri, 03 Oct 2003 06:50:02 -0500
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A5ORb-00062e-FJ; Fri, 03 Oct 2003 12:49:59 +0100
Date: Fri, 3 Oct 2003 12:49:59 +0100
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: Matthew Wilcox <willy@debian.org>,
	Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Subject: Re: [parisc-linux] L2000/N4000 smp devices/boot compare??
Message-ID: <20031003114959.GM24824@parcelfarce.linux.theplanet.co.uk>
References: <20031003001810.GH24824@parcelfarce.linux.theplanet.co.uk> <3F704CAF0000522B@ocpmta2.freegates.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3F704CAF0000522B@ocpmta2.freegates.net>
Resent-Message-Id: <E1A5Onb-0006BS-1f@www.linux.org.uk>
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

On Fri, Oct 03, 2003 at 08:15:03AM +0200, Joel Soete wrote:
> Derek, Matthew,
> 
> Thanks a lot for those clarification.
> As I try, without any success :(, to find where 'rules for non-coherent aliases'
> are not respected, I will waiting for a fix.

Well, it's hard.  Consider a page in the page cache.  It has a kernel
address and one-or-more user addresses.  The user addresses all follow the
coherency rules but the kernel address doesn't.  If you look in Appendix F,
we're not allowed to have multiple write-capable translations to the same
address.

I think the only way to solve this is by (ab)using kmap to ensure that
kernel pages are only accessed via coherent mappings.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
