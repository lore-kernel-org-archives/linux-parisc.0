Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from thinkpad.home (pc4-hem11-4-cust39.bre.cable.ntl.com [213.105.90.39])
	by dsl2.external.hp.com (Postfix) with ESMTP id 83BCF483C
	for <parisc-linux@lists.parisc-linux.org>; Tue,  9 Jul 2002 02:30:23 -0600 (MDT)
Date: Tue, 9 Jul 2002 08:29:16 +0100
From: Richard Hirst <rhirst@linuxcare.com>
To: Stephan Trajkoff <stephan@itp.bg>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] k210/819 Zalon driver
Message-ID: <20020709072916.GH6681@sleepie.demon.co.uk>
References: <3D2A9711.4030207@itp.bg>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3D2A9711.4030207@itp.bg>
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

On Tue, Jul 09, 2002 at 10:56:01AM +0300, Stephan Trajkoff wrote:
> Hi,
> why I need to enable PCI/EISA to make available option zalon driver in 
> SCSI drivers?
> My HP K210 don't have PCIs and EISA?!!?!?!?

At the moment you have to enable PCI because that is the way the config
script is organised.  I don't know if zalon support would build without
PCI because it uses the ncr53c8xx driver which normally drives only PCI
chips.  It is an area that needs attention anyway, because if you enable
sym53c8xx_2 you wont get the zalon option at all (which is obviously
wrong).

Richard?!!?!?!?
