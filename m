Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 916F5482B
	for <parisc-linux@lists.parisc-linux.org>; Wed,  7 Nov 2001 08:02:42 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 161UDr-00042C-00; Wed, 07 Nov 2001 15:02:35 +0000
Date: Wed, 7 Nov 2001 15:02:35 +0000
From: Matthew Wilcox <willy@debian.org>
To: joel.soete@freebel.net
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] evms_vgscan crash hppa kernel
Message-ID: <20011107150235.G4441@parcelfarce.linux.theplanet.co.uk>
References: <1005144976.3be94b9093186@webmail.tiscalinet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1005144976.3be94b9093186@webmail.tiscalinet.be>; from joel.soete@freebel.net on Wed, Nov 07, 2001 at 03:56:16PM +0100
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

On Wed, Nov 07, 2001 at 03:56:16PM +0100, joel.soete@freebel.net wrote:
> IASQ: 00000000 00000000 IAOQ: 1018c350 1018c354
>  IIR: 48fa0020    ISR: 00000000  IOR: faf00918
>  CPU:        0   CR30: 124fc000 CR31: 10348000
>  ORIG_R28: 124fc508
> 
> a "grep 1018c3 /boot/System.map"
> 1018c394 t evms_ioctl_cmd_get_minor
> 
> I would like to debug this by obtaining a core dump of the kernel after the 
> reboot but I do not know how? (I did not find back the mail explaining how to do 
> it in detail)

1018c350 is before 1018c394, so it's actually in the previous function.

-- 
Revolutions do not require corporate support.
