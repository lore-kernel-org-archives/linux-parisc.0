Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6C2FC482C
	for <parisc-linux@parisc-linux.org>; Tue, 26 Mar 2002 08:44:47 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16pt7s-0006CG-00; Tue, 26 Mar 2002 15:44:44 +0000
Date: Tue, 26 Mar 2002 15:44:44 +0000
From: Matthew Wilcox <willy@debian.org>
To: Peter Lavender <plaven@bigpond.net.au>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] performance?
Message-ID: <20020326154444.D26865@parcelfarce.linux.theplanet.co.uk>
References: <20020326224358.B28171@piglet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020326224358.B28171@piglet>; from plaven@bigpond.net.au on Tue, Mar 26, 2002 at 10:43:58PM +1100
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

On Tue, Mar 26, 2002 at 10:43:58PM +1100, Peter Lavender wrote:
> It wasn't until I compiled it on my p90 with 48 meg ram running a a
> zillion services and daemons that I noticed just how slow the 715 is.
> Running the program proved this even further.

Would you mind posting some numbers?

Also, let's try to figure out what other variables are a factor.  Can you
compare gcc-3.0 on your x86 to the current compiler?

-- 
Revolutions do not require corporate support.
