Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id EB8D2483E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 16 Jun 2002 22:45:09 -0600 (MDT)
Date: Sun, 16 Jun 2002 21:45:09 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org,
	<richard_hirst@linuxcare.com>
Subject: Re: [parisc-linux] Unaligned access failures with apt-get on SMP
 K460.
In-Reply-To: <1024285076.8850.36.camel@beavis>
Message-ID: <Pine.LNX.4.44.0206162125530.24659-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

On 16 Jun 2002, Ryan Bradetich wrote:

> Hello Jeremy,
> 
> The SMP problem is what I am trying to debug.  I am running SMP cvs head
> on the J200 and the K460 and also an A500 recently thanks to the ESIEE
> team.  The K460 has 4 processors which I am hoping will help to identify
> the SMP problems faster, but it is also exposing new SMP problems for me
> to look into :(
I can try things out for you on my J5k if it will help.  This box was not 
being used at my work, so they let me install linux on it and play with it 
until it is needed.  So, it is okay for me to crash it :P

> Thanks for the report! and if you notice anything else odd (or
> repeatable patterns) let me and/or the list know so maybe it will
> provide additional insights into the problems.
This time I got a new message.

WARNING! Stack pointer and cr30 do not correspond!
Dumping virtual address stack instead

Dumping Stack from 0x203c8000 to 0x203cc700:
8000 c377fe59 d5f07332 86effcb3 abe0e665 0ddff967 57c1cccb 1bc9479d 
aff52cc4
8020 37928f3b 5fea5989 6f53ab25 bfa20640 dea7564b 7f440c81 bd3819c5 
fefeac50
8040 7a70338b fdfd58a1 f4e06717 fbfab143 e9c0ce2f f7f56287 d3819c5f 
efeac50f

<tuns of hex deleted>

The next time, it just locks up, no message.

It looks horribly unpridictable, although I have found 2 programs that 
consistantly do it: samba and apt-get.  

If I could be of any help, testing or coding, let me know.  I don't know a 
lot about the parisc arch, but I would be willing to learn...  I would 
like to make linux a viable alternative to HP-UX for our clients, but 
since they are still stuck in 10.2x land, I don't think they will be very 
interested in change...  Still, these boxes would make pretty good 
development workstations around here, despite their size, power 
consumption, and heat output...


-- 
Freedom's just another word for nothing left to lose.
		-- Kris Kristofferson, "Me and Bobby McGee"
