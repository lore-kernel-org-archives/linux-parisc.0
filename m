Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 525F2482C
	for <parisc-linux@lists.parisc-linux.org>; Mon, 12 Nov 2001 03:48:40 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 163Edo-0007H6-00
	for parisc-linux@lists.parisc-linux.org; Mon, 12 Nov 2001 12:48:36 +0200
Date: Mon, 12 Nov 2001 12:49:14 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: "Craig D. Lansing (root)" <lansing@beldar.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] J2240 - Almost There...
Message-ID: <20011112124914.A17993@dogbert.localdomain>
References: <3BEF3746.FB93DC1@beldar.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BEF3746.FB93DC1@beldar.com>
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

Hello,

What I would do is the following:

1. Get the latest working kernel from ftp.parisc-linux.org 
(linux-20011108 should do).

2. Compile (or cross-compile with xc-latest) it, and use tftp/bootp (I
think?) to boot the resulting lifimage from make palo. See how far that
gets you.

Regards,

Albert
