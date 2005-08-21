From: Matthew Wilcox <matthew@wil.cx>
Subject: Re: [parisc-linux] B132L outperforms C160 - 64-bit userland needed?
Date: Sun, 21 Aug 2005 15:19:23 +0100
Message-ID: <20050821141923.GF2756@parcelfarce.linux.theplanet.co.uk>
References: <ILESU1$F6D40EC654A84E56AFFAC27CDCE1FD84@scarlet.be>
	<20050820062635.GB28839@colo.lackof.org>
	<430778F2.8020406@tiscali.be>
	<20050820234126.GA20524@colo.lackof.org>
	<20050820235516.GE2756@parcelfarce.linux.theplanet.co.uk>
	<43085796.3080309@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: Jeff Dike <jdike@karaya.com>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>,
 Matthew Wilcox <matthew@wil.cx>
To: Joel Soete <soete.joel@tiscali.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <43085796.3080309@tiscali.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Sun, Aug 21, 2005 at 10:29:42AM +0000, Joel Soete wrote:
> I don't have time to read all interesting 
> <http://user-mode-linux.sourceforge.net/arch-port.html>
> 
> but my main problem is always:
> [...]
>  Address space layout
> 
>     Before delving into the code, you need to do some high-level conceptual 
>     thinking about how to organize the address space of a UML process. UML maps 
> its executable, physical memory, and kernel virtual memory into the address 
> space of each of its processes. You need to decide where to put each of 
> these so as to minimize the likelihood of a process trying to allocate that 
> memory for its own use.
> 
>     The only arch hook at this point is where in the address space the UML 
>     binary is going to load. The other addresses are still hard-coded because 
> they happen to work for both i386 and ppc. UML puts its own memory in the 
> area starting at 0x5000000 and process stacks 4M below its own process 
> stack. These choices may not work on all architectures, so feel free to 
> generalize them. To locate a likely area on your arch, staring at 
> /proc/<pid>/maps of various processes on the host has been the technique so 
> far.
> 
> [...]
> 
> Any advise for the address space to use for hppa?

well ... PA processes get 3.75GB of address space (we decided to reserve
256MB in case we needed to use it for something).  So we *could* map
the UML kernel into the top 256MB.  But I think we'd be better off using
the space registers and coming up with an API to allow UML to allocate
memory in different spaces.

-- 
"Next the statesmen will invent cheap lies, putting the blame upon 
the nation that is attacked, and every man will be glad of those
conscience-soothing falsities, and will diligently study them, and refuse
to examine any refutations of them; and thus he will by and by convince 
himself that the war is just, and will thank God for the better sleep 
he enjoys after this process of grotesque self-deception." -- Mark Twain
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
