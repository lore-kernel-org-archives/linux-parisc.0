From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: 2.6.10-rc1-pa16 still panic on c110 [WAS: [parisc-linux] c110
	panic when try to boot 2.6.10-rc1-pa11?]
Date: Sat, 12 Feb 2005 20:45:20 +0000
Message-ID: <420E6AE0.7020708@tiscali.be>
References: <41966398.4070303@tiscali.be> <419FAAF4.4030608@tiscali.be>
	<20041121000403.GF11503@colo.lackof.org>
	<41A0BFD2.4020205@tiscali.be>
	<20041121214000.GC1477@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: List Parisc <parisc-linux@parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041121214000.GC1477@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello all,

Having far less time to spend to linux :_(, I come back shortly with those investigation:


Grant Grundler wrote:
> On Sun, Nov 21, 2004 at 04:18:26PM +0000, Joel Soete wrote:
> 
>>That works far better: no more panic at boot time :))
> 
> 
> good. I think the other problems you are have are either real HW problems,
> bugs in the driver or bugs in the hard disk firmware.
> You can rule out some of the hard disk firmware bugs by checking for
> newer versions of the firmware either at HP's site (URL
> is in the parisc-linux FAQ) or disk vendor's site.
> 
There are effectively a new fw revision for this disk but only available for hp engineer :-)

But getting back this disk to office, I had the idea to connect this disk to a b180 using the same lasi700 driver and drive exactely 
the same stress test (http://lists.parisc-linux.org/pipermail/parisc-linux/2004-November/025277.html) and no pb occured.

so could it be a hw pb with the scsi ctrlr ncr53c710 (the narrow se)?

Thanks again,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
