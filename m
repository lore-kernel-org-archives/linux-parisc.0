From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 2.6.11-rc3-pa3 smp "Segmentation fault" but not up
Date: Sun, 16 Jan 2005 00:32:26 +0000
Message-ID: <41E9B61A.5060204@tiscali.be>
References: <41E92258.60006@tiscali.be>
	<20050115144111.GQ30982@parcelfarce.linux.theplanet.co.uk>
	<41E9952A.1000907@tiscali.be>
	<20050115224118.GC10070@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: List Parisc <parisc-linux@parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050115224118.GC10070@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Grant,

Sorry for delay but the n stand in the office and join it from home i need to use vpn connection which deasable my local lan (and 
also my pop3 access to my isp :-( and obviously irc)

Grant Grundler wrote:
> On Sat, Jan 15, 2005 at 10:11:54PM +0000, Joel Soete wrote:
> 
>>this patch:
>><http://cvs.parisc-linux.org/linux-2.6/arch/parisc/kernel/pacache.S?r1=1.9&r2=1.10> ?
> 
> 
> I don't think willy is refering to any particular issue.
> 
> 
>>Well in doubt I revert all changes since:
>><http://cvs.parisc-linux.org/*checkout*/linux-2.6/arch/parisc/kernel/pacache.S?rev=1.9.20.2>
>>
>>Btw what do you suspect that Grant (and I) could have missed (just divid by 
>>2 the number of loop thanks to dword insn)?
> 
> 
> No - I mangled that. The code you submitted was correct in this regard.
Agree (but what could we imagine on a system which only have one atomic insn iirc?)

> I fixed the off-by-2x bug in the next commit:
> http://cvs.parisc-linux.org/linux-2.6/arch/parisc/kernel/pacache.S?r1=1.10&r2=1.11
> 
> My suspicion is the prefetching might be causing problems since it's going
> past the end of the page. The kernel tmp alias pages might be causing problems
> since we don't flush past the end of those. (Or something like that).
> 
sorry I didn't have yet understand all details of prefetching

> Can you remove only the prefetching in that algorithm?
> 
Yes, I did and already run one occurence of the loop without pb, .. so we have to be patient to see if first mentioned pb (failures 
after some loop occurence: about 50 last time) :-)

> 
>>But already strange results:
> 
> ...
> 
>>and after those first 11 failed it seems to continue??
> 
> 
> Do you mean after restarting the make the build completed?

No, just let continue the loop (that doesn't make sense to me but in fact I already encounter this case with 2.6.10-paXX but don't 
have time to report it).

Is nicol also encounter the same pb (just in case of small diff in hw config)?

Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
