Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.planb.de (aldebaran.planb.de [212.227.14.26])
	by dsl2.external.hp.com (Postfix) with ESMTP id CB5A5482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 23 Jan 2002 01:57:07 -0700 (MST)
Date: Wed, 23 Jan 2002 09:57:06 +0100
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] vmlinux header for savecrash.
Message-ID: <20020123095705.A8923@electra.intern.planb.de>
References: <15417.3793.688638.629130@gargle.gargle.HOWL> <20020107034615.9BFD64839@dsl2.external.hp.com> <E16T74R-0002Ko-00@noam.fc.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <E16T74R-0002Ko-00@noam.fc.hp.com>
From: Enrik Berkhan <Enrik.Berkhan@planb.de>
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

On Tue, Jan 22, 2002 at 12:59:03PM -0700, Paul Bame wrote:
> palo removes the "3/vmlinux" parameter (and the initrd= one too) before
> passing command line to the kernel which is consistent with x86 I think.
> Would it be helpful to add a kernel parameter like "palo_kernel=3/vmlinux"
> which you could then retrieve from /proc/cmdline?  I know it's a pain
> to turn 3/vmlinux into /boot/vmlinux but 3/vmlinux is all palo knows.

Hmm, so why don't let palo calculate a CRC32 or MD5 (if affordable)
over the image it is about to boot and pass this as parameter that will
be saved in the dump? This would be very independent of filesystem
changes in the time between boot and crash (e.g. installing a new kernel
moving everything around in /boot). This could also be done for an
initrd image if used. And it still works if you have more than one
kernel image with the same "version" lying around.

Enrik
-- 
Enrik Berkhan                                         plan b. GmbH
                                                      Rüppurrer Straße 4
+49-721-388582 (voice)                                76137 Karlsruhe
+49-721-388581 (fax)                                  Germany
