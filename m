Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from beavis.ybsoft.com (bradetich.net [209.161.7.161])
	by dsl2.external.hp.com (Postfix) with ESMTP id 6E24F482E
	for <parisc-linux@lists.parisc-linux.org>; Sun, 17 Nov 2002 12:57:00 -0700 (MST)
Subject: Re: [parisc-linux] [RFC] Patch to handle parisc-device quirks/bugs.
From: Ryan Bradetich <rbradetich@uswest.net>
To: Grant Grundler <grundler@dsl2.external.hp.com>
Cc: parisc-linux@lists.parisc-linux.org
In-Reply-To: <20021117193354.21EEE482E@dsl2.external.hp.com>
References: <1037559910.26816.9.camel@beavis>  
	<20021117193354.21EEE482E@dsl2.external.hp.com>
Content-Type: text/plain
Date: 17 Nov 2002 12:56:55 -0700
Message-Id: <1037563016.26816.12.camel@beavis>
Mime-Version: 1.0
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

Grant,

I test the hpa, hw_type, hversion, and sversion for the quirk.  If all
these match, then I update the parisc_device_id with the device it
should be.

+               if((dev->hpa == list->hpa) &&
+                       (dev->id.hw_type == list->quirk.hw_type) &&
+                       (dev->id.hversion == list->quirk.hversion) &&
+                       (dev->id.sversion == list->quirk.sversion))


Thanks,

- Ryan


On Sun, 2002-11-17 at 12:33, Grant Grundler wrote:
> Ryan Bradetich wrote:
> > The one thing I do not like is depending upon the HPA of the
> > device to determine the quirk, but I could not think of a 
> > different/better way to handle this.
> 
> Could you also check the IODC device type?
> Or is that also wrong?
> If HPA and type match, then I'd be comfortable with it.
> 
> grant
> 
