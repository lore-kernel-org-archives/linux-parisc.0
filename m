Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp102.urscorp.com (smtp102.urscorp.com [65.207.129.233])
	by dsl2.external.hp.com (Postfix) with ESMTP id E37A5482C
	for <parisc-linux@lists.parisc-linux.org>; Tue, 15 Jan 2002 13:17:30 -0700 (MST)
To: linux-tr@linuxtr.net
Cc: linux-tr@linuxtr.net,
	HP900 PARISC mailing list <parisc-linux@lists.parisc-linux.org>,
	Randolph Chung <randolph@tausq.org>,
	Matthew Wilcox <willy@debian.org>, jochen@scram.de
Subject: Re: [linux-tr] Re: [parisc-linux] IBM TR patch
From: mike_phillips@urscorp.com
Message-ID: <OF92E3B858.7A575C3D-ON85256B42.0068A37B@urscorp.com>
Date: Tue, 15 Jan 2002 15:10:47 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
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

>> it's not broken, the assumptions in ibmtr are.  after you've ioremapped
>> a region, you can call readb/writeb on it.  ibmtr assumes you can just
>> do direct memory accesses.  now, this is something we want to fix,
>> but it's not a bug in the PA code.

Its in ibmtr purely for historical reasons, the driver is quite old and 
was around before the other architectures really came on stream, so we 
never had to worry about issues like this. 

>Then maybe it's best to define the TR_CHECKSUM macro to 0 as default with 

>an exception of architectures where the above assumption in true (i.e. 
>alpha, i386 and maybe ppc, as well) to gain the extra performance boost 
of 
>the IPv4 pre summarisation.

Possibly better to define it based upon the architecture in the code 
itself, either that or remove it altogether. Again because of the age of 
the driver this may be in there for a reason that is not valid anymore.

What I have to ensure is that we don't lose any functionality that we 
already have, i.e. a change for parisc stops i386/alpha/etc from working. 
Also, the pcmcia driver ibmtr_cs relies on ibmtr and, being pcmcia, can be 
used on more architectures and all changes to ibmtr have to be double 
checked against ibmtr_cs. 

Just out of interest, which t/r chipset does the token ring adapter for 
the old 712's use ? If its the tropic chipset I can test on my 712/80. 

Mike Phillips
Linux Token Ring Project
http://www.linuxtr.net
