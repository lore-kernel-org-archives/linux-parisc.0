From: Matthew Evanson <debianuser@twosillies.com>
Subject: [parisc-linux] Debian 4.0 and PCI issues?
Date: Sat, 14 Apr 2007 22:04:49 -0400
Message-ID: <1176602689.4621884127120__48805.1357250244$1416624333$gmane$org@www.twosillies.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1
To: parisc-linux@lists.parisc-linux.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org


First, hats off to those that have made Linux usable on PA-RISC.  

I was wondering if others have had success running Debian 4.0 (or 3.1 testing)
on a C class workstation (specifically C180) with PCI hardware.

Background:
* Own a C180 with the buggy GSCtoPCI hardware (per note A4190A-01)
* Installed a Compaq quad port PCI ethernet card in the box
* System failed to boot due to firmware lockout
* Modified firmware to bypass error and allow booting
* When Linux probes the PCI bus, errors are reported and device is unusable.

Errors thrown are:
    PCI: Unable to handle 64-bit address space for bridge 0000:00:03.0
    PCI: Failed to allocate mem resource #0:1000@f2c00000 for 0000:01:04.0
    PCI: Failed to allocate mem resource #0:1000@f2c00000 for 0000:01:05.0
    PCI: Failed to allocate mem resource #0:1000@f2c00000 for 0000:01:06.0
    PCI: Failed to allocate mem resource #0:1000@f2c00000 for 0000:01:07.0

The e100 module fails to load with the message:
    Cannot find proper PCI device base address, aborting.

I've traced this to the function pci_read_brige_bases in drives/pci/probe.c.  I
built a new kernel that instead of erroring out, reports and ignores
mem_base_hi and mem_limit_hi.  With this new kernel, I am successfully able to
use my PCI hardware.

mem_base_hi and mem_limit_hi both report as 0xffffffff.  This seems to be
incorrect behaviour per the comments in the code.

Ultimately, my question is whether or not those values are expected or if this
is the result of change in behaviour due to my firmware modification?

FYI, I do understand the potential for corruption of data running in this
configuration but the way in which this machine will be utilized is low risk.

Thanks,
--matt

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
