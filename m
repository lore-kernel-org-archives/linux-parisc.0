Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from transport.cksoft.de (transport.cksoft.de [62.111.66.27])
	by dsl2.external.hp.com (Postfix) with ESMTP id A91624829
	for <parisc-linux@lists.parisc-linux.org>; Sat,  9 Nov 2002 00:38:14 -0700 (MST)
Date: Sat, 9 Nov 2002 07:37:59 +0000 (UTC)
From: "Bjoern A. Zeeb" <bzeeb-lists@lists.zabbadoz.net>
To: Matthew Wilcox <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.5 kernel compilation error
In-Reply-To: <20021108211301.Q12011@parcelfarce.linux.theplanet.co.uk>
Message-ID: <Pine.BSF.4.44.0211090735060.32930-100000@e0-0.zab2.int.zabbadoz.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On Fri, 8 Nov 2002, Matthew Wilcox wrote:

Hi,

> On Fri, Nov 08, 2002 at 09:05:51PM +0000, Bjoern A. Zeeb wrote:
> >
> > Are there any updates or fixes or do I need to have a look at it myself ?
> > This is a bk pull from 20021108-165510 UTC.
>
> We're not fully integrated into Linus' tree yet.  We're a damn sight
> closer than we have been ever before, but you still need either latest
> CVS or download a patch.  If you're interested in 2.5, i recommend CVS
> since fixes get made on an hourly basis.  Last night's snapshot is ~130k
> gzipped, or 500k uncompressed.  About 90% of that is drivers/video,
> drivers/input and drivers/scsi.
>
> If you do want a patch, http://ftp.parisc-linux.org/2.5/kernel-src/
> is updated nightly (around 5am MST, i believe).

thanks. I will consider a cvs co but first fetch the patch.

*grrml* I must have missed this directory while looking at
ftp.parisc-linux.org though I had a look at kernels and src ...

-- 
Bjoern A. Zeeb				bzeeb at Zabbadoz dot NeT
56 69 73 69 74				http://www.zabbadoz.net/
