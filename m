Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id CAA21096
	for <parisc-linux@puffin.external.hp.com>; Thu, 25 May 2000 02:35:26 -0600
Received: from dyn129-ras34.screaming.net (HELO rhirst.linuxcare.com) (postfix@212.188.129.129)
  by mailserv2.iuinc.com with SMTP; 25 May 2000 08:35:43 -0000
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 54D3FB009; Thu, 25 May 2000 09:35:30 +0100 (BST)
Date: Thu, 25 May 2000 09:35:30 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] [MERGE] trouble files
Message-ID: <20000525093530.C1338@linuxcare.com>
References: <20000523200750.F17536@thepuffingroup.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20000523200750.F17536@thepuffingroup.com>; from willy@thepuffingroup.com on Tue, May 23, 2000 at 08:07:50PM -0400
List-ID: <linux-parisc.vger.kernel.org>

On Tue, May 23, 2000 at 08:07:50PM -0400, willy@thepuffingroup.com wrote:
> 
> the following list of files (if I remember to attach them this time...)
> are the files which have been modified in both the parisc tree and Linus'
> 2.3.99pre8 tree.  I've omitted the files where the rcs id is the only thing
> changed.

> drivers/net/82596.c

I don't believe we use that; I guess we started modifying it and then
created our own lasi_82596.c from it.  I'll check if anything that
changed in 82596.c needs feeding back in to lasi_82596.c.

Richard
