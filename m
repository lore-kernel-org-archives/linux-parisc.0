Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from osiris.silug.org (osiris.silug.org [64.240.156.225])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD0714829
	for <parisc-linux@lists.parisc-linux.org>; Mon, 14 Oct 2002 21:54:41 -0600 (MDT)
Date: Mon, 14 Oct 2002 22:54:13 -0500
From: Steven Pritchard <steve@silug.org>
To: Peter Lavender <plaven@bigpond.net.au>
Cc: PARISC Mailing List <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] help!!! apt-get dist-upgrade
Message-ID: <20021014225413.A8042@osiris.silug.org>
References: <20021015122720.E893@piglet>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021015122720.E893@piglet>; from plaven@bigpond.net.au on Tue, Oct 15, 2002 at 12:27:20PM +1000
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

On Tue, Oct 15, 2002 at 12:27:20PM +1000, Peter Lavender wrote:
> Now I have ssh'ed back to the box.  How can I basically reconnect to
> the process and issue the Y to go ahead and complete the upgrade?

You can't really.  Next time, after you login, run "screen".  Then,
when something like this happens, use "screen -D -r" to logout the old
session and reattach it to your current terminal.

> I'd rather not kill it unless it's safe to do so.

It should be.  Apt is very good about just picking up where it left
off on the next run.

Steve
-- 
steve@silug.org           | Southern Illinois Linux Users Group
(618)398-7360             | See web site for meeting details.
Steven Pritchard          | http://www.silug.org/
