Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from sh.od.inet (CPE0080c82c70ca.cpe.net.cable.rogers.com [24.112.140.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id 003E7482A
	for <parisc-linux@lists.parisc-linux.org>; Thu, 28 Mar 2002 10:27:46 -0700 (MST)
Received: (from carlos@localhost)
	by sh.od.inet (8.11.6/8.11.0) id g2SHSmL12784
	for parisc-linux@lists.parisc-linux.org; Thu, 28 Mar 2002 12:28:48 -0500
Date: Thu, 28 Mar 2002 12:28:48 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20020328122848.H12094@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] [carlos@baldric.uwo.ca: Re: Any hppa gurus?]
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

Just a heads-up to see if anyone is having fp issues in 
any of their adventures :)

I hope I got all the fp passing stuff right since I'm
no 'hppa guru' ;)

c.

----- Forwarded message from "Carlos O'Donell Jr." <carlos@baldric.uwo.ca> -----

Date: Thu, 28 Mar 2002 12:24:45 -0500
From: "Carlos O'Donell Jr." <carlos@baldric.uwo.ca>
To: Will Newton <will@misconception.org.uk>, debian-hppa@lists.debian.org
Cc: willy@debian.org, dave@hiauly1.hia.nrc.ca
Subject: Re: Any hppa gurus?
User-Agent: Mutt/1.2.5.1i
In-Reply-To: <E16qbcu-0005v7-00.2002-03-28-15-15-45@cmailg3.svr.pol.co.uk>; from will@misconception.org.uk on Thu, Mar 28, 2002 at 03:15:29PM +0000
X-Useless-Header: oooohhmmm, chant the email mantra...
X-Mailer: Patched Mutt OS 1.2.5 - Neural Implant (0% Sync Ratio [..........])


> I am still seeing a very similar problem with latest unstable gcc.
> 
> The first four floats (or first two doubles) passed to an indirect function 
> are always 0.0.
> 
> > I could help out with any questions you might have
> > (or coerce the information out of others I know ;)
> 
> Any help would be much appreciated. I have attached the code (it is quite 
> small). It's aim is to take an array of arguments and pass them to a native 
> function. Unfortunately the function does not work for doubles and there also 
> seems to be a crash for some reason (stack corruption?) after several calls.

avcall-hppa.c:

     64   {
     65     int i;
     66     for (i = -arglen; i < -4; i++)      /* push function args onto stack */
     67       argframe[i] = l->args[__AV_ALIST_WORDS+i];
     68   }
     69 
     70   if (l->rtype == __AVstruct)           /* push struct return address */
     71     sret = l->raddr;
     72 
     73                                 /* call function, pass 4 args in registers */
     74   i = (*l->func)(l->args[__AV_ALIST_WORDS-1], l->args[__AV_ALIST_WORDS-2],
     75                  l->args[__AV_ALIST_WORDS-3], l->args[__AV_ALIST_WORDS-4]);
     76 

64-68 - Great, pass it on the stack
75-75 - Need to check argument type, if float/double it needs to passed
        via fr4-fr7 else gr23-gr26.

It's been decided to go with the ~"64-bit HPUX ABI" and stop passing floating 
point values in general registers (since this requires proper CALL info 
and relocating stubs from the linker).

Which means you can no longer place float/double arguments into general
register.

What does the av_alist structure look like? If it has a 'type' per argument,
it it shouldn't be too hard to write the code.

Current way it's done:
No Arguments in general registers:

1 Double  - fr7 (fr7 hi, fr6 low)
2 Doubles - fr7,fr5
3 Doubles - fr7,fr5,Stack...

1 Float   - fr7
2 Floats  - fr7,fr6
3 Floats  - fr7,fr6,fr5
4 Floats  - fr7,fr6,fr5,fr4
5 Floats  - fr7,fr6,fr5,fr4,Stack...

And then some old stuff due to 'thinking its doing relocation':

2 Doubles with argument in the first 1-2 general 
(gr25,26) register:
	- fr7(fr7 hi, fr6 low),Stack...

2 Doubles with arugment in the first 3-4 general 
(gr23,24,25,26) registers:
	- Stack...

And so on... most of this is due to thinking:
- Is there enough space for the argument in the general registers?
	- No -> Stack
	- Yes -> Pass as fp argument in fr's.

Cheers,
Carlos.

----- End forwarded message -----
