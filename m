Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AA454857
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 13:06:29 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D878@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Fri, 5 Oct 2001 14:06:24 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: [parisc-linux] openafs on parisc-linux
List-ID: <linux-parisc.vger.kernel.org>

I just submitted patches to get the OpenAFS user space and kernel module to
build cleanly on parisc-linux. Unfortunately, the kernel module oops when
loaded, but that should hopefully not be too tragic to resolve.

Hopefully those patches should get committed soon, at which point I could
use any assistance tracking down the reason for the panic. 

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216
