Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from server1.neuronet.pitt.edu (server1.neuronet.pitt.edu [150.232.128.42])
	by dsl2.external.hp.com (Postfix) with ESMTP id 8A622482A
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 10:56:54 -0700 (MST)
Received: from neuronet.pitt.edu (host10a.neuronet.pitt.edu [150.232.128.120])
	by server1.neuronet.pitt.edu (8.8.8/8.8.8) with ESMTP id MAA05965
	for <parisc-linux@lists.parisc-linux.org>; Fri, 11 Jan 2002 12:56:57 -0500 (EST)
Message-ID: <3C3F26C5.30801@neuronet.pitt.edu>
Date: Fri, 11 Jan 2002 12:54:13 -0500
From: "Rafael E. Herrera" <raffo@neuronet.pitt.edu>
MIME-Version: 1.0
To: parisc-linux <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How to configure EISA network card in 715/80
References: <3C3F06DD.6050409@verizon.net> <20020111154337.D26644@parcelfarce.linux.theplanet.co.uk> <3C3F0DD1.4040508@verizon.net> <20020111161705.E26644@parcelfarce.linux.theplanet.co.uk> <3C3F1127.8070507@verizon.net> <20020111162742.F26644@parcelfarce.linux.theplanet.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
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

Matthew Wilcox wrote:

> On Fri, Jan 11, 2002 at 11:21:59AM -0500, Rafael Herrera wrote:
> 
>>If it's of any help, the card is connected through an add-on card to the 
>>main board. The chips on the add-on card are: TACT84544BPC, TACT84543BPP 
>>and TACT84541CPC.
> 
> Yep, I'm familiar with that board.  Normally when it's plugged in, PDC
> reports the EISA adapter.  Can you try unplugging it & replugging it to
> see if that helps?  You cold also try messing around at the PDC prompt,
> see whether anything can see it.  As you may have guessed, I have no
> idea what the problem is and I'm suggesting things at random :-)


I'll try when I get back home.

Raf
