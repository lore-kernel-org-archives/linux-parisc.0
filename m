Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from smtp-out.tiscali.be (spoolo2.tiscali.be [62.235.13.211])
	by dsl2.external.hp.com (Postfix) with ESMTP id ACBFE4840
	for <parisc-linux@parisc-linux.org>; Sun, 23 Nov 2003 11:42:46 -0700 (MST)
Message-ID: <3FC0FFA7.1090605@tiscali.be>
Date: Sun, 23 Nov 2003 18:42:47 +0000
From: Joel Soete <soete.joel@tiscali.be>
MIME-Version: 1.0
To: Randolph Chung <randolph@tausq.org>
Cc: Carlos O'Donell <carlos@baldric.uwo.ca>,
	parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] Tool chain pb
References: <3FC0EEA5.1040009@tiscali.be> <20031123175744.GR975@tausq.org>
In-Reply-To: <20031123175744.GR975@tausq.org>
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

Randolph,

Thanks, I see:

change --enable-add-ons by --enable-add-ons=linuxthreads help to avoid 
to compile nptl.

Sorry to not being of more help (not enough knowledge to start more 
hacking about support __thread) :(

Joel

Randolph Chung wrote:
>>but I don't see how can I add 'support for __thread' to gcc.
> 
> 
> this (nptl) is not yet supported on hppa, we've discussed this several
> times but no one yet has time to work on it.
> 
> randolph
