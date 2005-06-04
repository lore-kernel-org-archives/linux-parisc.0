From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [PATCH] usb/input/hid-core.c extract() brain damage
Date: Sat, 04 Jun 2005 10:31:05 +0000
Message-ID: <42A182E9.7020609__45124.7611469173$1416624541$gmane$org@tiscali.be>
References: <20050604011655.GA16999@colo.lackof.org>	<200506040125.j541PI7g009179@hiauly1.hia.nrc.ca>
	<20050604072510.GD8230@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 kyle@cabal.ca,
 linux-usb-devel@lists.sourceforge.net,
 parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050604072510.GD8230@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Grant Grundler wrote:
> On Fri, Jun 03, 2005 at 09:25:18PM -0400, John David Anglin wrote:
> 
>>>>It seems that this problem has been around for some time.
>>>
>>>I didn't check to see how long this code has been around.
>>
>>It's in 2.6.10-pa3.  Since the USB mouse and keyboard work in it,
>>some other change must have been involved in the 2.6.12 breakage.
> 
> 
> Yes, Kyle tracked it down to parisc switching from a parisc asm
> definition of get_unaligned() to using the generic ones.
> Ie we moved from avoiding kernel traps to exercising them.
> But 64-bit kernel worked fine with USB.
> And on 32-bit kernels le64() loads degenerate into two 32-bit
> loads. Ie the trap handler is still only dealing with 32-bit
> misaligned accesses like it would with this patch. So I don't
> think the kernel trap support is the problem.
> 
> Regardless, the two functions are badly written and could
> be alot clearer.
> 
Thanks for feedback ;-)

That said, I also noticed a big difference of behaviour when I select or not the CONFIG_PDC_STABLE option or not:
	o when selected my stress test make panicing my b2k in 5 min showing a cash_grow() pb (as reported before)
	o when not selected the system hang as decribe by jda.

> 
>>As an aside, 2.6.10-pa3 doesn't seem to have the stability problems
Interesting, I will check. Thanks

>>that I saw 2.6.11-pa4.  It pretty much seems as stable as 2.6.8.1-pa11
>>on my c3750.  There was hang in the java testsuite (PR218) in one of
>>two gcc builds and check.  Otherwise, the test results were identical.
> 
> 
> Ok. Can you want to try the older version of include/asm-parisc/unaligned.h?
> 
Interesting, I will too
> 
>>>USB keyboard and mouse work with 2.6.12-rc5 on parisc.
>>
>>Great!
> 
> 
> Well, I haven't committed it to cvs.parisc-linux.org.
> I'm waiting for the USB guru's to comment.
> 
Many thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
