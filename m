Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel7.hp.com (atlrel7.hp.com [192.151.27.9])
	by dsl2.external.hp.com (Postfix) with ESMTP id D6D25482A
	for <parisc-linux@parisc-linux.org>; Fri, 29 Jun 2001 15:34:47 -0600 (MDT)
Received: from carmen.fc.hp.com (carmen.fc.hp.com [15.1.51.72])
	by atlrel7.hp.com (Postfix) with ESMTP id 17A651F603
	for <parisc-linux@parisc-linux.org>; Fri, 29 Jun 2001 17:34:29 -0400 (EDT)
Received: from carmen.fc.hp.com (localhost [127.0.0.1])
	by carmen.fc.hp.com (Postfix) with ESMTP id DCB9937F86
	for <parisc-linux@parisc-linux.org>; Fri, 29 Jun 2001 15:34:46 -0600 (MDT)
To: parisc-linux@parisc-linux.org
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 29 Jun 2001 15:34:46 -0600
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20010629213447.DCB9937F86@carmen.fc.hp.com>
Subject: [parisc-linux] New hppa->hppa64 compiler debs
List-ID: <linux-parisc.vger.kernel.org>

Hi parisc-linux hackers,

I have built new hppa->hppa64 cross-compiler debian packages. They are 
available at,

ftp://puffin.external.hp.com/pub/parisc/binaries/debian/unofficial-debs/

and are called,

binutils-hppa64_2.11.90.0.19.cvs-1_hppa.deb
gcc-hppa64_3.0.ds9-3_hppa.deb

These are unofficial debs and will not be uploaded to the debian archive. 
Eventually there will be a standard way to do cross-compilers in debian and 
we'll switch over to that. Until then I will keep producing these debs as 
needed.

Please report any problems to the list.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
