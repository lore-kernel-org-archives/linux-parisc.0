Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.centraltx.com (unknown [64.209.39.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6D0B0482A
	for <parisc-linux@lists.parisc-linux.org>; Thu,  6 Jun 2002 09:00:37 -0600 (MDT)
Date: Thu,  6 Jun 2002 09:58:46 -0500
Message-Id: <200206060958.AA114426440@mail.centraltx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
From: "marc " <marc@centraltx.com>
Reply-To: <marc@centraltx.com>
To: <marc@centraltx.com>,
	"Carlos O'Donell Jr." <carlos@baldric.uwo.ca>,
	Helge Deller <deller@gmx.de>
Cc: <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] Building my first kernel
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

ok, so set CVSROOT=:pserver:anonymous@cvs.parisc-linux.org:/var/cvs 
and then do a:

  cd /usr/src
  cvs checkout linux
  cvs checkout palo


am i right?

-Marc

---------- Original Message ----------------------------------
From: Helge Deller <deller@gmx.de>
Date:  Thu, 6 Jun 2002 09:19:20 +0200

>Hi Marc,
>
>Go to
>http://cvs.parisc-linux.org/
>and check out the linux and palo directories with an anonymous account.
>Then build your linux kernel from the linux directory.
>
>Greetings,
>Helge
>
>On Thursday 06 June 2002 06:39, marc  wrote:
>> i did:
>>
>>    apt-get install kernel-source-2.4.18-hppa
>>
>> ---------- Original Message ----------------------------------
>> From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
>> Date:  Wed, 5 Jun 2002 23:46:37 -0400
>>
>> >> Call me crazy, but I cannot get this to work. There doesn't seem
>> >> to be a 'palo' target for make. When I run make palo it just
>> >> runs the make all (below are the first few lines).
>> >>
>> >> Any Ideas?
>> >
>> >How did you get the source tree for linux and palo?
>> >
>> >c.
>
>
