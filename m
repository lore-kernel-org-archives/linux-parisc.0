Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id 72D4D4840
	for <parisc-linux@parisc-linux.org>; Sun, 23 Nov 2003 15:03:18 -0700 (MST)
Message-ID: <3FC12EA5.8040809@tiscali.be>
Date: Sun, 23 Nov 2003 22:03:17 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Cc: randolph@tausq.org, carlos@baldric.uwo.ca,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Tool chain pb
References: <200311232149.hANLnfGf028937@hiauly1.hia.nrc.ca>
In-Reply-To: <200311232149.hANLnfGf028937@hiauly1.hia.nrc.ca>
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


John David Anglin wrote:
>>I trust you; i don't want even check :(.
>>But somewhere there would have no fun if all was sinply portable ;)
> 
> 
> It's not portable because the insn sequences for calls vary from
> one machine to another.  On the PA, there are several sequences
> for calls on the PA.
> 
> Probably, after the libffi port is completed and java is working,
> we will try to implement the TLS support.
> 
Dave,

Just to have an overview, is there another risc platform (sparc, ia64, 
...) on which it is already implemented?

Thanks,
	Joel
