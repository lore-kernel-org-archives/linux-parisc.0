Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 2091A4841
	for <parisc-linux@parisc-linux.org>; Sat,  8 Nov 2003 05:46:18 -0700 (MST)
Message-ID: <3FACE5A4.7070003@tiscali.be>
Date: Sat, 08 Nov 2003 12:46:28 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Joel Soete <soete.joel@tiscali.be>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was:
 do_page_fault?]
References: <3F969FFE00005DB3@ocpmta2.freegates.net>
In-Reply-To: <3F969FFE00005DB3@ocpmta2.freegates.net>
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

Hello Carlos,

More and more strange behaviour:

after my weekly apt-get dist-upgrade i relaunch evolution,
it hang again at the same point with usual message:
evolution (pid 2999): Protection id trap (code 27)
[..]

But if I launch it a second time no more pb???

Very strange isn't it?

Joel 


Joel Soete wrote:
> Carlos,
> 
> Yes it didn't crash anymore :)
> 
> But I didn't have more opportunity to reboot severall time this c110 to make
> more test (the only difference between the two previous one: the first was
> a reboot, the second was a boot? and absolutley no other changes).
> 
> Cheers,
>     Joel
> 
> 
> 
>>-- Original Message --
>>From: Carlos O'Donell <carlos@baldric.uwo.ca>
>>To: Joel Soete <soete.joel@tiscali.be>
>>Cc: parisc-linux@parisc-linux.org
>>Date: Sun, 2 Nov 2003 15:22:28 -0500
>>Subject: Re: [parisc-linux] evolution (1.4.5-1) 'protection id trap' [was:
>>do_page_fault?]
>>
>>
>>On Sat, Nov 01, 2003 at 11:27:20PM +0000, Joel Soete wrote:
>>Hi Carlos,
>>
>>I don't understand anymore anything.
>>
>>This afternoon i recompile k 2.4.23-pre9-pa13 + Randolph patch to test
>>it. (Ok)
>>
>>So I launch evolution which crash at 
>>he same place as usual.
>>
>>After the diner I restart this c110 with this new kernel but this time,
>>no more "do_page_fault() pid=805 command='evolution' type=7". I restart
>>it severall time no means to reproduce anymore :(
> 
> 
> So it doesn't cras
> 
>>anymore? :) 
> 
> 
> c.
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
> 
> 
> -------------------------------------------------------------------------
> Tiscali ADSL: 3 mois GRATUITS! L'Internet rapide, c'est pour tout le monde.
> 
> http://reg.tiscali.be/default.asp?lg=fr
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
