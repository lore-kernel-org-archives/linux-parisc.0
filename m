Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id C40DA483A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 25 Feb 2002 10:50:00 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16fPGB-0005xb-00; Mon, 25 Feb 2002 17:49:59 +0000
Date: Mon, 25 Feb 2002 17:49:59 +0000
From: Matthew Wilcox <willy@debian.org>
To: debian-hppa@lists.debian.org, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] ext3 patch
Message-ID: <20020225174959.B20667@parcelfarce.linux.theplanet.co.uk>
References: <20020225080205.GC32703@charite.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020225080205.GC32703@charite.de>; from Ralf.Hildebrandt@charite.de on Mon, Feb 25, 2002 at 09:02:05AM +0100
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

On Mon, Feb 25, 2002 at 09:02:05AM +0100, Ralf Hildebrandt wrote:
> The recent ext3 patch on
> http://www.zip.com.au/~akpm/linux/ext3/
> 
> ( http://www.zip.com.au/~akpm/ext3-2.4-0.9.17-2418p3.gz )
> applies cleanly to 2.4.17-pa30 -- I recommend committing it to the
> kernel CVS tree, since
> 
> a) It will be in 2.4.18 anyway
> b) it fixes some problems:

I'd rather not apply patches which will be in 2.4.18 anyway -- it makes
the merge harder.

-- 
Revolutions do not require corporate support.
