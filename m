From: James Bottomley <James.Bottomley@HansenPartnership.com>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Tue, 06 Apr 2010 08:44:41 -0500
Message-ID: <1270561481.4493.40.camel@mulgrave.site>
References: <20100405025154.DE1D55160@hiauly1.hia.nrc.ca>
	 <1270484318.2790.38.camel@mulgrave.site>  <4BBABF23.1030405@fsij.org>
	 <1270561069.4493.29.camel@mulgrave.site>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Cc: John David Anglin <dave@hiauly1.hia.nrc.ca>,
	linux-parisc@vger.kernel.org,
	pkg-gauche-devel@lists.alioth.debian.org, 561203@bugs.debian.org
To: NIIBE Yutaka <gniibe@fsij.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <1270561069.4493.29.camel@mulgrave.site>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 2010-04-06 at 08:37 -0500, James Bottomley wrote:
> > (5) Child process B is waken up and sees old value at <x> in
> <oldpage>,
> >     through different cache line.  B sleeps.
> 
> This isn't possible.  at this point, A and B have the same virtual
> address and mapping for <oldpage> this means they are the same cache
> colour, so they both see the cached value.

Perhaps to add more detail to this.  In spite of what the arch manual
says (it says the congruence stride is 16MB), the congruence stride on
all manufactured parisc processors is 4MB.  This means that any virtual
addresses, regardless of space id, that are equal modulo 4MB have the
same cache colour.

James
 

