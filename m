Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from the-village.bc.nu (router-100M.swansea.linux.org.uk [194.168.151.17])
	by dsl2.external.hp.com (Postfix) with ESMTP id 24014482A
	for <parisc-linux@parisc-linux.org>; Fri, 20 Apr 2001 07:20:43 -0600 (MDT)
Subject: Re: [parisc-linux] Re: OK, let's try cleaning up another nit. Is anyone paying attention?
To: esr@thyrsus.com
Date: Fri, 20 Apr 2001 14:08:25 +0100 (BST)
Cc: willy@ldl.fc.hp.com (Matthew Wilcox),
	linux-kernel@vger.kernel.org, parisc-linux@parisc-linux.org
In-Reply-To: <20010419230009.A32500@thyrsus.com> from "Eric S. Raymond" at Apr 19, 2001 11:00:09 PM
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Message-Id: <E14qaeC-0001DZ-00@the-village.bc.nu>
From: Alan Cox <alan@lxorguk.ukuu.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

> What is the right procedure for doing changes like this?  Is "don't
> touch that tree" a permanent condition, or am I going to get a chance
> to clean up the global CONFIG_ namespace after your next merge-down?

Feeding arch related stuff to the architecture maintainers.

> That's the main thing I'm after right now -- I want to cut down on
> the false positives in my orphaned-symbol reports so that the actual
> bugs will stand out.

Teach it to read a 'symbolstoignore' file.

Part of the problem you are hitting right now is that most architectures are
not yet fully in sync with 2.4 nor likely to all be for another few iterations.
