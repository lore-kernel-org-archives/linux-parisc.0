Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 904894829
	for <parisc-linux@lists.parisc-linux.org>; Sat, 10 May 2003 16:31:46 -0600 (MDT)
Message-ID: <3EBD7E96.6030501@tiscali.be>
Date: Sat, 10 May 2003 22:35:02 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] dump module: new feature
References: <3EB6460D.6040704@admin.france.hp.com>
In-Reply-To: <3EB6460D.6040704@admin.france.hp.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Bruno Vidal wrote:

>     Hi
> For people who are intersting to it, the dump modules
> is now checking that it is a swap device before
> configuring it. So it remove the risk to dump
> to a file system. It check for the swap magic
> "SWAP-SPACE" (v0) or "SWAPSPACE2" (v1). The
> partition is not necessary an active one,
> it should only be created by mkswap (so no
> file system on it).
>
>     Cheers.
>
Hi Bruno,

I just recover my b2k test system (even I quiet sure to find from place 
to place some files corrupted by its crash) and I would so now find some 
free time to test your last patch if you would still submit it to me.

Regards,
    Joel
