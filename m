Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 243514840
	for <parisc-linux@lists.parisc-linux.org>; Sat,  8 Mar 2003 16:11:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18rnTR-0005Pe-00; Sat, 08 Mar 2003 23:11:25 +0000
Date: Sat, 8 Mar 2003 23:11:25 +0000
From: Matthew Wilcox <willy@debian.org>
To: "David S. Miller" <davem@redhat.com>
Cc: grundler@dsl2.external.hp.com, jsm@udlkern.fc.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: RFC: mmap patch
Message-ID: <20030308231125.M3865@parcelfarce.linux.theplanet.co.uk>
References: <200303061414.HAA26321@udlkern.fc.hp.com> <20030308063043.GB27859@dsl2.external.hp.com> <20030307.222945.32673395.davem@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030307.222945.32673395.davem@redhat.com>; from davem@redhat.com on Fri, Mar 07, 2003 at 10:29:45PM -0800
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

On Fri, Mar 07, 2003 at 10:29:45PM -0800, David S. Miller wrote:
> If you flush caches exactly what sparc64 does in 2.5.x, and you do
> have a virtually indexed, physically tagged cache, you should have no
> correctness.  I've stressed that port to no end (in particular the LTP
> suite has a great mmap/read/write coherency tester), and if there are
> holes I'd like to know about them :-)

One other difference you forgot is that Sparc64 has writethrough caches
and PA has writeback caches.  This can make a difference.

> The most crucial area to get efficient flushing is the
> {copy,clear}_user_page implementation.  If you use temporary kernel
> mappings mapped at virtual addresses matching the virtual color that
> the user's mappings will have, this avoids virtually ALL of the
> flushing for anonymous pages.  I haven't noticed too many ports pick
> up this trick even though I mention it in cachetlb.txt.

I've certainly been thinking about doing it, but you're right we don't
do it yet.

> On sparc64 I even save the original TLB entries before the flush
> and restore them afterwards, so there is no TLB traffic as a result
> of doing these temp mappings.

Nice trick.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
