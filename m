Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 426874829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 16 Jun 2003 13:27:49 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.14)
	id 19Rzdr-0005H7-3I; Mon, 16 Jun 2003 20:27:47 +0100
Date: Mon, 16 Jun 2003 20:27:47 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5.71-pa1 do_sigaction problem
Message-ID: <20030616192747.GD30843@parcelfarce.linux.theplanet.co.uk>
References: <200306160314.h5G3E2SF003545@hiauly1.hia.nrc.ca> <Pine.BSF.4.53.0306161754180.10327@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.53.0306161754180.10327@e0-0.zab2.int.zabbadoz.net>
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

On Mon, Jun 16, 2003 at 06:09:57PM +0000, Bjoern A. Zeeb wrote:
> Anyway there is still no solution to this from what I can see. People
> always compile kernels and bump -paX but from what I can see the
> kernel won't boot up. So how can they test it ? How do they get a
> bootable kernel ?

two things ... i think one is that most people aren't testing 2.5 yet.
another is that most people are still on gcc-3.0.  indeed, gcc-3.2 and
later are not suitable for generating a kernel since it does not respect
the __aligned__ attribute on stack allocations.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
