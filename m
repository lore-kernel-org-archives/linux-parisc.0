Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from hiauly1.hia.nrc.ca (hiauly1.hia.nrc.ca [132.246.100.193])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5D05E4840
	for <parisc-linux@parisc-linux.org>; Sun, 23 Nov 2003 14:49:43 -0700 (MST)
Message-Id: <200311232149.hANLnfGf028937@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Tool chain pb
To: soete.joel@tiscali.be (Joel Soete)
Date: Sun, 23 Nov 2003 16:49:41 -0500 (EST)
From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, carlos@baldric.uwo.ca,
	parisc-linux@parisc-linux.org
In-Reply-To: <3FC11F88.5040409@tiscali.be> from "Joel Soete" at Nov 23, 2003 08:58:48 pm
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

> I trust you; i don't want even check :(.
> But somewhere there would have no fun if all was sinply portable ;)

It's not portable because the insn sequences for calls vary from
one machine to another.  On the PA, there are several sequences
for calls on the PA.

Probably, after the libffi port is completed and java is working,
we will try to implement the TLS support.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
