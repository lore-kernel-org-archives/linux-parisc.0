Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 90DFF483D
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 10:48:45 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17GMup-00049E-00; Fri, 07 Jun 2002 17:48:43 +0100
Date: Fri, 7 Jun 2002 17:48:43 +0100
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
Message-ID: <20020607174843.O27186@parcelfarce.linux.theplanet.co.uk>
References: <20020607110820.C10576@systemhalted> <200206071642.g57GgbbQ013056@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200206071642.g57GgbbQ013056@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Fri, Jun 07, 2002 at 12:42:37PM -0400
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

On Fri, Jun 07, 2002 at 12:42:37PM -0400, John David Anglin wrote:
> The only possible difference is the space register selection could be
> different for the ldw insns in the old code versus the new because the
> pointer values in the base differ by 16.

but not in the kernel because all space registers are set to 0.

-- 
Revolutions do not require corporate support.
