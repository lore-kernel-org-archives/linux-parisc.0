From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Wed, 22 Jun 2005 19:54:54 +0000
Message-ID: <42B9C20E.3090409@tiscali.be>
References: <200503242133.j2OLXl4R020985@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503242133.j2OLXl4R020985@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave,

John David Anglin wrote:
>>>4.0 has a
>>>new option, -mfixed_range=, that was introduced so that a small range
>>>of fp registers could be used for the xmpyu multiplication insn.  It
>>>might be useful to experiment with this option to see if it useful.
>>
>>I don't know enough about ABI to understand the issues here.
>>AFAIK, we currently are using FP registers because that's
>>the way multiplication is implemented in the integer math libs
>>we inherited.
> 
> 
> No.  Currently in kernel builds, the use of FP registers is completely
> disabled and integer multiplication is done using the millicode library.
> However with a few FP regs, integer multiplication (32 bit) can be
> done in hardware except of course on machines that don't have FP
> hardware.  The downside is that the kernel has to save whatever
> FP registers it uses.
> 
> The -mfixed_range= option "fixes" a range if registers.  GCC won't
> use registers that are fixed.
> 
Sorry to come back so late with this question but what would be the range of fp registers?
or how may I try to define it as accurately as possible?
(I objdump a operating 2.6.12-rc.-pa. 64bit to grep some 'fr[12][0..9]' and all of them seems to be used?
Do I have to look elsewhere; tausq also spoke about: sic
[...]One proposal that has been talked about before is if we can
compile a version of the millicode lib that uses limited fpregs range
and compile the kernel using this new option that Dave is talking about,
then we will be able to get by using a (much) smaller subset of fp regs
and we won't have to save/restore them in the kernel. )

Thanks,
     Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
