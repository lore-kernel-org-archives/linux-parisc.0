Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from baldric (baldric.uwo.ca [129.100.10.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id 207F3486B
	for <parisc-linux@lists.parisc-linux.org>; Fri, 22 Aug 2003 08:47:16 -0600 (MDT)
Date: Fri, 22 Aug 2003 10:46:15 -0400
From: Carlos O'Donell <carlos@baldric.uwo.ca>
To: John David Anglin <dave@hiauly3.hia.nrc.ca>
Cc: parisc-linux@lists.parisc-linux.org, dave.anglin@nrc-cnrc.gc.ca
Message-ID: <20030822144615.GF31872@systemhalted>
References: <20030822013931.GD31872@systemhalted> <200308220304.XAA11565@hiauly3.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200308220304.XAA11565@hiauly3.hia.nrc.ca>
Subject: [parisc-linux] Re: [glibc] fixing delayed exceptions in hppa
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

On Thu, Aug 21, 2003 at 11:04:44PM -0400, John David Anglin wrote:
> > Comments more than welcome, I'll be submitting this upstream if nobody
> > has any quibles with my gcc asm :)
> 
> See <http://lists.parisc-linux.org/hypermail/parisc-linux/10549.html>.

I took this into account, and the fcpy of a non fr0 is working better
than before precisely for the reasons you list your original email.

Should I instead spill the value into memory at dummy's address?

c.
