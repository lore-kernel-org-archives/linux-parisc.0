Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id AD2E8482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 09:27:43 -0700 (MST)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 16P4Ws-0002MR-00; Fri, 11 Jan 2002 16:27:42 +0000
Date: Fri, 11 Jan 2002 16:27:42 +0000
From: Matthew Wilcox <willy@debian.org>
To: raffo@neuronet.pitt.edu
Cc: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How to configure EISA network card in 715/80
Message-ID: <20020111162742.F26644@parcelfarce.linux.theplanet.co.uk>
References: <3C3F06DD.6050409@verizon.net> <20020111154337.D26644@parcelfarce.linux.theplanet.co.uk> <3C3F0DD1.4040508@verizon.net> <20020111161705.E26644@parcelfarce.linux.theplanet.co.uk> <3C3F1127.8070507@verizon.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <3C3F1127.8070507@verizon.net>; from vze26vn8@verizon.net on Fri, Jan 11, 2002 at 11:21:59AM -0500
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

On Fri, Jan 11, 2002 at 11:21:59AM -0500, Rafael Herrera wrote:
> If it's of any help, the card is connected through an add-on card to the 
> main board. The chips on the add-on card are: TACT84544BPC, TACT84543BPP 
> and TACT84541CPC.

Yep, I'm familiar with that board.  Normally when it's plugged in, PDC
reports the EISA adapter.  Can you try unplugging it & replugging it to
see if that helps?  You cold also try messing around at the PDC prompt,
see whether anything can see it.  As you may have guessed, I have no
idea what the problem is and I'm suggesting things at random :-)

-- 
Revolutions do not require corporate support.
