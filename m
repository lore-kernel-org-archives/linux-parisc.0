Received: from mailserv2.iuinc.com (IDENT:qmailr@mailserv2.iuinc.com [206.245.164.55])
	by puffin.external.hp.com (8.9.3/8.9.3) with SMTP id KAA23118
	for <parisc-linux@puffin.external.hp.com>; Fri, 14 Jul 2000 10:44:55 -0600
To: David Huggins-Daines <dhd@linuxcare.com>
cc: Alan Modra <alan@linuxcare.com.au>, Paul Bame <bame@noam.fc.hp.com>,
        Alan Modra <amodra@puffin.external.hp.com>,
        parisc-linux@thepuffingroup.com
Subject: Re: [parisc-linux] Non-bootable kernel problems 
Reply-To: law@cygnus.com
In-reply-to: Your message of 14 Jul 2000 12:02:37 EDT.
             <87lmz4zoma.fsf@linuxcare.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 14 Jul 2000 10:37:36 -0600
Message-ID: <1970.963592656@upchuck>
From: Jeffrey A Law <law@cygnus.com>
List-ID: <linux-parisc.vger.kernel.org>



  In message <87lmz4zoma.fsf@linuxcare.com>you write:
  > Jeffrey A Law <law@cygnus.com> writes:
  > 
  > >   In message <Pine.LNX.4.21.0007141038590.15538-100000@front.linuxcare.co
  > m.au>y
  > > ou write:
  > >   > Zap these two lines, and I think the problem will go away.
  > > But that's totally the wrong thing to do as it will break hpux.
  > > 
  > > The linker is the problem.
  > 
  > I've conditionalized it on the existence of GNU ld, is that okay?
No, because you're working around a bug in GNU-ld.  GCC is following
the defined behavior for the PA32 ABI.
jeff
