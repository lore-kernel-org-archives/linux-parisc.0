From: Kyle McMartin <kyle@mcmartin.ca>
Subject: Re: can't compile kernel for parisc
Date: Thu, 2 Apr 2009 11:52:26 -0400
Message-ID: <20090402155226.GC14159@bombadil.infradead.org>
References: <a4423d670903030457k20f2e975ya567e9d3b1a5a3ab@mail.gmail.com> <20090303163348.422E34E9A@hiauly1.hia.nrc.ca> <a4423d670903180455u20ead146k919426a1fb7276c6@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	carlos@systemhalted.org, linux-parisc@vger.kernel.org
To: Alexander Beregalov <a.beregalov@gmail.com>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <a4423d670903180455u20ead146k919426a1fb7276c6@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Wed, Mar 18, 2009 at 02:55:13PM +0300, Alexander Beregalov wrote:
> 
> I have recompiled kernel with -ffunction-sections, but still the same problem.
> 

This is wrong... the kernel is always built with -ffunction-sections,
see arch/parisc/Makefile:

# Without this, "ld -r" results in .text sections that are too big
# (> 0x40000) for branches to reach stubs.
cflags-y        += -ffunction-sections

cheers, Kyle
