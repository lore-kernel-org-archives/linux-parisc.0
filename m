Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.tiscali.be (unknown [62.235.14.106])
	by dsl2.external.hp.com (Postfix) with ESMTP id E3C10482E
	for <parisc-linux@parisc-linux.org>; Wed,  7 Aug 2002 00:36:42 -0600 (MDT)
Date: Wed, 7 Aug 2002 08:30:58 +0200
Message-ID: <3D38181A0000142A@ocpmta6.be.tiscali.com>
In-Reply-To: <20020805145919.GB31773@systemhalted>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] Palo: cmdline and commanline has different limits?
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"Joel Soete" <joel.soete@freebel.net>, bame@fc.hp.com,
	parisc-linux@parisc-linux.org
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
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

>-- Original Message --
>From: Carlos O'Donell <carlos@baldric.uwo.ca>
>To: Joel Soete <joel.soete@freebel.net>, bame@fc.hp.com,
>	parisc-linux@parisc-linux.org
>Subject: Re: [parisc-linux] Palo: cmdline and commanline has different limits?
>Date: Mon, 5 Aug 2002 10:59:19 -0400
>
>
>> > I do not know yet if pad1 can be removed so that cmdline could reach
>204 
>> > [240-8-7*(sizeof int = 4?)] char lenght, also I prefer to let you choise.
>> > 
>> > Joel
>> 
>> I don't see why not? Would 200 characters be enough for your application?
>> 
>> I do think that "> 255" should be changed in palo.c
>> 
>> To push it out further would require teaching palo about 
>> both formats (and understanding why the comment mentions 
>> that all the data must fit in 256 byes).
>> 
>> c.
>
>Joel,
>
>I just talked to Bame and we both agree that those bytes would
>best be left for future expansion.
>
>I've made the change in palo.c such that it checks for "> 127"
>I'll be cheking that in today, and a new deb of palo should be out
>next week. If you would like to help in the testing process then 
>checkout palo from cvs and you can build the package yourself.
>
>The documentation for palo was updated to reflect a limit
>in the -c argument.
>
>Do you have a particular use for more than 127 bytes of command line
>information? Passing a _lot_ of data via the command line is not 
>accepted as good practice :}

Carlos,

It is Ok for me.

I do not actualy need more.
I am just studying palo code to see what have to be done to support raid1
md for the /boot device :) and just notice that potential problem so I report
it :)

Thanks a lot for all,
    J.
