Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 4D584482A
	for <parisc-linux@lists.parisc-linux.org>; Sat,  2 Feb 2002 07:24:37 -0700 (MST)
Date: Sat, 2 Feb 2002 14:13:13 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: DJ Tha Muggs <djmuggs@primare.xs4all.nl>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] CD-Rom installation troubles 785/C3000
Message-ID: <20020202141313.GE2884@sleepie.demon.co.uk>
References: <20020202151831.B26371@primare.xs4all.nl>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20020202151831.B26371@primare.xs4all.nl>
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

On Sat, Feb 02, 2002 at 03:18:31PM +0100, DJ Tha Muggs wrote:
> Hi,
> 
> I just started installing parisc-linux for the first time on my C3000.
> I Hooked up an SE SCSI CD-Rom to the narrow connector on the back.
> 
> The systems sees the CD-Rom and also is booting fine from this CD-Rom.
> After partitioning the Harddisk and mounting it, it is ready to install the kernel.
> When i do this it asks me for the installation medium, this is my CD-Rom where i booted it from, but it is not able to find it.
> 
> I went into the shell mode and did a DMESG, but i was not able to find my SCSI cd-rom in there :(
> 
> Can anyone tell what goes wrong and tell me how to fix this?

See the relevant entry on

<http://www.parisc-linux.org/release-0.9/errata-093.html>


Richard
