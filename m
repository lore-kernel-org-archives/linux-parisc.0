From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [PATCH, RFC] fix parisc runtime hangs wrt pa_tlb_lock
Date: Sat, 23 May 2009 17:53:26 -0400 (EDT)
Message-ID: <20090523215327.7D3704FA5@hiauly1.hia.nrc.ca>
References: <4A17074D.30602@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: linux-parisc@vger.kernel.org
To: deller@gmx.de (Helge Deller)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <4A17074D.30602@gmx.de> from "Helge Deller" at May 22, 2009 10:13:01 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> So, I think we need to use the irq-blocking functions for purge_tlb_start() and
> purge_tlb_end(). I did tested the patch below, and since then I didn't faced one
> single hang any longer. 

The preceeding comment says that disabling preemption should be sufficient.
Disabling interrupts may be overkill.

I have CONFIG_PREEMPT_NONE set both on my c3750 and rp3440.  I'm starting
to wonder if there is a preemption bug.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
