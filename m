From: Joel Soete <soete.joel@tiscali.be>
Subject: [parisc-linux] Re: copy_user_page_asm suggested 64bit improvment
	(Test case)
Date: Wed, 29 Dec 2004 11:36:44 +0000
Message-ID: <41D296CC.2040108@tiscali.be>
References: <418A80E8000124B5@mail-6-bnl.tiscali.it>
	<20041227073654.GI29492@colo.lackof.org>
	<41D18909.9060308@tiscali.be>
	<20041229054655.GB11816@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Grant Grundler <grundler@parisc-linux.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20041229054655.GB11816@colo.lackof.org>
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
> On Tue, Dec 28, 2004 at 04:25:45PM +0000, Joel Soete wrote:
[...]
> 
> As usual, I've hacked the cpup.c test.
Cool ;-)

> Don't compare my results below with the previous ones Joel posted.
> I've committed my version of cpup.c to "build-tools" repository.
>
Thanks

[...]
> 
> cpup2 is what I'd like to commit for the kernel version.
> I've appended the patch.
> 
Nice

> I was expecting cpup3 would be slightly faster but don't have data
> to prove it.
Don't know where can we find L1-Cache state diagram to help more?

> And I'm still worried that GR23/GR24 won't be saved
> by the caller since the __copy_user_page_asm function prototype
> only specifies two arguments.
> 
> thanks,
> grant
> 
Thanks for your attention,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
