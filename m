Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mel-rto6.wanadoo.fr (smtp-out-6.wanadoo.fr [193.252.19.25])
	by dsl2.external.hp.com (Postfix) with ESMTP id 18AB14834
	for <parisc-linux@parisc-linux.org>; Sat, 13 Jul 2002 16:24:18 -0600 (MDT)
Message-ID: <3D30A926.8020509@wanadoo.fr>
Date: Sun, 14 Jul 2002 00:26:46 +0200
From: eddantes@wanadoo.fr
MIME-Version: 1.0
To: Frank Alden Smith <falden@comcast.net>
Cc: parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] locales held back
References: <NGBBJKHCMLEJELIEEHNOCEDPCAAA.falden@comcast.net>
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

Frank Alden Smith wrote:
> hi,
> 
> For the last two days I've been told by apt-get upgrade that the locales
> package has been held back. Today I decided to try apt-get install
> locales with this result:
> 
> puccini:~# apt-get install locales
> Reading Package Lists... Done
> Building Dependency Tree... Done
> Some packages could not be installed. This may mean that you have
> requested an impossible situation or if you are using the unstable
> distribution that some required packages have not yet been created
> or been moved out of Incoming.
> 
> Since you only requested a single operation it is extremely likely that
> the package is simply not installable and a bug report against
> that package should be filed.
> The following information may help to resolve the situation:
> 
> Sorry, but the following packages have unmet dependencies:
>   locales: Depends: glibc-2.2.5-8 but it is not installable
> E: Sorry, broken packages
> 
> Any, idea how I can resolve the problem, or must I just be patient until
> the broken glibc-2.2.5-8 is fixed?
> 
> Take care,
> frank


That's a pretty common situation in Debian Sid (unstable), especially 
between locales and glibc. I've seen it happen qui a lot of times, but 
it's just harmless.

This situation will end in a few days, just let time to package 
maintainers to do their job and release correcly compiled and packaged 
software.

/Dantes
