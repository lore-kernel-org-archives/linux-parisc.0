From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: in ccio_io_pdir_entry(), BUG_ON() seems to break gcc-4.2    optimization?
Date: Thu, 19 Jun 2008 18:48:11 -0400 (EDT)
Message-ID: <20080619224813.6F4934DF8@hiauly1.hia.nrc.ca>
References: <485AB72B.2090304@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: grundler@parisc-linux.org, rubisher@scarlet.be,
	linux-parisc@vger.kernel.org
To: soete.joel@scarlet.be (Joel Soete)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <485AB72B.2090304@scarlet.be> from "Joel Soete" at Jun 19, 2008 07:44:43 pm
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > Does the BUG_ON explaination make sense to you?
> > 
> Well I nerver imagine that a compiler can make proof of this kind of induction spirit ;-) but that's give the sense, tx.

Yes, the current compiler eliminates a lot of dead code based on induction.
This occurs a lot when functions are inlined, etc.  Makes debugging a real
problem.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
