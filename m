Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 43FC94829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 21 Mar 2003 05:14:34 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 18wLPs-0004Ts-Nk; Fri, 21 Mar 2003 12:14:32 +0000
Date: Fri, 21 Mar 2003 12:14:32 +0000
From: Matthew Wilcox <willy@debian.org>
To: Stefan Witzel <stefan.witzel@zvw.uni-goettingen.de>
Cc: PARISC-LINUX <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] HP J5600
Message-ID: <20030321121432.GI14520@parcelfarce.linux.theplanet.co.uk>
References: <Q.20030321125258.211C.2.1SCD@mx-b.zvw.uni-goettingen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Q.20030321125258.211C.2.1SCD@mx-b.zvw.uni-goettingen.de>
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

On Fri, Mar 21, 2003 at 12:52:58PM +0100, Stefan Witzel wrote:
> Hello,
> 
> I try to install parisc-linux on a J5600 workstation. When the
> welcome screen from Debian appears I press the enter key
> (german keyboard, USB) to continue but there is no reaction.
> 
> So I looked in the mailing list archives and found that there
> are/were some problems with J5600 workstations.
> 
> What is the current state? Are J5600 supported?

Yes, but USB wasn't in Debian 3.0.  Back in November, Grant replied to someone with a similar problem:

> I suspect the kernel in debian stable might just be too old.
> Can you try newer net-install images from ESIEE?
>         (ftp://ftp.parisc-linux.org/cd-images/testing/auto-isos/)
> 
> FWIW, at least three developers are *using* C3000 including myself.
> But I've never cold installed using the debian since I've had bits
> on this machine since well before any ISOs were available.
> Probably would be a good exercise....

No reply was received indicating whether or not this worked, so I'm
reluctant to add a FAQ entry for it.  Please let us know how you get on
with this.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
