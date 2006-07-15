From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] HPPA NPTL Support committed to libc-ports,help
	needed!
Date: Sat, 15 Jul 2006 13:32:32 +0000
Message-ID: <44B8EE70.8080602@tiscali.be>
References: <J2EH4I$3077C4C25049A3D92E390FB82AA610CA@scarlet.be>
	<44B8441A.4030200@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: Joel Soete <soete.joel@scarlet.be>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Randolph Chung <randolph@tausq.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <44B8441A.4030200@tausq.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello parisc-linux,

Randolph Chung wrote:
>>>gcc cvs head newer than 2005-07-05 with TLS turned on.
>>
>>Just to be sure: is it well 2005?
>>if yes latest gcc-4.1 would be good enough (if rebuild with previous binutils)?
> 
> 
> July 2005 sounds correct. Yes, it has been merged for some time. Make
> sure you build gcc with the correct binutils, and that gcc is configured
> to enable TLS.

I have check to <http://buildd.debian.org/build.php?arch=hppa&pkg=gcc-4.1>

and afaik debian gcc-4.1 release >= 4.1.1-6 should be ok
(iirc no gcc configure option to build it with tls support but a check if used binutils supports it)

[snip]
bzip2: missing
binutils: already installed (2.17-1 >= 2.16.1cvs20051214 is satisfied)
binutils-hppa64: missing
[snip]

(still need to check if this pb:
<http://lists.parisc-linux.org/pipermail/parisc-linux/2006-May/029185.html>
is not any more in 4.1.1, i will advise?)

> See the build script Carlos referenced for appropriate
> configure parameters.
> 
> randolph
Many thanks,
	Joel
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
