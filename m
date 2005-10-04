From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] make[2]: *** [arch/parisc/lib/fixup.o] Error 1
Date: Tue, 04 Oct 2005 20:16:14 +0000
Message-ID: <4342E30E.7010406@tiscali.be>
References: <200509251914.j8PJEMDq015612@hiauly1.hia.nrc.ca>	<200509251950.j8PJoJh2016027@hiauly1.hia.nrc.ca>	<20050926001932.GB3725@colo.lackof.org>
	<20050926004810.GC3725@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
 matthew@wil.cx,
 parisc-linux@parisc-linux.org
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20050926004810.GC3725@colo.lackof.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Just to mentioned that my stress test (a loop compiling the kernel + a loop deflating a kernel src tar file) run on my b2k for more 
then a full day without any pb :^): I wasn't any more able to do it for a long time.

Thanks for all,
	Joel

PS: Just noticed something weird:
when I objdump the ccio-dma.o (for the d380), it seems that insn lci is desasembled as the famous undocumented lha?


Grant Grundler wrote:
> On Sun, Sep 25, 2005 at 06:19:32PM -0600, Grant Grundler wrote:
> 
>>On Sun, Sep 25, 2005 at 03:50:18PM -0400, John David Anglin wrote:
>>
>>>>fixup.S needs a ".level 1.1" directive.  "ldw,s" is a PA 1.1 feature.
>>>
>>>Actually, it looks like there is a binutils bug here.  However, the
>>>".level" directive still should be added to PA 1.1 files.
>>
>>Unfortunately, use of LDREG precludes specifying .level directly.
>>LDREG becomes "ldd" for 64-bit builds and requires pa20 level.
>>Maybe add a "LDREGS_LEVEL" or somesuch.
> 
> 
> I obviously hadn't looked in asm-parisc/assembly.h.
> "#define LEVEL" is already present.
> 
> 
>>We could make the "LDREG,s" a new macro. But I'm not keen on using
>>the PA1.1 syntax (LDWX). If no one else has a better idea,
>> I'll make this change.
> 
> 
> Also already present (LDREGX).
> The 32-bit-SMP build completes with both in fixup.S.
> 
> thanks,
> grant "needs a cup of tea" grundler
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
