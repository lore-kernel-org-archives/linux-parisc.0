Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] [RFC] Patch to handle parisc-device quirks/bugs. 
In-Reply-To: Message from Ryan Bradetich <rbradetich@uswest.net>
   of "17 Nov 2002 12:05:09 MST." <1037559910.26816.9.camel@beavis>
References: <1037559910.26816.9.camel@beavis> 
Date: Sun, 17 Nov 2002 12:33:54 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20021117193354.21EEE482E@dsl2.external.hp.com>
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

Ryan Bradetich wrote:
> The one thing I do not like is depending upon the HPA of the
> device to determine the quirk, but I could not think of a 
> different/better way to handle this.

Could you also check the IODC device type?
Or is that also wrong?
If HPA and type match, then I'd be comfortable with it.

grant
