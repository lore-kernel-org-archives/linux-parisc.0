Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Audio on J5k 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Sun, 23 Jun 2002 23:45:01 PDT." <Pine.LNX.4.44.0206232342380.17764-100000@garibaldi.apptechsys.com>
References: <Pine.LNX.4.44.0206232342380.17764-100000@garibaldi.apptechsys.com> 
Date: Mon, 24 Jun 2002 08:08:56 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020624140856.697D64836@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> Are there any plans to support the AD whatever that is in the J5k?  Is 
> there documentation available?

yes and yes.

Randolph Chung (tausq@debian.org) had started hacking on this driver
since he also has a C3000. He hasn't had time to get it working
and should probably just post his "patch" to ftp.p-l.org in case
someone else wants to (try to) make it work.

I've posted documentation in April on this chip:
	gsyprf10.external.hp.com:/pub/grundler/AD1889.pdf

(from memory, it's there:
-r--r--r--    1 grundler users      124255 Apr 24 21:28 AD1889.pdf
)

grant
