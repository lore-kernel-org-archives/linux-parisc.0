Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 335A44852
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 18:18:12 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A5De6-0000XY-Vo; Fri, 03 Oct 2003 01:18:10 +0100
Date: Fri, 3 Oct 2003 01:18:10 +0100
From: Matthew Wilcox <willy@debian.org>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: Joel Soete <soete.joel@tiscali.be>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] L2000/N4000 smp devices/boot compare??
Message-ID: <20031003001810.GH24824@parcelfarce.linux.theplanet.co.uk>
References: <3F5CB6FB0000C2D7@ocpmta1.freegates.net> <20031002233801.23113.qmail@web12508.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031002233801.23113.qmail@web12508.mail.yahoo.com>
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

[Derek, could you possibly wrap your mails around 70 columns?  It's hard
to read/reply to your mails.]

On Thu, Oct 02, 2003 at 04:38:01PM -0700, Derek Engelhaupt wrote:
> First off, since the N, L, and A class are of the same generation
> of machines they are similar in some respects.  Different in others.
> The L1000 and L2000 have a system card unique to that set of machines.
> Being that as it is, the L1000/2000 probably use a different I/O
> interface chip.  The L1500 and L3000 are in essence an N Class system
> card cut in half and therefore use the same I/O interface as the N.
> The GSP in the L Class resides in the PCI card cage with the GSP in the
> N Class is a seperate card attaching directly to the system card via the
> hot swap disk backplane.  The extra unknown system buses probably reside
> on the GSP of the N Class.  That would be my educated guess of what the
> unknown system buses are.  The N has two IKEs since it has both a left
> and a right PCI card cage attached directly to the system board.

According to the IO-ACD, these are actually the processors:

   Prelude W+ 540                        | NPROC  |  00004    91  |   5D3

A500/L1000/L2000 use Astro/Elroy just like the B/C/J class.  L1500/L3000/N
use Ike and Stretch in place of Astro.  I once downloaded an N-class PDF
which I've subsequently lost.  If I remember correctly, it looked like:

     CPU --+-- CPU          RAM          CPU --+-- CPU
          DEW              |||||              DEW
  +--------+--------+---- Stretch ----+--------+------+
 IKE               DEW               DEW             IKE
|||||         CPU --+-- CPU     CPU --+-- CPU       |||||
Ropes                                               Ropes

(Elroys on the end of the ropes, of course).

My understanding is that Stretch is the problem.  We don't follow the
rules for non-coherent aliases and Stretch isn't as lenient as other
memory controllers.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
