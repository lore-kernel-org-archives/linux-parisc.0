From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] Any chance of an HP AutoRAID array working?
Date: Thu, 12 Oct 2006 14:12:42 -0600
Message-ID: <20061012201242.GC15124@colo.lackof.org>
References: <452E95C0.3050307@computer.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Andrew Gaylard <ag@computer.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <452E95C0.3050307@computer.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Thu, Oct 12, 2006 at 09:21:36PM +0200, Andrew Gaylard wrote:
...
> I'm keen to use Linux (probably Gentoo but Debian's also fine) on
> these boxes, but I'm wondering if that'll mean I'll have to forfeit
> the 8 x 18G disks in each array, which would be a pity...

No. Those are standard SCSI LUNs. use the LCD panel to config
the LUNs and the AutoRAID will arrange for shifting data from
RAID 1 to RAID 5 as it sees fit.

> Has anyone tried Linux on one of these AutoRAID systems?

At one point i did. I haven't in a long time though.

> Also, I presume that I can strip two of the machines to fill up
> the remaining machine with RAM and CPUs;  the HWDB seems to suggest
> that multiple processors will work OK under recent kernels.  Right?

In general, SMP is working.

AFAIK, K-class only had issues with console support
and some recent issues with GSC 53c720 support.
I've forgotten details. :(

grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
