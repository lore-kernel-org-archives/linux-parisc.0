Return-Path: <soete.joel@tiscali.be>
Received: from spoolo2.tiscali.be (spoolo2.tiscali.be [62.235.13.173])
	by dsl2.external.hp.com (Postfix) with ESMTP id E13BC48BA
	for <parisc-linux@lists.parisc-linux.org>;
	Sun, 14 Mar 2004 12:58:35 -0700 (MST)
Message-ID: <4054B9BC.30309@tiscali.be>
Date: Sun, 14 Mar 2004 19:59:56 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] 	RE: New glibc patches 2004-03-08, fixes GLRO
	changes.
References: <20040312164116.GI24266@baldric.uwo.ca>
	<404EC1C600002B98@ocpmta1.freegates.net>
	<20040312212012.GS24266@baldric.uwo.ca>
	<40535A0A.4020209@tiscali.be>
In-Reply-To: <40535A0A.4020209@tiscali.be>
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Carlos,

I just noticed a border effect when I try to use James method: use prefix=/usr and make  install_root=/mnt/chroot install;

Joel Soete wrote:
> 
> 
> Carlos O'Donell wrote:
> 
>> On Fri, Mar 12, 2004 at 06:33:11PM +0100, Joel Soete wrote:
>>
>>> Hmmm all output files realted to Error1 was empty because of:
>>> hppa-linux-gcc -nostdlib -nostartfiles -o 
>>> /Develop/parisc-linux/build/glibc/posix/tst-regex
>>> -Wl,-dynamic-linker=/lib/ld.so.1
                         ^^^^^^^^^^^^

When I use the previous method (prefix=/mnt/chroot) it become :

-dynamic-linker=/mnt/chroot/lib/ld.so.1

So here I can drive make -k check without pb in basic env (the one in which I build the new glibc)

OTC with James' method I would have to do it in chroot /mnt/chroot env.
And it wasn't what I did; I will so restart build and test with prefix=/mnt/chroot (as I use to do) and advise you of the new 
results ;)

That's a way to lurn ;)

Joel
