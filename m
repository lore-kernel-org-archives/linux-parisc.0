Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8E998482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 23 Jul 2002 12:15:05 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17X4Bc-0002CW-00
	for parisc-linux@lists.parisc-linux.org; Tue, 23 Jul 2002 19:15:04 +0100
Date: Tue, 23 Jul 2002 19:15:04 +0100
From: Matthew Wilcox <willy@debian.org>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020723191504.H3052@parcelfarce.linux.theplanet.co.uk>
References: <20020723180834.78C36482C@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020723180834.78C36482C@dsl2.external.hp.com>; from willy@dsl2.external.hp.com on Tue, Jul 23, 2002 at 12:08:34PM -0600
Subject: [parisc-linux] Re: [parisc-linux-cvs] linux-2.5 willy
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

On Tue, Jul 23, 2002 at 12:08:34PM -0600, Matthew Wilcox wrote:
> Modified files:
> 	drivers/video  : Config.in Makefile fbcon-sti.c fbmem.c 
> Added files:
> 	drivers/video/sti: Makefile sticon.c sticore.c sticore.h stifb.c 
> Removed files:
> 	drivers/video  : sti-bmode.h sti.h sticon-bmode.c sticon.c 
> 	                 sticore.c stifb.c 
> Log message:
> merge 2.4 STI changes into 2.5 tree.

could someone more competent than myself check over these changes?  they
seem right to me, but there have been some moderately hairy changes made
to the FB subsystem.  stifb_blank should now return an int, not void ...
not sure what to return though ;-)

-- 
Revolutions do not require corporate support.
