From: Matthew Wilcox <willy@debian.org>
Subject: [parisc-linux] Re: no screens found on C240
Date: Tue, 13 May 2003 13:44:38 +0100
Message-ID: <20030513124438.GH29534__21178.3731393099$1416622449$gmane$org@parcelfarce.linux.theplanet.co.uk>
References: <005c01c3194a$8f0e01c0$980173c1@moviem.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: debian-hppa@lists.debian.org, parisc-linux@parisc-linux.org
To: Alan Hunter <a.hunter@moviem.co.uk>
Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
In-Reply-To: <005c01c3194a$8f0e01c0$980173c1@moviem.co.uk>
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

On Tue, May 13, 2003 at 01:24:11PM +0100, Alan Hunter wrote:
> I can't get X started on a C240 and don't have sufficient background to get to grips with the problem.
> 
> Here's what dmesg says:
> STI GSC/PCI graphics driver version 0.9
> STI PCI graphic ROM found at f1e00000 (2048 kB), fb at f6000000 (32 MB)
> STI word mode ROM at f1e00044, hpa at f6000000
> STI id 2fc1066b-9a02587, conforms to spec rev. 8.09
> STI device: HPA4552A
> stifb: Unsupported gfx card id 0x2fc1066b

A4552A is the FX2 card and is unsupported; I saw someone offering to
swap an EG card (which is supported) for an FX card a couple of days
ago on this list.  Perhaps they're still interested?

-- 
"It's not Hollywood.  War is real, war is primarily not about defeat or
victory, it is about death.  I've seen thousands and thousands of dead bodies.
Do you think I want to have an academic debate on this subject?" -- Robert Fisk
