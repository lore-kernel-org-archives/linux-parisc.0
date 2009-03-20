From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: can't compile kernel for parisc
Date: Fri, 20 Mar 2009 15:40:18 -0600
Message-ID: <20090320214018.GA12273@colo.lackof.org>
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
> ld: arch/parisc/kernel/built-in.o(.text+0xc84): cannot handle
> R_PARISC_PCREL12F for .text

Alexander,
can you post the .config file used for this build?
It would be the easiest way for someone else to reproduce the problem.

thanks,
grant
