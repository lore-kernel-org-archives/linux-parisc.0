Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cpout1.tiscali.be (unknown [62.235.13.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 93F04482C
	for <parisc-linux@lists.parisc-linux.org>; Thu, 22 May 2003 03:53:01 -0600 (MDT)
Date: Thu, 22 May 2003 11:52:54 +0200
Message-ID: <3EC761C200001DBB@ocpmta7.freegates.net>
In-Reply-To: <20030519163245.GN16608@parcelfarce.linux.theplanet.co.uk>
From: "Joel Soete" <jsoe0708@tiscali.be>
Subject: Re: [parisc-linux] glibc pthreads actual threads?
To: "Matthew Wilcox" <willy@debian.org>
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
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

>On Mon, May 19, 2003 at 06:27:41PM +0200, Joel Soete wrote:
>> But notice  a very strange behaviour:
>> _the pid is not the same for each thread_ ??
>> 
>> Having just a small sunos 5.8 with gcc-3.2.2 (but with native libpthread)
>> the pb does not occurs?
>> 
>> Is it a limit of glibc (in general or in 2.3 only?) for all linux or only
>> hppa?
>
>it's a limit of your understanding ;-)  POSIX specifies both behaviours
>are legitimate.
>
Just for remind and for those who also have this kind of philophical pb :-)).
In fact following test, an ardent discuss born here between high level system
engineer and one of them help me to find this interesting link:
<http://www.onlamp.com/pub/a/onlamp/2002/11/07/linux_threads.html>

    Joel


---------------------------------
Vous surfez avec une ligne classique ?
Economisez jusqu'à 25% avec Tiscali Complete !
Offre spéciale : première année d'abonnement offerte.
... Plus d'info sur http://complete.tiscali.be
