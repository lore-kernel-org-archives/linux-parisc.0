Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (gapserver.centraltx.com [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id BDB2A483F
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 10:26:08 -0600 (MDT)
Date: Wed, 29 May 2002 11:25:26 -0500
Message-Id: <200205291125.AA386859468@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Java and SSH
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

The problem is per my original post that I do not have network
yet, I just needed the Java and SSH stuff to do some work,
but I guess I will wait until I get things up and running.

Thanks,
-Marc

---------- Original Message ----------------------------------
From: Andreas Deresch <aderesch@fs.tum.de>
Reply-To: Andreas Deresch <aderesch@fs.tum.de>
Date:  Wed, 29 May 2002 18:16:17 +0200 (CEST)

>On Wed, 29 May 2002, Matthew Wilcox wrote:
>
>> On Wed, May 29, 2002 at 11:04:58AM -0500, marc  wrote:
>> >
>> > >Check for OpenSSH, I'm pretty sure it's part of the compiled
>> > >packages.  As for Java, I'm pretty sure there is no pre-compiled form
>> > >for HPPA, but you can try to compile it, or try Kaffe
>> > >Aaron
>> >
>> > `apt-cache search ssh` returns nothing.
>> >
>> > Any other ideas?
>>
>> try an apt-get update first?
>ssh is in non-US isn't it? If there is no line like
>
>deb ftp://ftp.de.debian.org/debian-non-US unstable/non-US main
>(change for your favourite server, protocol, etc.)
>
>in /etc/apt/sources.list, that won't do anything.
>
>ad
>
>
>_______________________________________________
>parisc-linux mailing list
>parisc-linux@lists.parisc-linux.org
>http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
>
