From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [PATCH] Remove irq_region_ops
Date: Thu, 30 Dec 2004 21:06:23 +0000
Message-ID: <41D46DCF.5090907@tiscali.be>
References: <20041230184520.GA18080@parcelfarce.linux.theplanet.co.uk>
	<41D45B80.2040807@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@parisc-linux.org
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <41D45B80.2040807@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Final update

Joel Soete wrote:
> 
> 
> Matthew Wilcox wrote:
> [...]
> 
>>
>> Tested on a 725, mostly with Lasi-based devices.  It'd be nice if someone
>> tested this on an IOSAPIC-based machine (eg a500/b2000/n4000/j7000/c8000)
> 
> 
> build and boot fine on n4k (64bit 2way system) (on going to rebuild 
> kernel ;-)
> same results on b2k 64bit kernel (32bit on going to build)
32bit kernel seems to works as fine as 64bit one :-)

> 
>> I'd like to commit this soon and move onto step 2.
>>
> Just would like to test on b180 (on going to build too)
Unfortunately this system is remote and I do not find any way to break this pdc boot loop:
[...]
Boot Device not ready.
Retrying Boot Device...
Boot Device not ready.
Retrying Boot Device...
Boot Device not ready.
Retrying Boot Device...
[...]

> and c110 ;-)

Boot (and seems to works) fine also :-)

Hope that help you to go ahead.

Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
