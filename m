Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E13874829
	for <parisc-linux@lists.parisc-linux.org>; Fri, 10 Jan 2003 05:57:26 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18Wyiu-0004to-00; Fri, 10 Jan 2003 12:57:20 +0000
Date: Fri, 10 Jan 2003 12:57:20 +0000
From: Matthew Wilcox <willy@debian.org>
To: "FARINATI,LEANDRO (HP-Brazil,ex1)" <leandro.farinati@hp.com>
Cc: "Parisc-Linux List (E-mail)" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] pa-risc 64 compilation
Message-ID: <20030110125720.Q26554@parcelfarce.linux.theplanet.co.uk>
References: <9A0482A7BD2506488AD9417C93F3714F0105349E@xsp01.brazil.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <9A0482A7BD2506488AD9417C93F3714F0105349E@xsp01.brazil.hp.com>; from leandro.farinati@hp.com on Thu, Jan 09, 2003 at 12:52:18PM -0500
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

On Thu, Jan 09, 2003 at 12:52:18PM -0500, FARINATI,LEANDRO (HP-Brazil,ex1) wrote:
> 	I have a problem to compile an 64 kernel in an 64 machine. The
> problem is: hppa64-linux-gcc compiler not found. Someone know what happened?
> Where I find this gcc version?

Add http://ftp.parisc-linux.org/unofficial-debs/ to your
/etc/apt/sources.list and apt-get install gcc-hppa64.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
