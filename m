Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id DE6EA6124
	for <parisc-linux@lists.parisc-linux.org>; Mon, 10 Dec 2001 15:42:20 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16DZ7n-0005CO-00; Mon, 10 Dec 2001 22:42:15 +0000
Date: Mon, 10 Dec 2001 22:42:15 +0000
From: Matthew Wilcox <willy@debian.org>
To: Chuck Slivkoff <charles_slivkoff@hp.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.16-pa16 (from CVS) fails on "make depend"
Message-ID: <20011210224215.L3427@parcelfarce.linux.theplanet.co.uk>
References: <3C1539B8.A3175E86@hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C1539B8.A3175E86@hp.com>; from charles_slivkoff@hp.com on Mon, Dec 10, 2001 at 05:39:52PM -0500
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

On Mon, Dec 10, 2001 at 05:39:52PM -0500, Chuck Slivkoff wrote:
> I did a CVS update yesterday and tried to build a kernel today, using
> the same .config from my last successful build (2.4.9-pa78).
> 
> After a "make clean", "make depend" is failing with the error below.
> I've done a "make menuconfig" and things seem to be OK.
> 
> Anyone have any suggestions?

are you using the `approved' .cvsrc in build-tools?  seems you're missing
-P to your update command.

-- 
Revolutions do not require corporate support.
