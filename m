From: Joel Soete <joel.soete@tiscali.be>
Subject: Re: [parisc-linux] new gcc-default for hppa
Date: Sat, 25 Jan 2003 18:30:24 +0000
Message-ID: <3E32D7C0.9020703__30529.6877086677$1416622143$gmane$org@tiscali.be>
References: <200301250423.h0P4Noxq000220@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Cc: grundler@dsl2.external.hp.com, tausq@debian.org,
	parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <200301250423.h0P4Noxq000220@hiauly1.hia.nrc.ca>
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
