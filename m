From: Herb Radford <herbr@magma.ca>
Subject: [parisc-linux] B180 boot problem
Date: Sat, 13 May 2006 15:21:17 -0400
Message-ID: <7.0.1.0.1.20060513143945.01f61810@magma.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed;
  x-avg-checked=avg-ok-4F3E348F
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

I have a B180 machine which was loaded with a version of linux back in 1993.
I'm trying to start fresh and tried to boot the 3.1r2 cd 
"debian-hppa-binary-1.iso" to install.
I consistently get a mangled message just above the tux on the boot 
screen which says something to the effect:

Kernel panic: Kernel Fault4/0xb0cr31:10....., IRQ sharing enabled

I have tried various burns at various speed of the same cd with the 
same results.
I have interacted with the IPL and tried setting some variations on a 
"sensible" set of parameters to pass to the kernel.
When I clear ALL the entries to be passed to the kernel, I get an 
unable to mount root message so I started adding some root and initrd 
items to the parameters.
I just can't find the correct parameters to allow the box to boot!

What is/are the correct set of parameters to be passed to the kernel?

Regards, Herb


-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.1.392 / Virus Database: 268.5.6/338 - Release Date: 12/05/2006


_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
