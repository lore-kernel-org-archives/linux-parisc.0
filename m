Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from viefep13-int.chello.at (viefep13-int.chello.at [213.46.255.15])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7AE9C4862
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Mar 2002 14:57:53 -0700 (MST)
Message-ID: <3C8FCB5D.1F73348D@gmx.at>
Date: Wed, 13 Mar 2002 22:57:49 +0100
From: Christoph Plattner <christoph.plattner@gmx.at>
MIME-Version: 1.0
To: "Dreeling, Michael" <michael.dreeling@marconi.com>
Cc: "'parisc-linux@lists.parisc-linux.org'" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] E35 816 Server & PA/Linux
References: <0725120622E7D411AEF70020485A6B0CD71AF5@dl-msgusr-01.eu.fore.com>
Content-Type: text/plain; charset=us-ascii
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

You may have a chance, using this machine as a diskless machine
with NFS ROOT file system.

We have added a "PDC ROM console" driver to the kernel (I needed this
for my E55). You can compile a kernel with the CONFIG_PDC_CONSOLE
(config under "Non-standard serial port support" under "Character
Devices")
and follow the setup instruction in the HELP of CONFIG_PDC_CONSOLE.
(Creating the device `/dev/ttyB0' and setting up the `console=ttyB0'
kernel line parameter and modify `/etc/inittab'.

If it is the same as on my E55, you cannot access the serial ports
(MDP MUX board with 8 serial), the parallel port and the SCSI interface.
The serial port-0 on the MUX is used a PDC console (default setup),
and the new linux driver accesses this ROM PDC console (port 0).

The core machine and ethernet is working on my E55.

I hope this helps and good luck

Christoph P.



"Dreeling, Michael" wrote:
> 
> Hi People,
> I've got a newly acquired E35 816 Server which i'm trying to stick PA-Linux
> onto.
> Unfortunately i get this old error, which i have seen many people have
> problems with.
> 
> Loading ramdisk 1946807 bytes @ 03e14000...
> Branching to kernel entry point 0x00100000.  If this is the last
> message you see, you may need to switch your console.  This is
> a common symptom -- search the FAQ and mailing list at parisc-linux.org
> 
> I had seen on the site that someone had an E35 up and running (in the
> Hardware Database)
> but i also know that the E Series are officially unsupported. I tried the
> 0.93 (latest) Version from the 50MB ISO.
> Is there any way i can get parisc lunix onto this Box??
> 
> Thanks
> Michael
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux

-- 
-------------------------------------------------------
private:	christoph.plattner@gmx.at
company:	christoph.plattner@alcatel.at
