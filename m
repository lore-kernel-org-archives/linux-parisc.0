Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 292AB4837
	for <parisc-linux@lists.parisc-linux.org>; Thu, 27 Sep 2001 07:29:45 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15mbEV-0004RW-00; Thu, 27 Sep 2001 14:29:43 +0100
Date: Thu, 27 Sep 2001 14:29:43 +0100
From: Matthew Wilcox <willy@debian.org>
To: Richard Allen <ra@hp.is>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] More strange problems
Message-ID: <20010927142943.A16096@parcelfarce.linux.theplanet.co.uk>
References: <20010927113453.F16693@hp.is>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20010927113453.F16693@hp.is>; from ra@hp.is on Thu, Sep 27, 2001 at 11:34:53AM +0000
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Thu, Sep 27, 2001 at 11:34:53AM +0000, Richard Allen wrote:
> While creating a diff from the glibc 2.2.3 sources in your CVS against
> prestine glibc 2.2.3 sources, I notice that there is a subfolder in
> there called linuxthreads.   Are threads handled differently on
> parisc than on other platforms ?   Or is this folder just something
> left over from older times ?

linuxthreads is distributed as an add-on package for glibc; see the
glibc documentation.

-- 
Revolutions do not require corporate support.
