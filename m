Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 57DA34845
	for <parisc-linux@lists.parisc-linux.org>; Thu,  2 Oct 2003 09:52:59 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A55lC-0003Bs-Iw; Thu, 02 Oct 2003 16:52:58 +0100
Date: Thu, 2 Oct 2003 16:52:58 +0100
From: Matthew Wilcox <willy@debian.org>
To: "Padgett, Pat M [NTWK SVCS]" <PatPadgett@NMCC.SprintSpectrum.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP HSC J3516A (2 port) ethernet card  (supported??)
Message-ID: <20031002155258.GE24824@parcelfarce.linux.theplanet.co.uk>
References: <1289146742B56546AE580DFC6B711A83134825@PKDWB07C.ad.sprint.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1289146742B56546AE580DFC6B711A83134825@PKDWB07C.ad.sprint.com>
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

On Thu, Oct 02, 2003 at 10:27:42AM -0500, Padgett, Pat M [NTWK SVCS] wrote:
> Linux version 2.4.17-32 (root@paer) (gcc version 3.0.4) #1 Sat Mar 16
> 17:09:00 MST 2002

Oh, I just noticed this bit.  It's possible a later 2.4
kernel would support these cards better.  You can fetch
kernel-image-2.4.21-32-smp_pa7.2_hppa.deb from debian and install that.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
