Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8EB97492D
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Dec 2001 23:45:07 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16EOIC-0008TF-00; Thu, 13 Dec 2001 05:20:24 +0000
Date: Thu, 13 Dec 2001 05:20:24 +0000
From: Matthew Wilcox <willy@debian.org>
To: Tom <palinux@alaskatech.org>
Cc: Matthew Wilcox <willy@debian.org>,
	palinux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Firmware upgraded, STI console problem
Message-ID: <20011213052024.D8225@parcelfarce.linux.theplanet.co.uk>
References: <200112122039.NAA11818@puffin.external.hp.com> <Pine.LNX.4.33.0112121147380.4162-100000@goliath.alaskatech.org> <20011212210242.E22198@parcelfarce.linux.theplanet.co.uk> <1008218517.2031.1.camel@crudball>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1008218517.2031.1.camel@crudball>; from palinux@alaskatech.org on Wed, Dec 12, 2001 at 07:41:57PM -0900
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

On Wed, Dec 12, 2001 at 07:41:57PM -0900, Tom wrote:
> By all means, feel free to post corrections, either here or direct to
> me, and I'll update it. Also, if someone can think of something else
> useful for it, just ask... (Perhaps the minimum kernel revision needed?)

E, F, G, H, I class aren't supported straight off the CD; they require
additional changes, AIUI.  Not to mention no support for their SCSI
adapters.  K mostly works... similar problems to E.  D & R should work
fine (problem with D class with remote management console).  735's FWDiff
scsi doesn't work.

-- 
Revolutions do not require corporate support.
