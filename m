From: "Michael S. Zick" <mszick@wolfbutter.com>
Subject: Re: [parisc-linux] Can't mount F0 partition as /BOOT
Date: Thu, 24 Feb 2005 17:02:26 -0600
Message-ID: <200502241702.26234.mszick@wolfbutter.com>
References: <FHEGKPBPFFGIFBGOANOKGENNEPAA.h.cochran@comcast.net>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-2022-jp"
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <FHEGKPBPFFGIFBGOANOKGENNEPAA.h.cochran@comcast.net>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu February 24 2005 16:36, Harry Cochran wrote:
> Hi,
> 
>  I am rebuilding my J6000. I boot from the official Debian hppa install cd,
> partition the disks, making a nice 64MB F0 partition that I mark as
> bootable, a swap partition and several Linux partitions, initialize the
> swap, and then...
> 
>  I hit the button to initialze a disk and low and behold the boot partition
> I set up is not among the partitions that pop up to be initialized. If I do
> "View Paritions", there is sda1 and it's marked --Not Available--.
> 

That is correct, the F0 partition is only understood by PALO.
No need for other initialization than the 'F0' maker.


Mike
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
