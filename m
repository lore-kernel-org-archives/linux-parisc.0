Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolm2.tiscalinet.be [212.35.2.51])
	by dsl2.external.hp.com (Postfix) with ESMTP id 63DB2482E
	for <parisc-linux@lists.parisc-linux.org>; Mon, 18 Nov 2002 06:35:10 -0700 (MST)
Date: Mon, 18 Nov 2002 14:34:56 +0100
Message-ID: <3DA3C9AF00003D31@ocpmta2.be.tiscali.com>
In-Reply-To: <20021115205028.GI7587@systemhalted>
From: jsoe0708@tiscali.be
Subject: Re: [parisc-linux] [2.5] next issues ...
To: "Carlos O'Donell" <carlos@baldric.uwo.ca>,
	"Randolph Chung" <randolph@tausq.org>
Cc: "John David Anglin" <dave@hiauly1.hia.nrc.ca>,
	bzeeb-lists@lists.zabbadoz.net, parisc-linux@lists.parisc-linux.org
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

Hey Carlos,

>
>> > My impression from what Joel has said is that the problem is bad coding
>> > rather than an actual gcc problem.  However, up to now, nobody has been
>> > able to provide a precise analysis of what's going on.
>> 
>> or even duplicate the problem.. i've been building 2.4 and 2.5 kernels
>> with 3.2 for some time.... haven't seen the problems that have been
>> reported.
>> 
>
>32 or 64-bit kernels? All debian tools? Mix of debian and upstream?
>

For my part I only tested 32bits 2.4.19 with gcc-3.2 (and previously 3.1).
The same problem occured as well with a cross compiled (hppa->hppa) as native
compiled gcc (following toolchain-howto method).
Unfortunaltely the best I could back trace was that the last kernel function
call was (trivial) dump_stack

>My only run-in with the problem was with 32-bit kernels cross compiled
>from x86. Though lately I'm using a gcc-3.1 based XC and it builds functional
>64-bit kernels.
>
>This is definately becoming one of those HPPA urban legends. I shall add
>it to my TODO list and verify that I can build a 32/64-bit kernel
>natively and cross with all the latest upstream cvs bits.
>

(I did this test _some month ago_ but did not bring me the sol. But that
was some month ago.)

I do also test loopback device (127.0.0.1) but (shame on me) I forgot the
result :((
The goal of this test was to try to point out the location of the problem:
ethernet driver or IP?

Any other idea are well come,
Joel

 

-----------------------------------------------------
ADSL Advantage...L'activation et le 1er mois sont GRATUITS...http://adsl.tiscali.be
