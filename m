Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.speakeasy.net (mail14.speakeasy.net [216.254.0.214])
	by dsl2.external.hp.com (Postfix) with ESMTP id 77F974845
	for <parisc-linux@lists.parisc-linux.org>; Tue, 11 Jun 2002 08:58:55 -0600 (MDT)
Date: Tue, 11 Jun 2002 07:58:48 -0700
From: Randolph Chung <randolph@tausq.org>
To: "Michael S. Zick" <mszick@goquest.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18-pa35 SMP process hangs on a J200
Message-ID: <20020611145848.GA2796@tausq.org>
Reply-To: Randolph Chung <randolph@tausq.org>
References: <5BA66B90-7D12-11D6-B01F-0030656F07A2@esiee.fr> <02061107100403.00732@localhost.localdomain>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <02061107100403.00732@localhost.localdomain>
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

> I SEEM to experience a similar situation on 2.4.18-linux-x86-SMP using the 
> P111-S processors (with 512K L2 cache).
> Quite rare; evidently some very small window for failure.
> I don't have any solid leads yet (although I have theories).

On hppa this is quite easy to reproduce. When Dave is compiling gcc we
can crash the box every hour or so.... :-)

It's interesting to note that even with a UP kernel on the rp2470, the
kernel doesn't seem to be very stable (though better than SMP).... I
think we are looking at multiple bugs here.....

randolph
-- 
   @..@                                         http://www.TauSq.org/
  (----)
 ( >__< )
 ^^ ~~ ^^
