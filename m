Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id C73454829
	for <parisc-linux@lists.parisc-linux.org>; Tue,  6 May 2003 10:42:09 -0600 (MDT)
Message-Id: <200305061642.h46Gg6FU004016@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Oops on 2.4.20-pa33
To: jsoe0708@tiscali.be (Joel Soete)
Date: Tue, 6 May 2003 12:42:05 -0400 (EDT)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, jbglaw@lug-owl.de,
	parisc-linux@lists.parisc-linux.org
In-Reply-To: <3EB7766A00000392@ocpmta7.freegates.net> from "Joel Soete" at May 6, 2003 06:34:55 pm
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

> +#if defined (__hppa__)
> +	        current->sig->action[sig-1].sa.sa_handler == (void *)SIG_IGN);
> +#else
>  	        current->sig->action[sig-1].sa.sa_handler == SIG_IGN);
> +#endif

You don't need to conditionalize the statement with the cast.  It should
work on all ports.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
