Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id CE544482B
	for <parisc-linux@lists.parisc-linux.org>; Wed, 24 Jul 2002 06:21:09 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17XL8d-0001qu-00; Wed, 24 Jul 2002 13:21:07 +0100
Date: Wed, 24 Jul 2002 13:21:07 +0100
From: Matthew Wilcox <willy@debian.org>
To: Stephan Trajkoff <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] can I use 2.5.x kernels for PARISC 32 bit
Message-ID: <20020724132107.J3052@parcelfarce.linux.theplanet.co.uk>
References: <3D3E6A56.8080708@itp.bg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D3E6A56.8080708@itp.bg>; from stephan@itp.bg on Wed, Jul 24, 2002 at 11:50:30AM +0300
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

On Wed, Jul 24, 2002 at 11:50:30AM +0300, Stephan Trajkoff wrote:
> Today I downloaded 2.5.27 kernel, I see that there is support for parisc 
> architecture
> Anybody tried this kernel or another 2.5.x version?

bwahahaha.  the code in the 2.5.27 tree has been there since 2.4.0-test10
(or thereabouts).  it is heavily bitrotten, not maintained, and we've
moved on significantly since then (it's over 18 months since that code
went in).

you may or may not have noticed that we just started trying to merge
our code with 2.5 in our CVS tree.  this code is currently at the `we're
happy if it dies trying to start init' stage.

-- 
Revolutions do not require corporate support.
