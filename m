Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from mail.apptechsys.com (mail.apptechsys.com [207.14.35.131])
	by dsl2.external.hp.com (Postfix) with ESMTP id D3D00482A
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 12:56:05 -0600 (MDT)
Received: from garibaldi.apptechsys.com (ats164.apptechsys.com [207.14.35.164])
	by mail.apptechsys.com (Postfix) with ESMTP id D19D67BC45
	for <parisc-linux@lists.parisc-linux.org>; Wed, 29 May 2002 11:56:04 -0700 (PDT)
Date: Wed, 29 May 2002 11:56:04 -0700 (PDT)
From: Jeremy Drake <jeremyd@apptechsys.com>
To: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: <20020527223132.661F54843@dsl2.external.hp.com>
Message-ID: <Pine.LNX.4.44.0205291152060.11012-100000@garibaldi.apptechsys.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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

OK, I just tried pa30.  It boots successfully, but just died doing apt-get 
update:
Fetched 554B in 10s (53B/s)
apt-get(320): unaligned access to 0x403ce094 at ip=0x4005e47f
Reading Package

And there it stopped.  I don't know what it's doing but I'll see what kind 
of info I can get from it.

These "unaligned access" messages only show up when running smp.  apt-get 
works perfectly with a UP kernel...

I should set up a webcam pointing at the LCD screen of that box, so I can 
look at it remotely, to know if it HPMC'd or just locked up...

-- 
He missed an invaluable opportunity to hold his tongue.
		-- Andrew Lang
