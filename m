From: Joel Soete <soete.joel@scarlet.be>
Subject: Re: [parisc-linux] K410 SCSI 53c700 issue with PLEXTOR PX-R820T
Date: Thu, 30 Nov 2006 16:50:40 +0000
Message-ID: <456F0BE0.1060707__2022.85980708456$1416624625$gmane$org@scarlet.be>
References: <20061112160350.8b7d4afd.gmsoft@tuxicoman.be>	<20061112191436.GY16952@parisc-linux.org>	<20061127115832.b413fd7b.gmsoft@tuxicoman.be>	<20061127153713.GQ14076@parisc-linux.org>
	<20061127181040.94d1e30f.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@parisc-linux.org,
 Matthew Wilcox <matthew@wil.cx>
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061127181040.94d1e30f.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Guy Martin wrote:
> Matthew,
> 
> In only tested on my K410. I'm clueless about IOMMU besides what I can read about it on wikipedia :)
> 
> I can give it a try on my b180l but I don't know if there is a point and if it has the right connector.
> 
Yes connectors and even hba are afaik the same (into LASI), the diff stand in this Uturn/U2 bus converter/adapter (ioscan 
name it bc, mstm ba?) on your K model (as on my D) and not on B180L+.

> As James said, it looks like the size of some commands is not negociated properly or so.
> http://lists.parisc-linux.org/pipermail/parisc-linux/2006-September/030204.html
> 
> Is there a way I make this negociation more verbose ?
> 
> However, unlike Joel's problem, those errors start to appear when I try to mount a cd or even before that when udevd starts and not after some untar/rm iterations. I sould mention that if I eject the media while mount is stuck, it aborts.
> 
>   Guy
> 
> 
> On Mon, 27 Nov 2006 08:37:14 -0700
> Matthew Wilcox <matthew@wil.cx> wrote:
> 
>> On Mon, Nov 27, 2006 at 11:58:32AM +0100, Guy Martin wrote:
>>> Some more detail on this issue.
>>> This burner still works at commit 6391a11375de5e2bb1eb8481e54619761dc65d9f but breaks at commit 0f13fc09db68de92585558984bff1c51b87db72f.
>> Thanks for narrowing it down so much!
>>
>>> commit 0f13fc09db68de92585558984bff1c51b87db72f
>>> Author: James Bottomley <James.Bottomley@steeleye.com>
>>> Date:   Thu Jun 29 13:02:11 2006 -0400
>>>
>>>     [SCSI] 53c700: fix breakage caused by the autosense update
>>>     
>>>     A bit of a brown paper bag issue.  The previous patch to remove the soon
>>>     to be ripped out fields that were used in autosense actually broke the
>>>     driver.  This patch fixes it and has been tested (honestly).
>> If James says he tested it, I believe him.  I *think* we're in the
>> situation where it works on machines without an IOMMU and breaks on
>> machines with an IOMMU.  Joel, Guy, do I have that right?
> 
Well my test case is totaly different as far as I just tested se-scsi disk.
And I don't own any PLEXTOR, so only GMSoft test on its b180 could confirm us if it's same kind of pb.

The only thing of what I still sure is that the pb occure to me when I tried to stress (high io rate) this driver.

Joel

> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
