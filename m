Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id B311348AD
	for <parisc-linux@lists.parisc-linux.org>; Sat, 27 Sep 2003 01:48:24 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 4.22)
	id 1A39oS-0002Lm-PO; Sat, 27 Sep 2003 08:48:20 +0100
Date: Sat, 27 Sep 2003 08:48:20 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: linux-scsi@vger.kernel.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] zalon/ncr53c720 crashes K460  (parisc port) on bootup.
Message-ID: <20030927074820.GR24824@parcelfarce.linux.theplanet.co.uk>
References: <1064634188.641.27.camel@laptop.bradetich.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1064634188.641.27.camel@laptop.bradetich.net>
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

On Fri, Sep 26, 2003 at 09:43:08PM -0600, Ryan Bradetich wrote:
> ncr53c720-0: ID 7, Fast-10, Parity Checking, Differential
> ncr53c720-0: suspicious SCSI data while resetting the BUS.
> ncr53c720-0: dp1,d15-8,dp0,d7-0,rst,req,ack,bsy,sel,atn,msg,c/d,i/o =
> 0x3fdff00, expecting 0x100

3fdff00 is
rst set
d7-d0 set
dp0 clear
d8-d15 set
dp1 clear

SCSI is even parity, right?  So we're seeing all 1s on the bus when
we're expecting all 0s, but there's no parity problem.

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
