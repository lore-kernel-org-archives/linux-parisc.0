Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 542514829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  8 May 2003 07:33:02 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19DlW8-0001o3-G1; Thu, 08 May 2003 14:33:00 +0100
Date: Thu, 8 May 2003 14:33:00 +0100
From: Matthew Wilcox <willy@debian.org>
To: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [PATCH-linux-2.5] Add missing include to OProfile
Message-ID: <20030508133300.GG29534@parcelfarce.linux.theplanet.co.uk>
References: <20030508054607.GP27494@lug-owl.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030508054607.GP27494@lug-owl.de>
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

On Thu, May 08, 2003 at 07:46:09AM +0200, Jan-Benedict Glaw wrote:
> Hi!
> 
> With OProfile <m>odularized, this patch is needed to build it:

Thanks; I noticed it myself earlier this morning.  Committed.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
