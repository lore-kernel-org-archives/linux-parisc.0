Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from posti.raketti.net (titan.raketti.net [212.146.0.12])
	by dsl2.external.hp.com (Postfix) with ESMTP id 289F5482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 09:21:45 -0600 (MDT)
Received: from lx01.tietosavo.fi (lx01.tietosavo.fi [212.146.13.66])
	by posti.raketti.net (8.10.0/8.10.0) with ESMTP id f6BFLgE10891
	for <parisc-linux@lists.parisc-linux.org>; Wed, 11 Jul 2001 18:21:43 +0300 (EET DST)
To: parisc-linux@lists.parisc-linux.org
From: "Jari Eskelinen" <jari.eskelinen@enfo.fi>
MIME-Version: 1.0
Date: 11 Jul 2001 18:18:00 +0200
Message-Id: <JA8AAAAAAd8izgABYQABMhINAcxU@enfo.fi>
Content-Type: text/plain; charset=iso-8859-1
Subject: [parisc-linux] 712/60, kernel 2.4.6 and keyboard.
List-ID: <linux-parisc.vger.kernel.org>

Hi!

I have 712/60 machine and I have used 2.4.0-pa30 kernel with it with great success. Today I tried to compile 2.4.6-pa11 kernel (cross-compiling with my P800, it was horrible sloooooow with 721/60 :) and it almost succeeded. Everything else works, but PS/2 keyboard won't just work. Nothing comes to screen when typing. Logging from network works as usual. Kernel seems to recognise keyboard:

PS/2 keyboard controller at 0xf0108000 (irq 69) found, device attached.
Lasi PS/2 wait 3734
PS/2 psaux controller at 0xf0108100 (irq 69) found, device attached.

But it won't work. Mouse works fine, I can login if playing with mouse and gpm (cut r, paste, cut o, paste paste, cut t, paste, cut return, paste etc.) :D

Have anybody similiar experiences and most importantly, can anybody tell how to solve ths problem?

Thanks!

-- 
Jari Eskelinen
