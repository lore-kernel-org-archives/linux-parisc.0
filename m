Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id TAA03507
	for <parisc-linux@puffin.external.hp.com>; Thu, 16 Nov 2000 19:21:28 -0700
To: parisc-linux@thepuffingroup.com
Cc: drepper@cygnus.com, alan_c_meyer@am.exch.hp.com
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 16 Nov 2000 19:25:26 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20001117022526.4B38637CA7@carmen.fc.hp.com>
Subject: [parisc-linux] glibc merged to 2.2
List-ID: <linux-parisc.vger.kernel.org>

Today Paul Bame and I merged/updated the puffin.external.hp.com glibc cvs to 
glibc 2.2. After the merge I cleaned up the differences between our cvs and 
2.2, mostly comment differences and formatting changes. With the exception of 
the setjmp problem mentioned in,

http://puffin.external.hp.com/mailing-lists/parisc-linux/2000/11-Nov/0091.html

and the fact that we have/need newer "scripts/config.guess" and 
"scripts/config.sub", we are completely sync'ed up with glibc 2.2.

-- 
Matt Taggart
taggart@fc.hp.com
