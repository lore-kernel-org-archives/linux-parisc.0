From: "Jeff Bailey" <jbailey@raspberryginger.com>
Subject: [parisc-linux] Nonexistance of asm/offsets.h
Date: Fri, 13 Jul 2007 19:10:57 -0400
Message-ID: <5b2e36650707131610u7b158370ya591e2076ec980ac__39698.9310779192$1416624412$gmane$org@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=UTF-8;
  format=flowed
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
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

In the process of getting the world up, running and debugged with
NPTL, Randolph has provided a patch to make gdb work better.  Building
this on Ubuntu turned out to be a problem because we're using the
exported kernel headers rather than the mashup that Debian has been
using.

The challenge is that the Debian kernel packages used to generate
asm/offsets.h from the 64-bit kernel build's asm-offsets.h and make
that available.  When we created linux-kernel-headers, we just
imported that.

Now, with the sanitised kernel headers being produced from the kernel
source, this no longer seems right.  It means that there's a header
that's not right for both 32-bit and 64-bit userspace, and it's being
generated, so it might change by accident and break the userspace ABI.
 I'd like to propose that we create a hand-crafted offsets.h that is
intended for userspace consuption and then stop generating the
asm-offsets.h file at build time.  I'll put together a patch to do
this over the weekend unless there's objections.

-- 
Jeff Bailey - http://www.raspberryginger.com/jbailey/
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
