From: =?ISO-8859-1?Q?Corn=E9_Beerse?= <cbeerse@lycos.nl>
Subject: Re: [parisc-linux] Console problem
Date: Wed, 01 Dec 2004 09:23:00 +0100
Message-ID: <41AD7F64.2040404@lycos.nl>
References: <Pine.LNX.4.58.0411301543230.17128@rray.drdc.mstc.ms.gov>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: rray@tcmail.mstc.state.ms.us
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <Pine.LNX.4.58.0411301543230.17128@rray.drdc.mstc.ms.gov>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

rray@tcmail.mstc.state.ms.us wrote:
> Hey all,
> 
> I've just installed Debian on a 9000/819 K200.
> The base install went fine after I changed the console to ttyB0.
> After the reboot I get the dredded "If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org".
> And this is the last thing I see.
> I've seen references in the mailing list about switching consoles but not
> what this really means.
> I only have one console connected with a serial cable to the console port
> of the server.
> Could someone give me a little more info.

This all depends on the base system (your K200 here) and sometimes additional 
hardware.

I don't know details on your K200 but for example my (now gone) D210 was verry 
basic: just a processor, memory, disk and tape. No additional terminal cards or 
such. This box just continued after a relative long time with the kernel loading 
messages. Your tip: patience...

My (still pressent) D370 has an additional service card with an UPS connector 
and a phone-connector. With this system, I had to plug the console from the 
first to the second serial connector. After removing the board, the console 
stays on the first serial connector. Your tip: remove not necessary boards from 
the system, just to get it going.

I recall from messages on this list that machines with serial consoles on 
expansion boards (boards with multiple serial connectors) do have problems with 
their console since the boards are not that well (read not at all) supported due 
to lack of documentation.

Hence, check the documentation on all pages mentioned at the debian-porting 
page: http://www.debian.org/ports/hppa/


CBee


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
