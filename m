Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id E4B8B4834
	for <parisc-linux@lists.parisc-linux.org>; Fri, 25 Oct 2002 18:07:33 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 185EUC-00006y-00; Sat, 26 Oct 2002 01:07:28 +0100
Date: Sat, 26 Oct 2002 01:07:28 +0100
From: Matthew Wilcox <willy@debian.org>
To: Derek Engelhaupt <derekengelhaupt@rocketmail.com>
Cc: Grant Grundler <grundler@dsl2.external.hp.com>,
	John David Anglin <dave@hiauly1.hia.nrc.ca>,
	Richard Nairn <richard@nairnconsulting.ca>, taggart@carmen.fc.hp.com,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 735/125 Wide Diff scsi
Message-ID: <20021026010728.H27461@parcelfarce.linux.theplanet.co.uk>
References: <20021025005035.AB3E74852@dsl2.external.hp.com> <20021026000014.4733.qmail@web12507.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021026000014.4733.qmail@web12507.mail.yahoo.com>; from derekengelhaupt@rocketmail.com on Fri, Oct 25, 2002 at 05:00:14PM -0700
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

On Fri, Oct 25, 2002 at 05:00:14PM -0700, Derek Engelhaupt wrote:
> So my C180 has a different HVD controller chip than the 735?

The problem is that 735's CPU can't allocate consistent memory -- the
C180 has the CCIO IOMMU, so it can.  The ncr53c7xx driver relies on
being able to allocate consistent memory.

-- 
Revolutions do not require corporate support.
