Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from atlrel6.hp.com (atlrel6.hp.com [156.153.255.205])
	by dsl2.external.hp.com (Postfix) with ESMTP id C2E49482A
	for <parisc-linux@parisc-linux.org>; Mon,  7 Jan 2002 12:53:58 -0700 (MST)
To: "Peter Lavender" <plaven@bigpond.net.au>
Cc: parisc-linux@parisc-linux.org
Subject: Re: Fwd: Re: [parisc-linux] mpg321 on 715/64? 
In-Reply-To: Message from "Peter Lavender" <plaven@bigpond.net.au>
   of "Tue, 08 Jan 2002 06:47:19 +1100." <014501c197b4$1e1f4dc0$090ba8c0@winnie>
References: <E16NYI1-0003EK-00@linuxlab.wdf.sap-ag.de>
 <20020107124029.GF25927@sleepie.demon.co.uk>  <014501c197b4$1e1f4dc0$090ba8c0@winnie>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 07 Jan 2002 12:53:57 -0700
From: Matt Taggart <taggart@carmen.fc.hp.com>
Message-Id: <20020107195357.46BAD37CB8@carmen.fc.hp.com>
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

"Peter Lavender" writes...

> There's a kernel there.  Is this just a drop in  replacement?

Those are tarballs containing the kernel and some other stuff. Untar/gz them 
in /boot.

> While I'm at asking stupid questions, what packages so I need install to
> build kernels?

Use dselect or apt-get to install gcc and it's dependencies from the CD or 
from the Debian archive.

> I installed the 0.9.3 release, but make and it's pals are
> missing.

They are on the CD and available in the Debian archive.

-- 
Matt Taggart        Linux Development Lab
taggart@fc.hp.com   HP Linux Systems Operation
