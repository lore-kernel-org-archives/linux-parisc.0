From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: first post
Date: Sat, 15 Dec 2007 19:18:59 -0500 (EST)
Message-ID: <200712160018.lBG0IxPR015488@hiauly1.hia.nrc.ca>
References: <200712032240.lB3MeY2o027337@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: kyle@mcmartin.ca, linux-parisc@vger.kernel.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <200712032240.lB3MeY2o027337@hiauly1.hia.nrc.ca> from "John David Anglin" at Dec 3, 2007 05:40:34 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> I'm giving your timer IRQ patch a whirl with 2.6.22.14.  Hoping it might
> fix the timeouts that randomly occur in the GCC testsuite and the ocassional
> problem with make.

I realized recently that I'm not seeing these timeouts in my UP
testsuite runs.  So, I'm now wondering if this could be due to the
lack of synchonization across CPUs of CR16.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
