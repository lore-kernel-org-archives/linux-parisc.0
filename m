Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 743B1482B
	for <parisc-linux@lists.parisc-linux.org>; Tue, 30 Apr 2002 20:09:15 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 172jY9-0000nl-00; Wed, 01 May 2002 03:08:57 +0100
Date: Wed, 1 May 2002 03:08:57 +0100
From: Matthew Wilcox <willy@debian.org>
To: James Braid <james.braid@peace.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] mkraid doesnt work on L2000 with 64-bit kernel
Message-ID: <20020501030857.A2591@parcelfarce.linux.theplanet.co.uk>
References: <20020501004239.75E8B482B@dsl2.external.hp.com> <014c01c1f0af$0d0db630$5e01000a@bongo>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <014c01c1f0af$0d0db630$5e01000a@bongo>; from james.braid@peace.com on Wed, May 01, 2002 at 01:25:17PM +1200
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

On Wed, May 01, 2002 at 01:25:17PM +1200, James Braid wrote:
> Woohoo! Just rebooted the L2000 and RAID is now working on it :)

Yay!  Apply for your "I hacked the PA/Linux kernel" badge at the office ;-)

> How do I go about submitting a patch (sorry, I am a complete newbie
> to kernel stuff). 

If it's small (say <20k), post it here.  If larger, put it on a
website and send a URL.

> Basically all I have done is copy the RAID section from the sparc64
> ioctl32.c into the parisc ioctl32.c file, and fix up the md.h
> include.

Cool.  That works for us ;-)

-- 
Revolutions do not require corporate support.
