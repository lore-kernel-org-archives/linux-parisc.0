Return-Path: <hch@lst.de>
Received: from mail.lst.de (verein.lst.de [212.34.189.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id C9EB84854
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 18 Dec 2003 00:25:30 -0700 (MST)
Date: Thu, 18 Dec 2003 08:25:06 +0100
From: Christoph Hellwig <hch@lst.de>
To: parisc-linux@lists.parisc-linux.org,
	vserver@list.linux-vserver.org
Subject: Re: [parisc-linux] syscall number for vserver
Message-ID: <20031218072506.GA8142@lst.de>
References: <20031217221618.GC9313@MAIL.13thfloor.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20031217221618.GC9313@MAIL.13thfloor.at>
Cc: 
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Wed, Dec 17, 2003 at 11:16:18PM +0100, Herbert Poetzl wrote:
> 
> Hi everyone!
> 
> I would like to 'officially' reserve a syscall number
> for parisc(64)/vserver ... 

The syscall is the typical multiplexer crap, so an actual submission
wouldn't have any chance.  Please fix up your junk beofe trying to
play the reserve a syscall scheme.  This didn't work for afs or
LSM either.
