From: =?ISO-8859-1?Q?Sebastian_Br=FCckner?= <sebastian.brueckner@epost.de>
Subject: Re: [parisc-linux] HP B132L hangs
Date: Thu, 11 Sep 2003 17:33:10 +0200
Message-ID: <3F6095B6.7050706__15217.422709293$1416622768$gmane$org@epost.de>
References: <3F5F24D9.7030800@epost.de> <3F5F2D4E.7040700@tiscali.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
To: parisc-linux@parisc-linux.org, debian-hppa@lists.debian.org
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <3F5F2D4E.7040700@tiscali.be>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Joel Soete:
> Yes it looks like a disk becoming defective. The best way to be sure is 
> to use a hp cdrom containing Diagnostic tools (iirc the last hpux 
> support + would contains it). This cd is bootable and contains tools 
> allowing you test your disk.

I don't have such a cd...
I have only two HP cd sets:
"HP-UX Applications/Patches 10.20" 5 CDs
"Additional Core Enhancements HP-UX 10.20 Workstations" 1 CD

Do you know if one of them contains these tools?

> If you have another system on which you can connect your suspected disk 
> you can also try a dd cmd like:
> dd if=/dev/rdsk/c0txd0 of=/dev/null bs=2048k (where you replace 
> /dev/rdsk/c0txd0 by the actual disk path)

See my other post for results of backup... it provoced the same (or at 
least a similar) error :-/
I do not currently have another system I could put the disk in (I got a 
C200 but it is not in a working state right now). The disk does not 
contain too important data - but it was a lot of work to set up the router.


thx,
   Sebastian
