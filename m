Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id D37D14829
	for <parisc-linux@lists.parisc-linux.org>; Fri,  8 Nov 2002 14:13:08 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18AGR3-0000Zo-00; Fri, 08 Nov 2002 21:13:01 +0000
Date: Fri, 8 Nov 2002 21:13:01 +0000
From: Matthew Wilcox <willy@debian.org>
To: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 kernel compilation error
Message-ID: <20021108211301.Q12011@parcelfarce.linux.theplanet.co.uk>
References: <Pine.BSF.4.44.0211082101420.32930-100000@e0-0.zab2.int.zabbadoz.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.BSF.4.44.0211082101420.32930-100000@e0-0.zab2.int.zabbadoz.net>; from bzeeb-lists@lists.zabbadoz.net on Fri, Nov 08, 2002 at 09:05:51PM +0000
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

On Fri, Nov 08, 2002 at 09:05:51PM +0000, Bjoern A. Zeeb wrote:
> I had not been following these lists and parisc development for more
> than half a year now.
> 
> I saw a post on 2.5 kernel in the archive for november but do not know
> if this is the right place.
> 
> Nevertheless Willy and the ohers for sure are reading this ;-)
> 
> Are there any updates or fixes or do I need to have a look at it myself ?
> This is a bk pull from 20021108-165510 UTC.

We're not fully integrated into Linus' tree yet.  We're a damn sight
closer than we have been ever before, but you still need either latest
CVS or download a patch.  If you're interested in 2.5, i recommend CVS
since fixes get made on an hourly basis.  Last night's snapshot is ~130k
gzipped, or 500k uncompressed.  About 90% of that is drivers/video,
drivers/input and drivers/scsi.

If you do want a patch, http://ftp.parisc-linux.org/2.5/kernel-src/
is updated nightly (around 5am MST, i believe).

-- 
Revolutions do not require corporate support.
