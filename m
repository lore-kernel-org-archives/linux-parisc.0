From: Ulrich Teichert <krypton@ulrich-teichert.org>
Subject: [parisc-linux] Re: Support for 2.4.x kernels on hppa
Date: Mon, 24 May 2004 21:07:52 +0200 (MEST)
Message-ID: <200405241907.i4OJ7qZb032746__33476.3435800143$1416623451$gmane$org@arbas.nms.ulrich-teichert.org>
References: <20040524183227.GW7207@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: debian-hppa@lists.debian.org
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040524183227.GW7207@tausq.org> from "Randolph Chung" at May 24,
	2004 11:32:27 AM
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hi,

>I'd like to take an informal "survey" of what kernel versions people are
>using....

Mostly, 2.4.17, the debian default kernel or 2.4.25/6-pa*.

>For the last year or two, most of the kernel developers have been
>focusing on the 2.5/2.6 kernels; as a result many bugs that were
>presented in both 2.4 and 2.6 kernels have been only fixed in 2.6. This
>is understandable given that there are only a few active parisc-linux
>kernel developers.... moving foward it is becoming more difficult to
>support the 2.4.x kernels, and we are finding that we need to put in
>some not-so-nice workarounds in some userspace tools to cope with bugs
>in the 2.4 kernel.

I understand the pain to maintain 2 trees. I once had to maintain 4
separate trees (in SCCS - ouch), which at least doubled the pain, but
I think it grows exponential.

>So, the question is, how many of you run parisc-linux on 2.4
>"production" systems and "cannot" switch to 2.6? At last count there are
>about 1200 registered parisc-linux users on the p-l website, and i know
>at least some folks run parisc-linux on decent-sized clusters... so we 
>definitely don't want to break things if people are using 2.4 actively 
>on these systems and have legitimate reasons not to move to 2.6....

Right now, I use debian woody on all my boxes and upgrading to testing
is a PITA for me, as I only have an ISDN line (*one* line - 64k). I usually
install from CD-ROM.

>If you are one of those people who really care about 2.4 support, please
>speak up now! 

Actually, I only have two HPPA production systems, my firewall (a 712/80)
and a 240, everything else is for fooling around - but both are on debian
woody and more or less tied to 2.4. Or are there offical woody backports of
the toolchain needed for 2.6 (preferred under 1G...)?

CU,
Uli
-- 
Dipl. Inf. Ulrich Teichert|e-mail: Ulrich.Teichert@gmx.de
Stormweg 24               |listening to: Noticable One (Rotten Apples)
24539 Neumuenster, Germany|Obstacle 1 (Interpol) Paranoia (N.Y. Rel-X)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
