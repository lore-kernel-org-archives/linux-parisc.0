Return-Path: <rbradetich@uswest.net>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 610B34830
	for <parisc-linux@lists.parisc-linux.org>;
	Thu, 15 Apr 2004 13:32:38 -0600 (MDT)
Subject: Re: [parisc-linux] Problem with SCSI in K-Class
From: Ryan Bradetich <rbradetich@uswest.net>
To: Jens_Konrad/Linotype/DE@linotype.com
In-Reply-To: <OF18825705.F1E7C8A9-ONC1256E77.0068D1BD-C1256E77.0068D3C8@fonts.de>
References: <OF18825705.F1E7C8A9-ONC1256E77.0068D1BD-C1256E77.0068D3C8@fonts.de>
Content-Type: text/plain
Message-Id: <1082057550.976.98.camel@laptop.bradetich.net>
Mime-Version: 1.0
Date: Thu, 15 Apr 2004 13:32:30 -0600
Cc: parisc-linux@lists.parisc-linux.org
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

Which kernel?  I will see if I can duplicate on K460.

Thanks,

- Ryan

On Thu, 2004-04-15 at 13:04, Jens_Konrad/Linotype/DE@linotype.com wrote:
> Hi guys,
> 
> I got my K-Class 200 working in single kernel mode, it is booting from high voltage scsi - on the normal scsi I got a CD-Rom and a Streamer.
> 
> Now I took away the streamer and replaced it with a 50GB SCSI and booted the machine. During boot he can see the HD without any problems (it is a Seagate), and I can also address it via fdisk (it is
> sde).
> 
> But when I try to partition it, it comes as far as writing superblocks - and then I get a stack dump and the kernel panics, the machine freezes - and that was it.
> 
> My guess is that the low voltage scsi-controller cannot handle the size of the HD - could that be?? Anyone have an idea how I could get the disk to work?? I would really love to use it, since I wanted
> to use the K-Class 200 as a file server.
> 
> Yours,
> 
> Jay
> 
> 
> 
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 
