Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from maties2.sun.ac.za (maties2.sun.ac.za [146.232.128.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 31A96482C
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 23:04:34 -0700 (MST)
Received: from dogbert.sdsl.sun.ac.za ([146.232.83.63])
	by maties2.sun.ac.za with smtp (Exim 3.33 #3)
	id 161iIe-0000zk-00
	for parisc-linux@lists.parisc-linux.org; Thu, 08 Nov 2001 08:04:28 +0200
Date: Thu, 8 Nov 2001 08:05:16 +0200
From: Albert Strasheim <fullung@ilink.nis.za>
To: Thomas Marteau <marteaut@esiee.fr>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 720/50 update
Message-ID: <20011108080516.A1857@dogbert.localdomain>
References: <fullung@ilink.nis.za> <20011107023007.A12882@dogbert.localdomain> <200111070700.AAA08983@puffin.external.hp.com> <20011107163116.A8527@dogbert.localdomain> <20011107200110.C616@dogbert.localdomain> <3BE9799E.8C2C9C77@esiee.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3BE9799E.8C2C9C77@esiee.fr>
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

Hello Thomas,

I'm still doing some tests, but it seems to have fixed my problem (at
least with the apt I rebuilt from source).

Thanks a bunch!

Regards,

Albert

On Wed, 07 Nov 2001, Thomas Marteau wrote:

> Hi Albert,
> 
> 	It seems that export LD_BIND_NOW=1 can correct the bug for apt-get.
> Can you test?
> 
> Thomas.
> ESIEE Team
