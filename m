Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id C8278482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 14:54:48 -0600 (MDT)
To: esr@thyrsus.com
Date: Fri, 20 Apr 2001 21:55:14 +0100 (BST)
Cc: willy@ldl.fc.hp.com (Matthew Wilcox),
	linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
In-Reply-To: <20010420154743.A19618@thyrsus.com> from "Eric S. Raymond" at Apr 20, 2001 03:47:43 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14qhvx-0002BR-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Subject: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
List-ID: <linux-parisc.vger.kernel.org>

> CONFIG_BINFMT_SOM: arch/parisc/config.in arch/parisc/defconfig
> Not used in code anywhere.  Can you get rid of this one?

Its used in the parisc tree as are most of the others you see. You probably want
to simply skip processing arch/parisc
