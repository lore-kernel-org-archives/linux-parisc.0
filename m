Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cactus.bheadley.org (d247.focal4.interaccess.com [207.208.139.247])
	by dsl2.external.hp.com (Postfix) with ESMTP id F1229482D
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Jun 2001 10:33:08 -0600 (MDT)
Received: from interaccess.com (IDENT:bheadley@cactus.bheadley.org [192.168.0.6])
	by cactus.bheadley.org (8.11.0/8.11.0) with ESMTP id f5HGiYR02081
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Jun 2001 11:44:38 -0500
Message-ID: <3B2CDE72.4010006@interaccess.com>
Date: Sun, 17 Jun 2001 11:44:34 -0500
From: "Bryan W. Headley" <bheadley@interaccess.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Subject: [parisc-linux] Booting up C110
List-ID: <linux-parisc.vger.kernel.org>

    Wasn't getting too far using the STI console, so I switched to the 
serial console at the boot monitor. Sadly, no text appears on my 
laptop-based "terminal", connected with null-modem cable. Also, the 
unit's doesn't appear to respond to the built-in keyboard, either.

So, 1) how do I reset the boot PROM to use the graphics card/monitor again?
2) Any help on getting 0.9 or any other kernel booting would be a great 
help...

(It has booted, to the point of displaying kernel sign-on messages, then 
complaining about not being able to allocate a console, so I know things 
"sort-of" work)

-- 
____               .:.                 ____
Bryan W. Headley - bheadley@interaccess.com
