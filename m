Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id AE0254834
	for <parisc-linux@lists.parisc-linux.org>; Sat, 25 Jan 2003 10:21:35 -0700 (MST)
Message-ID: <3E32D7C0.9020703@tiscali.be>
Date: Sat, 25 Jan 2003 18:30:24 +0000
From: Joel Soete <joel.soete@tiscali.be>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: grundler@dsl2.external.hp.com, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
Subject: Re: [parisc-linux] new gcc-default for hppa
References: <200301250423.h0P4Noxq000220@hiauly1.hia.nrc.ca>
In-Reply-To: <200301250423.h0P4Noxq000220@hiauly1.hia.nrc.ca>
Content-Type: text/plain; charset=us-ascii; format=flowed
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


John David Anglin wrote:
>>That said, always in the continuity of this idea, I also notice that ld is
>>used to build some kernel parts. Is it  possible (even manually just for
>>test) to use gcc in place of ld? (if yes, howto?)
> 
> 
> When linking, gcc is just a front end for ld.  You can see what happens
> with "-v", "-Wl,-v", "-Wl,-debug", etc.  You can pass any option that
> you want to ld using the gcc "-Wl" option.  Gcc doesn't doing any linking
> itself.
> 

Ha Ok.

My confusion came from Helge Deller mail:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2003-January/018970.html>

But he spook about g++ (which I presume is different of gcc)?

Thanks,
	Joel
