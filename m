Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx.rollanet.org (mailsrv.rollanet.org [192.55.114.7])
	by dsl2.external.hp.com (Postfix) with SMTP id D76544953
	for <parisc-linux@lists.parisc-linux.org>; Thu,  4 Oct 2001 06:43:48 -0600 (MDT)
Sender: nneul@dsl2.external.hp.com
Message-ID: <3BBC5981.D741A437@umr.edu>
Date: Thu, 04 Oct 2001 07:43:45 -0500
From: Nathan Neulinger <nneul@umr.edu>
MIME-Version: 1.0
To: John Marvin <jsm@udlkern.fc.hp.com>
Cc: parisc-linux@lists.parisc-linux.org, uetrecht@umr.edu
Subject: Re: [parisc-linux] HP-UX binary compatibility
References: <200110041156.FAA09478@udlkern.fc.hp.com>
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-parisc.vger.kernel.org>

John Marvin wrote:
> 
> I just committed a patch that restores some of the elementary HP-UX
> binary compatibility functionality. Shared libraries also work. But
> there is a ton of more work to do. Lots of wrappers need to be written
> (see the arch/parisc/hpux directory for files that contain the support
> for this functionality). One major missing piece is signal support.
> Mapping ioctl arguments is another significant effort ...
> 
> John
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/cgi-bin/mailman/listinfo/parisc-linux

Fantastic! I'll definately take a closer look now and will submit
whatever improvements I can!

-- Nathan

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216
