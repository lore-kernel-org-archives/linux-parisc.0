Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D1D734846
	for <parisc-linux@lists.parisc-linux.org>; Fri,  7 Jun 2002 11:06:14 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17GNBl-0004d9-00; Fri, 07 Jun 2002 18:06:13 +0100
Date: Fri, 7 Jun 2002 18:06:13 +0100
From: Matthew Wilcox <willy@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: Matthew Wilcox <willy@debian.org>, carlos@baldric.uwo.ca,
	tausq@debian.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] kdb getting healthier? (PCI guru needed, that's you willy!)
Message-ID: <20020607180613.P27186@parcelfarce.linux.theplanet.co.uk>
References: <20020607174843.O27186@parcelfarce.linux.theplanet.co.uk> <200206071701.g57H1T6M016445@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200206071701.g57H1T6M016445@hiauly1.hia.nrc.ca>; from dave@hiauly1.hia.nrc.ca on Fri, Jun 07, 2002 at 01:01:29PM -0400
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

On Fri, Jun 07, 2002 at 01:01:29PM -0400, John David Anglin wrote:
> Are they always 0 or are there situations where drivers change a space
> register value?  If they never change, then the memory limit is still
> 3GB.

Nobody changes sr4-7 (the default space registers).  Some drivers play
with sr1.  We use sr3 to access the user's process.  There's no problem
with accessing 4GB in either the kernel or the user process (though
we limit to 3.75GB currently, i believe, just to prevent unfortunate
accidents).

-- 
Revolutions do not require corporate support.
