Received: from gin.ext.thepuffingroup.com ([216.208.98.3])
	by puffin.external.hp.com (8.9.3/8.9.3) with ESMTP id KAA09211
	for <parisc-linux@puffin.external.hp.com>; Fri, 3 Mar 2000 10:00:21 -0700
From: willy@thepuffingroup.com
Date: Fri, 3 Mar 2000 10:52:32 -0500
To: Grant Grundler <grundler@cup.hp.com>
Cc: Gyula Matics <gyula_matics@hp.com>, parisc-linux@puffin.external.hp.com
Subject: Re: [parisc-linux] lasi scsi driver
Message-ID: <20000303105232.V9944@thepuffingroup.com>
References: <006601bf8487$e057e010$a94abc0f@hungary.hp.com> <200003022119.NAA11506@milano.cup.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200003022119.NAA11506@milano.cup.hp.com>; from Grant Grundler on Thu, Mar 02, 2000 at 01:19:40PM -0800
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Mar 02, 2000 at 01:19:40PM -0800, Grant Grundler wrote:
> I was just talking about that with someone and thinking we could
> put that in a "common" I/O path. I found "wakeup_bdflush()" but have
> no clue what that does.

that's the kernel demon which writes dirty pages to disk and has nothing
to do with flushing caches, unfortunately.
