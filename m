Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtpde02.sap-ag.de (smtpde02.sap-ag.de [194.39.131.53])
	by dsl2.external.hp.com (Postfix) with ESMTP id A10324868
	for <parisc-linux@lists.parisc-linux.org>; Wed,  6 Mar 2002 08:24:37 -0700 (MST)
Content-Type: text/plain;
  charset="iso-8859-1"
From: Helge Deller <helge.deller@sap.com>
To: Ralf Hildebrandt <Ralf.Hildebrandt@charite.de>,
	parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] not freeing initmem?
Date: Wed, 6 Mar 2002 16:24:35 +0100
References: <20020306151913.GO787@charite.de>
In-Reply-To: <20020306151913.GO787@charite.de>
MIME-Version: 1.0
Message-Id: <E16idHP-0003pp-00@linuxlab.wdf.sap-ag.de>
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

There is still one or more __init 's too much somewhere. 
If we would free the memory without fixing/finding this place first, 
the kernel will crash.

Helge

On Wednesday 06 March 2002 16:19, Ralf Hildebrandt wrote:
> From my dmesg output of the recent 2.4.18-pa3:
>
> ...
> EXT3-fs: mounted filesystem with ordered data mode.
> VFS: Mounted root (ext3 filesystem) readonly.
> NOT FREEING INITMEM (351k)
> Adding Swap: 124800k swap-space (priority -1)
> EXT3 FS 2.4-0.9.17, 10 Jan 2002 on sd(8,3), internal journal
> ...
>
> What does that mean? Why is the memory not freed on PA-RISC, but freed
> on x86?
>
> On my x86 box:
>
> ...
> EXT3-fs: mounted filesystem with ordered data mode.
> VFS: Mounted root (ext3 filesystem) readonly.
> Freeing unused kernel memory: 224k freed
> EXT3 FS 2.4-0.9.17, 10 Jan 2002 on ide0(3,2), internal journal
> Real Time Clock Driver v1.10e
> ...

-- 
Helge Deller
SAP AG - LinuxLab and Unix Platforms
email: helge.deller@sap.com
Phone: +49 6227 7 - 67783
