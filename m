Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp.umr.edu (mrelay.cc.umr.edu [131.151.1.89])
	by dsl2.external.hp.com (Postfix) with ESMTP id B083F49F1
	for <parisc-linux@lists.parisc-linux.org>; Fri,  5 Oct 2001 10:26:27 -0600 (MDT)
Message-ID: <6CAC36C3427CEB45A4A6DF0FBDABA56D86D86D@umr-mail03.cc.umr.edu>
From: "Neulinger, Nathan" <nneul@umr.edu>
To: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Date: Fri, 5 Oct 2001 11:26:27 -0500 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
Subject: [parisc-linux] config.guess/config.sub support?
List-ID: <linux-parisc.vger.kernel.org>

Are there any patches for config.guess/config.sub to add reasonable support
for parisc-linux? Right now, the ones 

I was able to get reasonable config.sub behavior by adding a basic_machine
check for parisc-unknown, but has anyone submitted anything better to the
maintainers?

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216
