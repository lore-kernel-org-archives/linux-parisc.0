Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hancock.sc.steeleye.com (nat9.steeleye.com [65.114.3.137])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A5BE483E
	for <parisc-linux@lists.parisc-linux.org>; Sat, 27 Sep 2003 07:46:03 -0600 (MDT)
Received: from mulgrave-w.il.steeleye.com (il-ppp.sc.steeleye.com [172.17.6.240])
	by hancock.sc.steeleye.com (8.11.6/linuxconf) with ESMTP id h8RDjuq15542;
	Sat, 27 Sep 2003 09:45:57 -0400
From: James Bottomley <James.Bottomley@steeleye.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: SCSI Mailing List <linux-scsi@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
In-Reply-To: <1064634188.641.27.camel@laptop.bradetich.net>
References: <1064634188.641.27.camel@laptop.bradetich.net>
Content-Type: text/plain
Date: 27 Sep 2003 08:45:56 -0500
Message-Id: <1064670357.2217.18.camel@mulgrave>
Mime-Version: 1.0
Subject: [parisc-linux] Re: zalon/ncr53c720 crashes K460  (parisc port) on bootup.
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

On Fri, 2003-09-26 at 22:43, Ryan Bradetich wrote:
> The zalon/ncr53c720 combination is fatal during booting on my K460
> parisc box.  I believe the scsi termination is correct since I performed
> a fresh debian install on the scsi disks and I can boot from then every
> time I use a 2.4 kernel :)  This problem appeared with with the latest
> cvs kernel from parisc-linux.org.
> 
> This system does boot and function when I do not compile zalon support
> into the kernel and use a nfsroot.
> 
> I can provide addtional information and test patches (or give access to
> this system) if requested.
> 
> Any thoughts or feedback appreciated!  

I'm not familiar with how the K class is wired.  However, the ncr53c8xx
driver that underlies the zalon720 is extremely ratty.  On my C360, I
can precipitate exactly this panic just by inserting the zalon7xx module
with an unterminated bluefish card.

Although we really need to track this down and fix it (which I'll look
into doing), all it would do would be to detach the driver correctly at
that point (so you still wouldn't see any devices).  Could you look at
your SCSI setup to see if the driver has a point (i.e. is there a
termination or cabling problem)?

James
