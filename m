Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 592324841
	for <parisc-linux@parisc-linux.org>; Sun,  9 Nov 2003 10:48:38 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1AItfs-0002T6-9L; Sun, 09 Nov 2003 17:48:32 +0000
Date: Sun, 9 Nov 2003 17:48:32 +0000
From: Matthew Wilcox <willy@debian.org>
To: Joel Soete <soete.joel@tiscali.be>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] 2.4 64bits MAX_ADDRESS ?
Message-ID: <20031109174832.GD2014@parcelfarce.linux.theplanet.co.uk>
References: <3FAE7B44.6020805@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3FAE7B44.6020805@tiscali.be>
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

On Sun, Nov 09, 2003 at 05:37:08PM +0000, Joel Soete wrote:
> which correctly warm me about some 'overflow':
> 
> foo.c: In function `main':
> foo.c:42: warning: left shift count >= width of type
> foo.c:42: warning: left shift count >= width of type
> 
> afaik MAX_ADDRBITS==39 against a long contains only 32bits?

no, long is 64-bit in LP64.  that's what LP64 means.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
