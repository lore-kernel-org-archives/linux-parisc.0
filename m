Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beloit.edu (beloit.edu [144.89.40.1])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4348E4834
	for <parisc-linux@lists.parisc-linux.org>; Sun,  4 Nov 2001 19:56:42 -0700 (MST)
Received: from localhost ([144.89.185.182])
	by beloit.edu (AIX4.3/8.9.3/8.9.0) with ESMTP id UAA14070
	for <parisc-linux@lists.parisc-linux.org>; Sun, 4 Nov 2001 20:51:13 -0600
Date: Sun, 4 Nov 2001 20:56:40 -0600
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v472)
From: Daniel Williams <dan@bigw.org>
To: parisc-linux@lists.parisc-linux.org
In-Reply-To: <200111022221.PAA07613@puffin.external.hp.com>
Message-Id: <BC52B862-D198-11D5-80EF-0030657D1C94@bigw.org>
Subject: [parisc-linux] Re: More Install on C110: Kernel doesn't load...
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

OK, burned the straight download ISO the way that works with EasyCD 
Creator, but it still gives me the same message as last time, in the 
same place as last time.

<snip of seg 0-3 loads>
Error: read from boot device failed( status = -4)
byteio_read: seekread() returned -1 expected 2048
error:  segment 0 read() failed

The CD was burned at 2x and the discs are 4x certified (PNY).  The CD is 
external on the 50 pin narrow bus (core.SCSI.2.0)  However, it does not 
have termination on the external bus.  The internal narrow SCSI devices 
*do* have termination (ie the DDS2 tape drive).  I have switched the CD 
with the DDS2 drive before, but not this time with the new correct 
burn.  Could termination be an issue here and should I try putting the 
CD drive internally with termination?

C110
64Mb x 2
2.1GB FW differential SCSI
DDS2 narrow tape drive
External narrow CD drive
Standard blah blah graphics

Thanks in advance,
Dan


On Friday, November 2, 2001, at 04:21 PM, Grant Grundler wrote:

> Daniel Williams wrote:
>> Error: read from boot device failed (status = -4)
>> byteio_read: seekread() returned -1 expected 2048
>> Error:  segment 0 read() failed
>>
>> Any thoughts?
>
> When burning the IA64 boot CD, i was warned to use the 2x (vs 4x) burn
> speed. This sounded like hogwash to me but the person was told the disk
> burned at 4x may not work well with older/slower CD drives. If someone
> could confirm this I'd appreciate it...anyway, the ia64 CD worked fine.
>
> grant
>
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
