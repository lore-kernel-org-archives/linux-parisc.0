Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mx.rollanet.org (mailsrv.rollanet.org [192.55.114.7])
	by dsl2.external.hp.com (Postfix) with SMTP id CB0EF4884
	for <parisc-linux@lists.parisc-linux.org>; Sat, 18 Jan 2003 12:16:08 -0700 (MST)
Subject: Re: [parisc-linux] Is Linux and HP-UX coexistence on same system
	possible?
From: Nathan Neulinger <nneul@umr.edu>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20030116002646.1973.qmail@web12501.mail.yahoo.com>
References: <20030116002646.1973.qmail@web12501.mail.yahoo.com>
Content-Type: text/plain
Message-Id: <1042917367.5306.29.camel@cessna.rollanet.org>
Mime-Version: 1.0
Date: 18 Jan 2003 13:16:07 -0600
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

Other than the boot lifimage, I wonder if you could actually do this
with a "contiguous allocation" logical volume, such as is used for
primary swap? You'd just need an HP utility for passing the block
boundary information to the linux side or palo. Not sure how'd you'd
manage the boot though unless you could get palo to boot the hp kernel.

-- Nathan

On Wed, 2003-01-15 at 18:26, Derek Engelhaupt wrote:
> You can only do it using 2 completely seperate disks or in my case I
> boot from 2 different LUNs on my Autoraid Model 12 - one LINUX the
> other HP-UX. 
> 
> derek 
> 
>  "BUEHL,REINER (HP-Germany,ex1)" <reiner.buehl@hp.com> wrote: 
>         Hi all,
>         
>         Is it possible to install parisc linux into an empty logical
>         volume of an
>         existing HP-UX 11 installation and then boot one or the other
>         OS?
>         
>         Best regards,
>         Reiner.
>         _______________________________________________
>         parisc-linux mailing list
>         parisc-linux@lists.parisc-linux.org
>         http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
> ______________________________________________________________________
> Do you Yahoo!?
> Yahoo! Mail Plus - Powerful. Affordable. Sign up now
-- 

------------------------------------------------------------
Nathan Neulinger                       EMail:  nneul@umr.edu
University of Missouri - Rolla         Phone: (573) 341-4841
Computing Services                       Fax: (573) 341-4216
