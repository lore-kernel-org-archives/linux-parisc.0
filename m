Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hems4-0-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 12027482A
	for <parisc-linux@lists.parisc-linux.org>; Tue,  7 May 2002 02:33:06 -0600 (MDT)
Date: Tue, 7 May 2002 09:12:35 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: DerrickMcCray@aol.com
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] HP 9000 systems
Message-ID: <20020507081235.GG1617@sleepie.demon.co.uk>
References: <110.11d06265.2a08e5e6@aol.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <110.11d06265.2a08e5e6@aol.com>
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

On Tue, May 07, 2002 at 04:10:14AM -0400, DerrickMcCray@aol.com wrote:
> Hi, 
> I recently ran across some HP 9000 715/80 and 712/60 computers at a garage 
> sale and bought 4 systems for 70 dollars. There is no operating system on the 
> computers and no cd-rom drive. My question is how can a get PA-Risc Linux 
> installed on these machines because I can't seem to get the systems to boot 
> from the floppy drive. What is the best way to get PA-Risc Linux installed on 
> the systems. Any information will be greatly appreciated. Thank you.

Floppy is not correctly supported.

You should be able to network boot them without much trouble.  See
<http://www.tldp.org/HOWTO/PA-RISC-Linux-Boot-HOWTO/> for pointers.  You
can start a debian install by booting a lifimage from:
<http://ftp.uk.debian.org/debian/dists/woody/main/disks-hppa/3.0.22-2002-04-03/lifimage>

Richard
