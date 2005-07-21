From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] Latest palinux crash
Date: Thu, 21 Jul 2005 19:48:23 +0000
Message-ID: <42DFFC07.5080607@tiscali.be>
References: <20050720122227.GK10156@parcelfarce.linux.theplanet.co.uk>
	<20050721043626.GY30182@systemhalted.org>
	<42DF883E.1020607@tiscali.be>
	<20050721124713.GB27330@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Carlos O'Donell <carlos@systemhalted.org>,
 Matthew Wilcox <matthew@wil.cx>,
 parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050721124713.GB27330@colo.lackof.org>
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
> On Thu, Jul 21, 2005 at 11:34:22AM +0000, Joel Soete wrote:
> 
>>This kernel seems to be very more stable (passed with success some stress 
>>test of mine during severall days when it would crash in few ours or less 
>>when compile with gcc-3.3).
> 
> 
> Joel,
> This is good news. Thanks for trying this out.
> 
> 
>>...
>>but pressing TOC button launched well a panic, and unfortunately pim 
>>analisys didn't help at all :-?
>>(fyi: 
>><http://lists.parisc-linux.org/pipermail/parisc-linux/2005-July/026855.html>)
> 
> 
> In 026855.html you wrote you didn't save the System.map.
> 
Yes my script analysis is based on the famous dump_analyser.sh so still grab the label into System.map
but insn match well the address ;-) (today I learn more about addr2line and thought that it would help to get rid of this pb :-)

> 
>>So am I also looking for way to help: lkcd? instrumenting the kernel like 
>>kprobes/dprobes? (but not yet hppa support)
> 
> 
> kprobes will need more support for runtime patching of the code.
> It's not trivial to do that given the VIVT caches on parisc.
(Sorry: VIVT?)

> It's certainly possible though since I know HPUX does that.
> But it also means changing the kernel text to RW or using
> absolute stores/icache flushing to modified the kernel instructions.
> 
well so not sure that kprobe was already for p-l but I find this paper
<http://www-128.ibm.com/developerworks/linux/library/l-graphvis/> on gcc fnct instrumentation very attractive
and looking for something like this for the kernel: in paper the link to kprobes is dead but resent me to dprobes on sf.net?

> 
> 
>>Unfortunately, I definetily don't have deep enough knowledge of linux 
>>kernel to help more, sorry.
> 
> 
> I only know enough to be dangerous to be people who know less. :^)
> 
> grant
> 
Thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
