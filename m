Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 76DEE4884
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Aug 2003 13:39:48 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19oTNS-0007CX-CE; Sun, 17 Aug 2003 20:39:46 +0100
Date: Sun, 17 Aug 2003 20:39:46 +0100
From: Matthew Wilcox <willy@debian.org>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [RFC] change corefile OSABI to ELFOSABI_LINUX
Message-ID: <20030817193946.GO19630@parcelfarce.linux.theplanet.co.uk>
References: <20030817192923.GO21328@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20030817192923.GO21328@tausq.org>
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

On Sun, Aug 17, 2003 at 12:29:24PM -0700, Randolph Chung wrote:
> Should we make the two consistent? Here's a patch that sets OSABI to
> Linux for corefile generation. We will still need the bfd code for
> backward compatibility, but moving forward it'll be good for things to
> be more consistent :)
> 
> comments?

Looks good, do you want to commit it to 2.4 and 2.6?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
