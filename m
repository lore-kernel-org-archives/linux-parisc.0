Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5BD44482E
	for <parisc-linux@lists.parisc-linux.org>; Thu, 14 Nov 2002 06:33:32 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 18CK7a-00059F-00; Thu, 14 Nov 2002 13:33:26 +0000
Date: Thu, 14 Nov 2002 13:33:26 +0000
From: Matthew Wilcox <willy@debian.org>
To: phi <phi@hpfrcu81.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] .PARISC.unwind where is it for pa2.0w?
Message-ID: <20021114133326.W30392@parcelfarce.linux.theplanet.co.uk>
References: <3DD2C4E5.7000001@gmx.at> <20021113215411.GB32441@beavis.ybsoft.com> <3DD3A56F.665A0FB4@hpfrcu81.france.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DD3A56F.665A0FB4@hpfrcu81.france.hp.com>; from phi@hpfrcu81.france.hp.com on Thu, Nov 14, 2002 at 02:30:23PM +0100
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

On Thu, Nov 14, 2002 at 02:30:23PM +0100, phi wrote:
> Hi All,
> 
> Where is the "Section: .PARISC.unwind" for palinux2.0w doing an elfdump on the
> kernel I don't see it?
> 
> Is it implemented differently

looks like we link it into the .text section:

  .text BLOCK(16) : {
        *(.text*)
        *(.PARISC.unwind)
        *(.fixup)
        *(.lock.text)           /* out-of-line lock text */
        *(.gnu.warning)
        } = 0

(arch/parisc/vmlinux64.lds for linux-2.4; arch/parisc/vmlinux.lds.S
for linux-2.5).  why we do this, i don't know; i'm not a toolchain kind
of guy ;-)

-- 
Revolutions do not require corporate support.
