From: James Bottomley <James.Bottomley@steeleye.com>
Subject: [parisc-linux] Re: zalon/ncr53c720 crashes K460  (parisc port) on bootup.
Date: 27 Sep 2003 08:45:56 -0500
Message-ID: <1064670357.2217.18.camel__28250.1529124149$1416622816$gmane$org@mulgrave>
References: <1064634188.641.27.camel@laptop.bradetich.net>
Mime-Version: 1.0
Content-Type: text/plain
Cc: SCSI Mailing List <linux-scsi@vger.kernel.org>,
	PARISC list <parisc-linux@lists.parisc-linux.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <1064634188.641.27.camel@laptop.bradetich.net>
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
