Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BF20482D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 16 Jul 2003 18:36:36 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19cwl8-0007es-RO; Thu, 17 Jul 2003 01:36:34 +0100
Date: Thu, 17 Jul 2003 01:36:34 +0100
From: Matthew Wilcox <willy@debian.org>
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Cc: parisc-linux@lists.parisc-linux.org,
	Randolph Chung <tausq@debian.org>, Matthew Wilcox <willy@debian.org>
Subject: Re: [parisc-linux] 2.6.0-test1-pa1, fails, to, boot, on, rp2430
Message-ID: <20030717003634.GS23808@parcelfarce.linux.theplanet.co.uk>
References: <20030717001528.GA20610@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030717001528.GA20610@systemhalted>
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

On Wed, Jul 16, 2003 at 08:15:28PM -0400, Carlos O'Donell wrote:
> Linux version 2.6.0-test1-pa0 (tausq@ios) (gcc version 3.0.4) #112 Tue Jul 15 22:35:45 PDT 2003

try updating to -pa1 ... the misplaced BUG() is gone.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
