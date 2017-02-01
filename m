From: Mikulas Patocka <mpatocka@redhat.com>
Subject: crashes in 4.10 because of "parisc: Enable KASLR"
Date: Wed, 1 Feb 2017 12:37:33 -0500 (EST)
Message-ID: <alpine.LRH.2.02.1702011234060.25046@file01.intranet.prod.int.rdu2.redhat.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org,
        John David Anglin <dave.anglin@bell.net>
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

Hi

I had some crashes on parisc with the kernel 4.10 and I tracked them to 
the patch 18d98a79382cbe5a7569788d5b7b18e7015506f2 "parisc: Enable KASLR".

The crashes can be reproduced by compiling kernel in a loop - a crash 
happens in a few hours. I have a C8000 workstation with two dual-core 
PA8900 CPUs.

The kernel 4.9 is stable, 4.9 with the patch 18d98a79 isn't.

Mikulas
