Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id DBE124829
	for <parisc-linux@lists.parisc-linux.org>; Wed, 13 Nov 2002 14:54:15 -0700 (MST)
Date: Wed, 13 Nov 2002 14:54:11 -0700
To: Christoph Plattner <christoph.plattner@gmx.at>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] ? New status of MUX or SCSI driver on E-series (and other...)
Message-ID: <20021113215411.GB32441@beavis.ybsoft.com>
References: <3DD2C4E5.7000001@gmx.at>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3DD2C4E5.7000001@gmx.at>
From: rbrad@uswest.net (Ryan Bradetich)
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

Hello Christoph,


On Wed, Nov 13, 2002 at 10:32:21PM +0100, Christoph Plattner wrote:
> After such long time, I want to ask, if there any news?
> 
> Where there experiences (with logic analysator, etc...), if the
> SCSI chip is accessed ?

On the todo list ... still no forward progress yet :(

> Are there any news in accessing another port then port "0" on the
> MUX. My experiments using "only" port "1" was also not successful,
> the machine blocks !

The mux has been ported to linux-2.5, the major number 11 was assigned,
and linus accepted it into his tree.  Last night I found the problem
that caused the init failure with the mux so the mux boots again
on 2.5.47.  The forward port is more flexible and is better designed 
to handle handle multiple muxes and the access to the ports.  I am
working with robbie to test the multiple mux cards now, and plan to
test the multiple ports here shortly (need to find my cables first.)


On a side note, I have also port-forwarded the pdc_console to the 
linux-2.5 tree and will finish testing it here shortly.  I will send 
you the updated pdc_console to review before I commit it.

> Perhaps the PDC ROM setup influences the MUX device.

Not sure ... planning on testing shortly  (this weekend possibly)

Thanks,

- Ryan


> Answer is welcome.
> Christoph
> 
> 
> 
> 
> -- 
> -------------------------------------------------------
> private:	christoph.plattner@gmx.at
> company:	christoph.plattner@alcatel.at
> 
> _______________________________________________
> parisc-linux mailing list
> parisc-linux@lists.parisc-linux.org
> http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
> 

-- 
