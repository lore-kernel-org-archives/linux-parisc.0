From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Sun, 21 Aug 2005 10:29:42 +0000
Message-ID: <43085796.3080309@tiscali.be>
References: <ILESU1$F6D40EC654A84E56AFFAC27CDCE1FD84@scarlet.be>
	<20050820062635.GB28839@colo.lackof.org>
	<430778F2.8020406@tiscali.be>
	<20050820234126.GA20524@colo.lackof.org>
	<20050820235516.GE2756@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Jeff Dike <jdike@karaya.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050820235516.GE2756@parcelfarce.linux.theplanet.co.uk>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org



Matthew Wilcox wrote:
> On Sat, Aug 20, 2005 at 05:41:26PM -0600, Grant Grundler wrote:
> 
>>On Sat, Aug 20, 2005 at 06:39:46PM +0000, Joel Soete wrote:
>>
>>>Any idea about the possibility to port um?
>>
>>um == User Mode Linux?
>>
>>It's possible. :^)
>>I'm not doing it. ;^)
> 
> 
> We gave Jeff Dike a 712 a few years ago ... hey Jeff, how's that going?  ;-)
> 
Ah cool ;^)

Jeff,

I don't have time to read all interesting <http://user-mode-linux.sourceforge.net/arch-port.html>

but my main problem is always:
[...]
  Address space layout

     Before delving into the code, you need to do some high-level conceptual thinking about how to organize the address space of a 
UML process. UML maps its executable, physical memory, and kernel virtual memory into the address space of each of its processes. 
You need to decide where to put each of these so as to minimize the likelihood of a process trying to allocate that memory for its 
own use.

     The only arch hook at this point is where in the address space the UML binary is going to load. The other addresses are still 
hard-coded because they happen to work for both i386 and ppc. UML puts its own memory in the area starting at 0x5000000 and process 
stacks 4M below its own process stack. These choices may not work on all architectures, so feel free to generalize them. To locate a 
likely area on your arch, staring at /proc/<pid>/maps of various processes on the host has been the technique so far.

[...]

Any advise for the address space to use for hppa?

Thanks in advance,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
