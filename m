Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from typhon.homeip.net (voltaire-102-1-10.net1.nerim.net [213.41.188.10])
	by dsl2.external.hp.com (Postfix) with ESMTP id 100704834
	for <parisc-linux@lists.parisc-linux.org>; Wed, 12 Mar 2003 09:32:38 -0700 (MST)
Date: Wed, 12 Mar 2003 17:32:36 +0100
From: Lyonel Vincent <vincentl@ec-lyon.fr>
To: parisc-linux@lists.parisc-linux.org
Message-ID: <20030312173235.A4332@typhon.pilat.fr>
Reply-To: vincentl@ec-lyon.fr
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Subject: [parisc-linux] enumerating devices from user space
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

Hi there,

I'm currently implementing a small tool called lshw (you can find it on
Freshmeat) that enumerates installed devices on a machine and reports them
as a device tree (text, HTML and XML).
For now it knows about DMI, PCI busses, SCSI, IDE and PCMCIA and I would
like to port it to PA-RISC Linux. I already get some very basic info from
/proc/cpuinfo.
Does anyone know how I can access the device tree as seen by the kernel?
(much like HP-UX's ioscan does and what is shown in dmesg)
I've tried digging in /proc without much success... is there a way to get
this information from user space? PPC Linux exposes the device tree in
/proc for example. A mechanism similar to /proc/bus/pci/devices (machine-
parseable text) would be great, too.

thanks for your help,
Lyonel.

PS: I noticed that /proc/iomem lists 00000000-000009ff as "PDC data (Page
Zero)", is there a chance I can find what I need there? (I dd-ed it from
/dev/mem but I can't say if it contains useful data...)

-- 
The software said it requires Windows 2000 or better, so I installed Linux.
