Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CA0694878
	for <parisc-linux@lists.parisc-linux.org>; Thu, 21 Feb 2002 08:05:07 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16dumP-0001WH-00; Thu, 21 Feb 2002 15:05:05 +0000
Date: Thu, 21 Feb 2002 15:05:05 +0000
From: Matthew Wilcox <willy@debian.org>
To: willy.schriemer@philips.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP3000 model 937
Message-ID: <20020221150505.E27212@parcelfarce.linux.theplanet.co.uk>
References: <OFD0B612F9.F1BF32FB-ONC1256B67.004FBA94@diamond.philips.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <OFD0B612F9.F1BF32FB-ONC1256B67.004FBA94@diamond.philips.com>; from willy.schriemer@philips.com on Thu, Feb 21, 2002 at 03:34:50PM +0100
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

On Thu, Feb 21, 2002 at 03:34:50PM +0100, willy.schriemer@philips.com wrote:
> Hi fellow listers,
> 
> Is it possible to use PaRisc on HP3000 model 937RX. This machine is a good 
> old MPE/iX wich I want to use for testing PaRisc0Linux.

As far as I can tell, the closest thing we have in the hwdb right now is
the F10: http://hwdb.parisc-linux.org/view.php3?type=machine&name=F10

This class of machine is full of undocumented devices including the
console, network and scsi.  It will be an awful lot of work to make this
class of machine any use.

-- 
Revolutions do not require corporate support.
