Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mta04bw.bigpond.com (mta04bw.bigpond.com [139.134.6.87])
	by dsl2.external.hp.com (Postfix) with ESMTP id 651C84829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Oct 2002 22:48:37 -0600 (MDT)
Date: Tue, 15 Oct 2002 14:48:34 +1000
From: Peter Lavender <plaven@bigpond.net.au>
To: Steven Pritchard <steve@silug.org>
Cc: Peter Lavender <plaven@bigpond.net.au>,
	PARISC Mailing List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] help!!! apt-get dist-upgrade
Message-ID: <20021015144834.I799@piglet>
Reply-To: plaven@bigpond.net.au
References: <20021015122720.E893@piglet> <20021014225413.A8042@osiris.silug.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021014225413.A8042@osiris.silug.org>; from steve@silug.org on Mon, Oct 14, 2002 at 10:54:13PM -0500
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

* Steven Pritchard (steve@silug.org) wrote:


> On Tue, Oct 15, 2002 at 12:27:20PM +1000, Peter Lavender wrote:
> > Now I have ssh'ed back to the box.  How can I basically reconnect to
> > the process and issue the Y to go ahead and complete the upgrade?
> 
> You can't really.  Next time, after you login, run "screen".  Then,
> when something like this happens, use "screen -D -r" to logout the old
> session and reattach it to your current terminal.
 
Belive it or not, but I usually use screen, however this time I just
logged in a start the apt processes.

> > I'd rather not kill it unless it's safe to do so.
> 
> It should be.  Apt is very good about just picking up where it left
> off on the next run.

Where is what I ended up doing and apt did the irght thing.  Very
encouraging.  :)

Thanks.


Regards,

Pete.

-- 
				Due to a lack of imagination, 
				this signature will remain 
				under construction indefinitely.
