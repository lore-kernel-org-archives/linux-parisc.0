Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 926854829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  5 Jan 2003 08:19:46 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18VCYu-0005NT-00; Sun, 05 Jan 2003 15:19:40 +0000
Date: Sun, 5 Jan 2003 15:19:40 +0000
From: Matthew Wilcox <willy@debian.org>
To: Chema <jmpbox@etsin.upm.es>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] PCI video card.
Message-ID: <20030105151940.I19239@parcelfarce.linux.theplanet.co.uk>
References: <20030105215425.4CA8BF126@setsin.etsin.upm.es> <20030105145952.G19239@parcelfarce.linux.theplanet.co.uk> <20030105222514.221A0F12B@setsin.etsin.upm.es>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030105222514.221A0F12B@setsin.etsin.upm.es>; from jmpbox@etsin.upm.es on Sun, Jan 05, 2003 at 05:25:14PM -0500
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

On Sun, Jan 05, 2003 at 05:25:14PM -0500, Chema wrote:
> Thanks Matthew:
> so, do you mean those cards would work in such systems (Dino / Cujo / Elroy) ?

Maybe.  It depends whether the driver supports fully initialising the card
or whether it requires the on-card BIOS to have been run.  Most fall into
the second category, alas.  This must surely be a FAQ by now ...

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
