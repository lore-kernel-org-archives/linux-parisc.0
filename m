Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 0F839482A
	for <parisc-linux@parisc-linux.org>; Wed, 31 Jul 2002 01:04:00 -0600 (MDT)
Date: Wed, 31 Jul 2002 00:08:35 -0700
From: Randolph Chung <randolph@tausq.org>
To: j.steindlberger@gmx.net
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] IEEE1394 (Firewire iLink) - any ideas to build modules
Message-ID: <20020731070835.GG1419@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <20020731065644.41D59482A@dsl2.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020731065644.41D59482A@dsl2.external.hp.com>
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

> did anyone succeed in building modules for an OHCI1394 card? I think the 
> problem is a general leck in DMA support. As I'm not a kernel specialist I 
> don't have any idea.
> When trying to build a module there are dependency problems. When trying to 
> build into the kernel there are missing some functions for DMA - I think.

what config did you use, and what errors did you see?

i'm not sure what you mean by "a general lack in DMA support"... DMA
works quite well :)

randolph
--  
Randolph Chung
Debian GNU/Linux Developer, hppa/ia64 ports
http://www.tausq.org/
