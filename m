Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from cactus.bheadley.org (d197.focal4.interaccess.com [207.208.139.197])
	by dsl2.external.hp.com (Postfix) with ESMTP id DA138482A
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 08:35:50 -0700 (MST)
Received: from interaccess.com (IDENT:7PLeIgcoJb94A8AqkOC61BIVcvXApy2P@localhost.localdomain [127.0.0.1])
	by cactus.bheadley.org (8.11.6/8.11.6) with ESMTP id fBHFYYj06715
	for <parisc-linux@lists.parisc-linux.org>; Mon, 17 Dec 2001 09:34:43 -0600
Message-ID: <3C1E108A.40706@interaccess.com>
Date: Mon, 17 Dec 2001 09:34:34 -0600
From: "Bryan W. Headley" <bheadley@interaccess.com>
MIME-Version: 1.0
To: parisc-linux@lists.parisc-linux.org
Subject: [Fwd: Re: 735 and SCSI (was: Re: [parisc-linux] Firmware upgraded, STI console problem)]
Content-Type: multipart/mixed;
 boundary="------------000505070603050006030708"
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

This is a multi-part message in MIME format.
--------------000505070603050006030708
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Forgot to CC the list. Sorry!


-- 
____               .:.                 ____
Bryan W. Headley - bheadley@interaccess.com

--------------000505070603050006030708
Content-Type: message/rfc822;
 name="Re: 735 and SCSI (was: Re: [parisc-linux] Firmware upgraded, STI console problem)"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Re: 735 and SCSI (was: Re: [parisc-linux] Firmware upgraded, STI console problem)"


>From - Mon Dec 17 09:32:07 2001
X-Mozilla-Status2: 00000000
Message-ID: <3C1E0FF1.60507@interaccess.com>
Date: Mon, 17 Dec 2001 09:32:01 -0600
From: "Bryan W. Headley" <bheadley@interaccess.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US; rv:0.9.6) Gecko/20011120
X-Accept-Language: en-us
MIME-Version: 1.0
To: Richard Hirst <rhirst@linuxcare.com>
Subject: Re: 735 and SCSI (was: Re: [parisc-linux] Firmware upgraded, STI console problem)
References: <1008253261.495.4.camel@beavis> <Pine.LNX.4.33.0112141351590.31282-100000@bob.ncssm.edu> <20011214225505.F27312@linuxcare.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Richard Hirst wrote:

> On Fri, Dec 14, 2001 at 01:58:03PM -0500, Phil Anderson wrote:
> 
>>so has _anyone_ gotten a 735 working or anything? I have 7 of them that
>>are taking up space in my dorm room, and two 755's under the desk that
>>server the same purpose...
>>
> 
> I believe some people have had 735 working using narrow SE disks on
> the same i/f as the CD.
> 


My guess is, the thing to do is merge the FW stuff from MkLinux driver 
and see what still works. Slight problem with that driver is it knows 
what hardware you have by what machine it determines you have. FW, 
Big/Little endian configurations figured out on the spot. It'd be better 
to recognize those attributes by examining the controller.

Since my C110 has a fast/wide, and so does my 735, I'm in the bad spot 
of never really having either machine fully boot up. The CDROM drive I 
have doesn't "like" RW discs, so I'd love to see someone stamp out a 
Woody-ish master that I can read from.




-- 
____               .:.                 ____
Bryan W. Headley - bheadley@interaccess.com


--------------000505070603050006030708--
