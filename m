Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from pippin.tausq.org (gandalf.tausq.org [64.81.244.94])
	by dsl2.external.hp.com (Postfix) with ESMTP id DD8D14829
	for <parisc-linux@lists.parisc-linux.org>; Sun,  8 Dec 2002 23:15:27 -0700 (MST)
Date: Sun, 8 Dec 2002 22:19:13 -0800
From: Randolph Chung <tausq@debian.org>
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: carlos@baldric.uwo.ca, parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: Trap handler
Message-ID: <20021209061913.GM21187@tausq.org>
Reply-To: Randolph Chung <tausq@debian.org>
References: <20021208232601.GH21187@tausq.org> <200212082355.gB8NtUAe010825@hiauly1.hia.nrc.ca> <20021209051214.GK21187@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20021209051214.GK21187@tausq.org>
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

> > Here it is.
> 
> well, something is just very broken, even this simple code triggers the
> bug:

and with Grant's help, it's fixed in 2.4.20-pa12 :)

question for willy/jsm, etc though:
the fix has to do with where we should return to after handling an
interruption. in pre-2.4.20 code we used to return to intr_return. Grant
thinks that is incorrect and changed it to intr_restore (basically just
doing the rfi). the -pa12 patch changes it back so it will handle
pending signals. The items that remain not handled are restoring I-bit,
softirqs (and irqstats) and rescheduling. We are not sure if those bits
are needed for interruptions....  can you guys shed some light on this?

thanks,
randolph
