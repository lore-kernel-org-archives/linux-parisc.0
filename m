Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 9D67C482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 08:02:49 -0600 (MDT)
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
To: esr@thyrsus.com
Date: Fri, 20 Apr 2001 15:03:06 +0100 (BST)
Cc: alan@lxorguk.ukuu.org.uk (Alan Cox),
	acahalan@cs.uml.edu (Albert D. Cahalan),
	willy@ldl.fc.hp.com (Matthew Wilcox),
	james.rich@m.cc.utah.edu (james rich), linux-kernel@vger.kernel.org,
	parisc-linux@parisc-linux.org
In-Reply-To: <20010420095302.A5674@thyrsus.com> from "Eric S. Raymond" at Apr 20, 2001 09:53:02 AM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14qbV6-0001KI-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> OK, so maybe I'm being stupid.  But the implication of this talk of separate
> port trees and architecture merges is that these guys periodically send big
> resync patches to you and Linus.
> 
> If that's not what's going on, what is?

People send batches of small fixes to Linus or to me. So for example the S/390
folks send me things like 'fix the mm layer to match the changes in 2.4.3'
and 'Update the DASD storage driver'. Each of which fixes one thing or one
set of things and is easy to check on its own
