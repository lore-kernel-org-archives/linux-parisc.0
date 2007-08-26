From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: [parisc-linux] errno codes intertwined
Date: Sun, 26 Aug 2007 20:43:06 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0708262038170.12920__25634.216288063$1416624429$gmane$org@fbirervta.pbzchgretzou.qr>
References: <Pine.LNX.4.64.0708241815540.28540@fbirervta.pbzchgretzou.qr>
	<200708261345.43165.vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Cc: sparclinux@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 parisc-linux@lists.parisc-linux.org,
 parisc-linux@parisc-linux.org
To: Mike Frysinger <vapier@gentoo.org>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200708261345.43165.vapier@gentoo.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


On Aug 26 2007 13:45, Mike Frysinger wrote:
>> can I rely on the same errno across Linuxes?
>
>nope
>
>> And should the errno values be fixed up?
>
>i guess that depends on whether you think it's even broken :)
>
>no spec requires any errno symbol have an exact numeric value ... i'm guessing 
>your FUSE is only cross-Linux and you're not planning on dipping into any 
>other OS ?

If the errnos are not the same in the Linux world, it's not even
cross-Linux ;-) - but it's always translated to fixed numbers now anyway.

I have not really thought about putting it in use on other systems yet. I
don't have macosx to test, and Windows generally lacks some fuses. :^)
You are free to spin it if you like, http://freshmeat.net/p/ccgfs/


	Jan
-- 
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
