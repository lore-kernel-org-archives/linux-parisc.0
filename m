Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6ED9A4829
	for <parisc-linux@lists.parisc-linux.org>; Thu,  3 Apr 2003 08:07:57 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 1916Jo-0001g4-2w; Thu, 03 Apr 2003 16:07:56 +0100
Date: Thu, 3 Apr 2003 16:07:56 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ricardo Jose Guevara Ochoa <jguevara@unitec.edu>
Cc: Matthew Wilcox <willy@debian.org>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Kernel 2.4.20 build error
Message-ID: <20030403150756.GF29376@parcelfarce.linux.theplanet.co.uk>
References: <5849494679bc7010.79bc701058494946@unitec.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5849494679bc7010.79bc701058494946@unitec.edu>
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

On Thu, Apr 03, 2003 at 08:55:11AM -0600, Ricardo Jose Guevara Ochoa wrote:
> > 
> > turn on CONFIG_PROC_FS
> 
> Where do i turn it on? in a file /arch/parisc/defconfig it's already 
> turn on.

that's only the default configuration.  Your configuration is in .config

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
