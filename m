Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id B3C1F482D
	for <parisc-linux@parisc-linux.org>; Wed, 14 May 2003 16:20:00 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h4EMJSI25092;
	Wed, 14 May 2003 18:19:28 -0400
Subject: Re: [parisc-linux] sym53c8xx.c
From: James Bottomley <James.Bottomley@steeleye.com>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: <20030514215849.GK6859@parcelfarce.linux.theplanet.co.uk>
References: <20030514215849.GK6859@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain
Date: 14 May 2003 17:19:27 -0500
Message-Id: <1052950768.3430.32.camel@mulgrave>
Mime-Version: 1.0
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

On Wed, 2003-05-14 at 16:58, Matthew Wilcox wrote:
> 
> The sym53c8xx driver is near to being removed from 2.6.  Can anyone think
> of a situation where we might still want it?  I'm concerned that maybe
> some of the fixes didn't go into the sym53c8xx_2 driver.  In particular,
> I'd like to know that the sym53c8xx_2 driver in 2.5 works on C3k (wide &
> narrow!) and A500.

Just to clarify the plans:

NCR53C8XX and SYM53C8XX will be removed as CONFIG_ options.  ncr53c8xx.c
will continue to exist for Zalon (and has already been revamped for the
new error handling).  the SYM_2 will become the only selectable self
compiling driver.

James
