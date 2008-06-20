From: "Joel Soete" <soete.joel@scarlet.be>
Subject: Re: in ccio_io_pdir_entry(),BUG_ON() seems to break gcc-4.2
	optimization?
Date: Fri, 20 Jun 2008 07:37:35 +0100
Message-ID: <K2R12N$EE2BC94FF8522BA14A496E3C3737DCC9@scarlet.be>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: "grundler" <grundler@parisc-linux.org>,
	"rubisher" <rubisher@scarlet.be>,
	"linux-parisc" <linux-parisc@vger.kernel.org>
To: "dave" <dave@hiauly1.hia.nrc.ca>
Return-path: <linux-parisc-owner@vger.kernel.org>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> > > Does the BUG_ON explaination make sense to you?
> > > 
> > Well I nerver imagine that a compiler can make proof of this kind of
induction spirit ;-) but that's give the sense, tx.
> 
> Yes, the current compiler eliminates a lot of dead code based on induction.
> This occurs a lot when functions are inlined, etc.  Makes debugging a real
> problem.
> 
Thanks Dave (after a while away from this parisc hobby, it's nice to learn
fresh info).

Cheers,
    J.

> Dave
> -- 
> J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
> National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 


